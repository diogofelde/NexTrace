export default function handler(req, res) {
  const { user, pass } = req.query;

  const ADM_MASTER_USER = "DiogoADM";
  const ADM_MASTER_PASS = "D1O9OF3lD3";

  console.log("🔐 Login recebido:", { user, pass });

  if (user === ADM_MASTER_USER && pass === ADM_MASTER_PASS) {
    console.log("✅ Login autorizado como ADM Master");
    res.status(200).json({ ok: true, role: "ADM Master" });
  } else {
    console.log("❌ Login negado");
    res.status(401).json({ ok: false, error: "Credenciais inválidas" });
  }
}
