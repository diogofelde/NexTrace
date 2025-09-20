export default function handler(req, res) {
  let user, pass;

  if (req.method === "POST") {
    ({ user, pass } = req.body);
  } else {
    ({ user, pass } = req.query);
  }

  const ADM_MASTER_USER = "ADMSistema";
  const ADM_MASTER_PASS = "159SistemaNex";

  const ADM_HTML_USER = "ADMhtml";
  const ADM_HTML_PASS = "159htmlNex";

  const received = { user, pass };
  const expected = {
    ADM_MASTER_USER,
    ADM_MASTER_PASS,
    ADM_HTML_USER,
    ADM_HTML_PASS
  };

  if (user === ADM_MASTER_USER && pass === ADM_MASTER_PASS) {
    res.status(200).json({ ok: true, role: "ADM Master", received, expected });
  } else if (user === ADM_HTML_USER && pass === ADM_HTML_PASS) {
    res.status(200).json({ ok: true, role: "ADM HTML", received, expected });
  } else {
    res.status(401).json({ ok: false, error: "Credenciais inválidas", received, expected });
  }
}
