<#
================================================================================
  Scanner de Vulnerabilidades - NexTrace
  Autor:   Diogo Felde
  Uso:     .\Scan-Vulnerabilidades.ps1 -Alvo 192.168.0.0/24
================================================================================
#>
param([Parameter(Mandatory=\True)][string]\)

\ = Join-Path 'E:\NexTraceWeb\nextrace\Vuln' ('scan_' + (Get-Date -Format 'yyyyMMdd_HHmm'))
New-Item -ItemType Directory -Path \ -Force | Out-Null

Write-Host "🔎 Iniciando varredura em \..." -ForegroundColor Cyan

# Nmap (rede e serviços)
nmap -sV --script vuln \ -oN (Join-Path \ 'nmap_vuln.txt')

# Nikto (web)
if (Get-Command nikto -ErrorAction SilentlyContinue) {
  nikto -h \ -o (Join-Path \ 'nikto.txt') -ask no
}

# Nuclei (templates de vulnerabilidades conhecidas)
if (Test-Path "E:\NexTraceWeb\nextrace\Binarios\nuclei.exe") {
  & "E:\NexTraceWeb\nextrace\Binarios\nuclei.exe" -u \ -o (Join-Path \ 'nuclei.txt')
}

Write-Host "✅ Varredura concluída. Relatórios em: \" -ForegroundColor Green
