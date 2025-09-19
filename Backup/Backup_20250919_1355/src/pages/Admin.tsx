import { useEffect, useState } from 'react';
import { useAuth } from '../context/AuthContext';

export default function Admin() {
  const { perfil } = useAuth();
  const [logs, setLogs] = useState<string[]>([]);
  const [inicio, setInicio] = useState('');
  const [fim, setFim] = useState('');
  const [filtrados, setFiltrados] = useState<string[]>([]);
  const [hash, setHash] = useState('');

  useEffect(() => {
    const storedLogs = JSON.parse(localStorage.getItem('nextrace_logs') || '[]');
    setLogs(storedLogs);
    addLog('Acessou o painel administrativo');
  }, []);

  const addLog = (msg: string) => {
    const timestamp = new Date().toLocaleString('pt-BR');
    const entry = `[${timestamp}] ${msg}`;
    const updatedLogs = [entry, ...logs];
    setLogs(updatedLogs);
    localStorage.setItem('nextrace_logs', JSON.stringify(updatedLogs));
  };

  const exportarLogs = (formato: 'csv' | 'json') => {
    const dados = JSON.parse(localStorage.getItem('nextrace_logs') || '[]');
    const conteudo = formato === 'json'
      ? JSON.stringify(dados, null, 2)
      : dados.join('\n');
    const blob = new Blob([conteudo], { type: formato === 'json' ? 'application/json' : 'text/csv' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = `logs.${formato}`;
    a.click();
    URL.revokeObjectURL(url);
    gerarHash(dados);
  };

  const assinarRelatorio = async (dados: string[]) => {
    // Simulação de assinatura digital (não repúdio)
    const encoder = new TextEncoder();
    const data = encoder.encode(dados.join('\n'));
    const key = await crypto.subtle.generateKey({ name: 'RSA-PSS', modulusLength: 2048, publicExponent: new Uint8Array([1,0,1]), hash: 'SHA-256' }, true, ['sign', 'verify']);
    const assinatura = await crypto.subtle.sign({ name: 'RSA-PSS', saltLength: 32 }, key.privateKey, data);
    console.log('Assinatura digital gerada:', Buffer.from(new Uint8Array(assinatura)).toString('base64'));
  };

  const enviarParaSIEM = async () => {
    const dados = JSON.parse(localStorage.getItem('nextrace_logs') || '[]');
    await fetch('https://siem-endpoint.local/ingest', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ logs: dados })
    });
  };

  const gerarHash = async (dados: string[]) => {
    const encoder = new TextEncoder();
    const data = encoder.encode(d      </label>
      <button onClick={filtrarPorPeriodo}>Filtrar</button>

      {filtrados.length > 0 && (
        <>
          <h4>🗂️ Resultados filtrados</h4>
          <ul>
            {filtrados.map((log, index) => (
              <li key={index}>{log}</li>
            ))}
          </ul>
          <p><strong>SHA-256:</strong> {hash}</p>
          <button onClick={() => exportarLogs('csv')}>Exportar CSV</button>
          <button onClick={() => exportarLogs('json')}>Exportar JSON</button>
          <button onClick={() => assinarRelatorio(filtrados)}>Assinar Relatório</button>
          <button onClick={enviarParaSIEM}>Enviar para SIEM</button>
        </>
      )}

      <h3>📊 Dashboard</h3>
      <canvas id="graficoLogs"></canvas>
      <script>
        {`
          setTimeout(() => {
            const ctx = document.getElementById('graficoLogs');
            if (ctx) {
              new Chart(ctx, {
                type: 'bar',
                data: {
                  labels: ['Logins', 'Logouts', 'Ações'],
                  datasets: [{
                    label: 'Eventos',
                    data: [5, 3, 8],
                    backgroundColor: ['#4caf50','#f44336','#2196f3']
                  }]
                }
              });
            }
          }, 500);
        `}
      </script>
    </section>
  );
}