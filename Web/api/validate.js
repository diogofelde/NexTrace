export default function handler(req, res) {
  const { dep } = req.query;
  if (dep) {
    res.status(200).json({ ok: true });
  } else {
    res.status(401).json({ ok: false });
  }
}
