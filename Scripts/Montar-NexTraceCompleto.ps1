<#
================================================================================
 Script: Montar-NexTraceCompleto.ps1
 Objetivo:
   - Criar estrutura completa do NexTrace (frontend + APIs simuladas)
   - Preparado para deploy no Vercel
   - Criar Dockerfile e docker-compose.yml para rodar em container
================================================================================
#>

$basePath = "E:\NexTraceWeb\nextrace\Web"

if (-not (Test-Path $basePath)) {
    New-Item -ItemType Directory -Path $basePath -Force | Out-Null
}
Set-Location $basePath

# ---------------------------
# 1) Arquivos HTML
# ---------------------------

# index.html
@'
<!doctype html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <title>NexTrace - Login</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <h1>NexTrace - Painel SOC/NOC</h1>
  <form id="loginForm">
    <label>Usuário</label>
    <input type="text" id="user" required>
    <label>Senha</label>
    <input type="password" id="pass" required>
    <button type="submit">Entrar</button>
  </form>
  <a href="reset.html">Esqueci minha senha</a>
  <script>
    document.getElementById('loginForm').onsubmit = async (e) => {
      e.preventDefault();
      const user = document.getElementById('user').value;
      const pass = document.getElementById('pass').value;
      const res = await fetch(`/api/login?user=${user}&pass=${pass}`);
      const json = await res.json();
      if (json.ok) {
        window.location.href = "departamentos.html";
      } else {
        alert("Login inválido");
      }
    };
  </script>
</body>
</html>
'@ | Out-File "$basePath\index.html" -Encoding UTF8

# reset.html
@'
<!doctype html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <title>Recuperar Senha</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <h2>Recuperar Senha</h2>
  <form id="resetForm">
    <label>Email cadastrado</label>
    <input type="email" id="email" required>
    <button type="submit">Enviar</button>
  </form>
  <script>
    document.getElementById('resetForm').onsubmit = async (e) => {
      e.preventDefault();
      const email = document.getElementById('email').value;
      const res = await fetch(`/api/reset?email=${email}`);
      const json = await res.json();
      alert(json.message);
    };
  </script>
</body>
</html>
'@ | Out-File "$basePath\reset.html" -Encoding UTF8

# departamentos.html
@'
<!doctype html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <title>NexTrace - Departamentos</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <h2>Escolha seu departamento</h2>
  <select id="departamento">
    <option value="red">Red Team</option>
    <option value="blue">Blue Team</option>
    <option value="forense">Forense</option>
    <option value="intel">Threat Intelligence</option>
  </select>
  <button id="acessar">Acessar</button>
  <script>
    document.getElementById('acessar').onclick = async () => {
      const dep = document.getElementById('departamento').value;
      const res = await fetch(`/api/validate?dep=${dep}`);
      const json = await res.json();
      if (json.ok) {
        window.location.href = "painel.html?dep=" + dep;
      } else {
        alert("Autenticação secundária falhou");
      }
    };
  </script>
</body>
</html>
'@ | Out-File "$basePath\departamentos.html" -Encoding UTF8

# painel.html
@'
<!doctype html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <title>NexTrace - Painel</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <h2 id="titulo"></h2>
  <div id="ferramentas"></div>
  <script>
    const params = new URLSearchParams(window.location.search);
    const dep = params.get("dep");
    const titulo = {
      red: "Painel Red Team",
      blue: "Painel Blue Team",
      forense: "Painel Forense",
      intel: "Painel Threat Intelligence"
    };
    document.getElementById("titulo").innerText = titulo[dep] || "Painel NexTrace";
    const ferramentas = {
      red: ["Scanner de vulnerabilidades", "Exploit toolkit"],
      blue: ["SIEM", "Dashboard de alertas"],
      forense: ["Analisador de logs", "Timeline de incidentes"],
      intel: ["Feeds de ameaças", "Relatórios de IOC"]
    };
    document.getElementById("ferramentas").innerHTML =
      "<ul>" + (ferramentas[dep] || []).map(f => `<li>${f}</li>`).join("") + "</ul>";
  </script>
</body>
</html>
'@ | Out-File "$basePath\painel.html" -Encoding UTF8

# ---------------------------
# 2) CSS
# ---------------------------
@'
body {
  font-family: system-ui, Arial, sans-serif;
  margin: 40px;
}
form, select, input, button {
  display: block;
  margin: 10px 0;
}
button {
  padding: 8px 16px;
}
'@ | Out-File "$basePath\style.css" -Encoding UTF8

# ---------------------------
# 3) APIs simuladas
# ---------------------------
$apiDir = "$basePath\api"
if (-not (Test-Path $apiDir)) { New-Item -ItemType Directory -Path $apiDir | Out-Null }

@'
export default function handler(req, res) {
  const { user, pass } = req.query;
  if (user === "admin" && pass === "admin123") {
    res.status(200).json({ ok: true });
  } else {
    res.status(401).json({ ok: false });
  }
}
'@ | Out-File "$apiDir\login.js" -Encoding UTF8

@'
export default function handler(req, res) {
  const { dep } = req.query;
  if (dep) {
    res.status(200).json({ ok: true });
  } else {
    res.status(401).json({ ok: false });
  }
}
'@ | Out-File "$apiDir\validate.js" -Encoding UTF8

@'
export default function handler(req, res) {
  const { email } = req.query;
  res.status(200).json({ ok: true, message: `Se existir conta para ${email}, enviaremos instruções.` });
}
'@ | Out-File "$apiDir\reset.js" -Encoding UTF8

# ---------------------------
# 4) vercel.json
# ---------------------------
@'
{
  "rewrites": [
    { "source": "/api/(.*)", "destination": "/api/$1" },
    { "source": "/(.*)", "destination": "/index.html" }
  ]
}
'@ | Out-File "$basePath\vercel.json" -Encoding UTF8

# ---------------------------
# 5) Dockerfile
# ---------------------------
@'
FROM node:18 AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
'@ | Out-File "$basePath\Dockerfile" -Encoding UTF8

# ---------------------------
# 6) docker-compose.yml
# ---------------------------
@'
services:
  nextrace:
    build: .
    container_name: nextrace
    ports:
      - "8080:80"
    restart: unless-stopped
'@ | Out-File "$basePath\docker-compose.yml" -Encoding UTF8

Write-Host "✅ Estrutura NexTrace + Dockerfile + docker-compose.yml criada em $basePath" -ForegroundColor Green