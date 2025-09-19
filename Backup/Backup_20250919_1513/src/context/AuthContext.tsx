import { createContext, useContext, useState, ReactNode } from 'react';

interface AuthContextType {
  isAuthenticated: boolean;
  perfil: 'admin' | 'gestor' | null;
  login: (user: string, pass: string) => boolean;
  logout: () => void;
}

const AuthContext = createContext<AuthContextType | null>(null);

const AuthProvider = ({ children }: { children: ReactNode }) => {
  const [isAuthenticated, setIsAuthenticated] = useState(false);
  const [perfil, setPerfil] = useState<'admin' | 'gestor' | null>(null);

  const login = (user: string, pass: string) => {
    if (user === 'admin' && pass === 'admin159') {
      setIsAuthenticated(true);
      setPerfil('admin');
      return true;
    }
    if (user === 'gestor' && pass === 'gestor123') {
      setIsAuthenticated(true);
      setPerfil('gestor');
      return true;
    }
    return false;
  };

  const logout = () => {
    const timestamp = new Date().toLocaleString('pt-BR');
    const entry = `[${timestamp}] Logout realizado`;
    const logs = JSON.parse(localStorage.getItem('nextrace_logs') || '[]');
    logs.unshift(entry);
    localStorage.setItem('nextrace_logs', JSON.stringify(logs));
    setIsAuthenticated(false);
    setPerfil(null);
    window.location.href = '/login';
  };

  return (
    <AuthContext.Provider value={{ isAuthenticated, perfil, login, logout }}>
      {children}
    </AuthContext.Provider>
  );
};

const useAuth = (): AuthContextType => {
  const context = useContext(AuthContext);
  if (!context) throw new Error('useAuth deve ser usado dentro de AuthProvider');
  return context;
};

export { AuthProvider, useAuth };