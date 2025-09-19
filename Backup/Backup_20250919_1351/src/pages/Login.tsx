import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '../context/AuthContext';

export default function Login() {
  const [usuario, setUsuario] = useState('');
  const [senha, setSenha] = useState('');
  const [mensagem, setMensagem] = useState('');
  const navigate = useNavigate();
  const { login } = useAuth();

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (login(usuario, senha)) {
      const timestamp = new Date().toLocaleString('pt-BR');
      const entry = `[${timestamp}] Login realizado com usuário: ${usuario}`;
      const logs = JSON.parse(localStorage.getItem('nextrace_logs') || '[]');
      logs.unshift(entry);
      localStorage.setItem('nextrace_logs', JSON.stringify(logs));
      setMensagem('✅ Login realizado com sucesso!');
      setTimeout(() => navigate('/admin'), 500);
    } else {
      setMensagem('❌ Usuário ou senha inválidos.');
    }
  };

  return (
    <section>
      <h1>Login</h1>
      <form onSubmit={handleSubmit}>
        <label>
          Usuário
          <input
            type="text"
            value={usuario}
            onChange={(e) => setUsuario(e.target.value)}
            required
          />
        </label>
        <label>
          Senha
          <input
            type="password"
            value={senha}
            onChange={(e) => setSenha(e.target.value)}
            required
          />
        </label>
        <button type="submit">Entrar</button>
      </form>
      {mensagem && <p>{mensagem}</p>}
    </section>
  );
}