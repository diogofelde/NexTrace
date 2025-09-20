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
  // Simula round-trip para backend (200ms)
  await new Promise(r => setTimeout(r, 200));
  return user === "admin" && pass === "admin123";
}

function attachHandlers() {
  const form = document.getElementById("loginForm");
  const btn = document.getElementById("entrarBtn");
  const userEl = document.getElementById("usuario");
  const passEl = document.getElementById("senha");

  if (!form || !btn || !userEl || !passEl) {
    log("Elemento(s) não encontrado(s):", { form: !!form, btn: !!btn, userEl: !!userEl, passEl: !!passEl });
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
      log("Validação básica falhou");
      return;
    }

    // Desabilita para evitar duplo clique
    btn.disabled = true;
    btn.textContent = "Entrando...";

    try {
      // Troque fakeAuth por chamada real quando tiver API:
      // const ok = await doRealAuth(user, pass);
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
      btn.textContent = "Entrar";
    }
  });

  // Enter no input também submete (já funciona por ser submit)
  // Foco inicial
  userEl.focus();
}

document.addEventListener("DOMContentLoaded", () => {
  log("DOMContentLoaded");
  attachHandlers();
});
