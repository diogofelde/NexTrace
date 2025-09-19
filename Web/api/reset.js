export default function handler(req, res) {
  const { email } = req.query;
  res.status(200).json({ ok: true, message: `Se existir conta para ${email}, enviaremos instruções.` });
}
