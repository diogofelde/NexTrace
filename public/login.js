const DEBUG = new URLSearchParams(location.search).has("debug");

function log(...args) {
  if (DEBUG) console.log("[login]", ...args);
}
function showError(msg) {
  const box = document.getElementById("errorBox");
  if (box) box.textContent = msg || "";
}
function validateInputs(user, pass) {
  if (!user || !pass) {
    showError("Preencha usuário e senha.");
    return false;
  }
  return true;
}
async function fakeAuth(user, pass) {
  await new Promise(r => setTimeout(r, 150)); // simula latência
  return user === "admin" && pass === "admin123";
}
function attachHandlers() {
  const form = document.getElementById("loginForm");
  const btn = document.getElementById("entrarBtn");
  const userEl = document.getElementById("usuario");
  const passEl = document.getElementById("senha");

  if (!form || !btn || !userEl || !passEl) {
    log("Elemento(s) não encontrado(s):", { form: !!form, btn: !!btn, userEl: !!userEl, passEl: !!passEl });
    showError("Erro ao carregar o formulário. Recarregue a página.");
    return;
  }

  log("Handlers anexados");
  form.addEventListener("submit", async (e) => {
    e.preventDefault();
    showError("");

    const user = userEl.value.trim();
    const pass = passEl.value;

    log("Submit acionado", { userLen: user.length, passLen: pass.length });
    if (!validateInputs(user, pass)) {
      log("Validação falhou");
      return;
    }

    btn.disabled = true;
    const prev = btn.textContent;
    btn.textContent = "Entrando...";

    try {
      const ok = await fakeAuth(user, pass);
      if (ok) {
        log("Auth OK → redirecionando");
        location.href = "/painel.html";
      } else {
        log("Auth falhou");
        showError("Usuário ou senha inválidos.");
      }
    } catch (err) {
      console.error("Erro no login:", err);
      showError("Erro ao processar login. Tente novamente.");
    } finally {
      btn.disabled = false;
      btn.textContent = prev;
    }
  });

  userEl.focus();
}
document.addEventListener("DOMContentLoaded", () => {
  log("DOMContentLoaded");
  attachHandlers();
});
