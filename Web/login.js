function login(event) {
  event.preventDefault(); // evita reload da página

  const user = document.getElementById("usuario").value;
  const pass = document.getElementById("senha").value;

  // Usuário e senha fixos para teste
  if (user === "admin" && pass === "admin123") {
    // Redireciona para o painel
    window.location.href = "painel.html";
  } else {
    // Mostra alerta de erro
    alert("Usuário ou senha inválidos. Tente novamente.");
  }
}

// Garante que o formulário chame a função login
document.addEventListener("DOMContentLoaded", () => {
  const form = document.getElementById("loginForm");
  if (form) {
    form.addEventListener("submit", login);
  }
});
