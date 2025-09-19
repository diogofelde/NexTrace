export default function handler(req, res) {
  const { path = [] } = req.query || {};
  res.status(200).json({
    ok: true,
    path,
    message: "Rota dinâmica capturada pela API catch-all."
  });
}