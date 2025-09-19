import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import Layout from "./components/Layout";
import Home from "./pages/Home";
import Login from "./pages/Login";
import Admin from "./pages/Admin";
import ProtectedRoute from "./components/ProtectedRoute";
import { AuthProvider } from "./context/AuthContext";

// Import das demais páginas
import RedTeam from "./pages/RedTeam";
import BlueTeam from "./pages/BlueTeam";
import OSINT from "./pages/OSINT";
import Forense from "./pages/Forense";
import Monitoramento from "./pages/Monitoramento";
import Auditoria from "./pages/Auditoria";
import Executivo from "./pages/Executivo";
import ProntaResposta from "./pages/ProntaResposta";
import Purple from "./pages/Purple";
import ThreatIntel from "./pages/ThreatIntel";
import DevSecOps from "./pages/DevSecOps";
import Cloud from "./pages/Cloud";
import GRC from "./pages/GRC";
import EngenhariaMalware from "./pages/EngenhariaMalware";
import OlhoDeDeus from "./pages/OlhoDeDeus";
import Sherlock from "./pages/Sherlock";
import Pentest from "./pages/Pentest";

export default function App() {
    return (
        <AuthProvider>
            <Router>
                <Routes>
                    <Route path="/" element={<Layout />}>
                        <Route index element={<Home />} />
                        <Route path="login" element={<Login />} />
                        <Route
                            path="admin"
                            element={
                                <ProtectedRoute>
                                    <Admin />
                                </ProtectedRoute>
                            }
                        />
                        <Route path="redteam" element={<RedTeam />} />
                        <Route path="blueteam" element={<BlueTeam />} />
                        <Route path="osint" element={<OSINT />} />
                        <Route path="forense" element={<Forense />} />
                        <Route path="monitoramento" element={<Monitoramento />} />
                        <Route path="auditoria" element={<Auditoria />} />
                        <Route path="executivo" element={<Executivo />} />
                        <Route path="prontaresposta" element={<ProntaResposta />} />
                        <Route path="purple" element={<Purple />} />
                        <Route path="threatintel" element={<ThreatIntel />} />
                        <Route path="devsecops" element={<DevSecOps />} />
                        <Route path="cloud" element={<Cloud />} />
                        <Route path="grc" element={<GRC />} />
                        <Route path="engenhariamalware" element={<EngenhariaMalware />} />
                        <Route path="olhodedeus" element={<OlhoDeDeus />} />
                        <Route path="sherlock" element={<Sherlock />} />
                        <Route path="pentest" element={<Pentest />} />
                    </Route>
                </Routes>
            </Router>
        </AuthProvider>
    );
}