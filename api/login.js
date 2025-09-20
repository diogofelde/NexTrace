export default function handler(req, res) {
  let user, pass;

  if (req.method === "POST") {
    ({ user, pass } = req.body);
  } else {
    ({ user, pass } = req.query);
  }

  const ADM_MASTER_USER = "DiogoADM";
  const ADM_MASTER_PASS = "D1O9OF3lD3";

  console.log("🔐 Tentativa de login:", { user, pass });

  if (user === ADM_MASTER_USER && pass === ADM_MASTER_PASS) {
    res.status(200).json({ ok: true, role: "ADM Master" });
  } else {
    res.status(401).json({ ok: false, error: "Credenciais inválidas" });
  }
}
