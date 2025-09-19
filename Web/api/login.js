export default function handler(req, res) {
  const { user, pass } = req.query;
  if (user === "admin" && pass === "admin123") {
    res.status(200).json({ ok: true });
  } else {
    res.status(401).json({ ok: false });
  }
}
