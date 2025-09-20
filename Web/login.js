function login(event) {
  event.preventDefault();

  const user = document.getElementById("usuario").value;
  const pass = document.getElementById("senha").value;

  if (user === "admin" && pass === "admin123") {
    window.location.href = "painel.html";
  } else {
    alert("Usuário ou senha inválidos. Tente novamente.");
  }
}

document.addEventListener("DOMContentLoaded", () => {
  const form = document.getElementById("loginForm");
  if (form) {
    form.addEventListener("submit", login);
  }
});
