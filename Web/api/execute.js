export default function handler(req, res) {
  const { module, param } = req.query || {};
  res.status(200).json({
    ok: true,
    module: module || "not-provided",
    param: param || "not-provided",
    message: `Execução simulada para módulo=${module || "-"} param=${param || "-"}`
  });
}
