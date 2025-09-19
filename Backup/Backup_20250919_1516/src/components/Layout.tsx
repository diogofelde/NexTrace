import { Link, Outlet } from "react-router-dom";
import { useAuth } from "../context/AuthContext";
import "../styles/layout.css";

export default function Layout() {
  const { isAuthenticated, logout } = useAuth();

  return (
    <div className="app">
      <header className="header">
        <nav className="nav">
          <Link to="/" className="brand">NexTrace</Link>
          <div className="links">
            <Link to="/login">Login</Link>
            <Link to="/olhodedeus">Olho de Deus</Link>
            <Link to="/monitoramento">Monitoramento</Link>
            <Link to="/forense">Forense</Link>
            <Link to="/sherlock">Sherlock</Link>
            <Link to="/osint">OSINT</Link>
            <Link to="/redteam">Red Team</Link>
            <Link to="/blueteam">Blue Team</Link>
            <Link to="/pentest">Pentest</Link>
            <Link to="/auditoria">Auditoria</Link>
            <Link to="/executivo">Executivo</Link>
            <Link to="/prontaresposta">Pronta Resposta</Link>
            <Link to="/purple">Purple Team</Link>
            <Link to="/threatintel">Threat Intel</Link>
            <Link to="/devsecops">DevSecOps</Link>
            <Link to="/cloud">Cloud</Link>
            <Link to="/grc">GRC</Link>
            <Link to="/engenhariamalware">Engenharia Malware</Link>
            
          </div>
        </nav>
      </header>

      <main className="content">
        <Outlet />
      </main>

      <footer className="footer">
        <p>Desenvolvido por Diogo Felde — Santo André, SP</p>
      </footer>
    </div>
  );
}
