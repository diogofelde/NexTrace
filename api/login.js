export default function handler(req, res) {
  const { user, pass } = req.query;

  const adminUser = process.env.ADMIN_USER;
  const adminPass = process.env.ADMIN_PASS;

  if (user === adminUser && pass === adminPass) {
    res.status(200).json({ ok: true });
  } else {
    res.status(401).json({ ok: false, error: "Credenciais inválidas" });
  }
}
