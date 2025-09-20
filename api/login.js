export default function handler(req, res) {
  const { user, pass } = req.query;

  const adminUser = process.env.ADMIN_USER;
  const adminPass = process.env.ADMIN_PASS;

  console.log("🔐 Login attempt:", { receivedUser: user, receivedPass: pass });
  console.log("🔐 Expected:", { adminUser, adminPass });

  if (user === adminUser && pass === adminPass) {
    console.log("✅ Login autorizado");
    res.status(200).json({ ok: true });
  } else {
    console.log("❌ Login negado");
    res.status(401).json({ ok: false, error: "Credenciais inválidas" });
  }
}
