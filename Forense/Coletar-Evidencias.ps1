<#
================================================================================
  Projeto: NexTrace - Plataforma SOC/NOC 24/7
  Script:  Coletar-Evidencias.ps1
  Autor:   Diogo Felde
  Local:   Santo André - SP, Brasil
  Data:    19/09/2025 16:04
  Versão:  1.1
  Finalidade: Coletar logs, processos, conexões e serviços
================================================================================
#>
param([Parameter(Mandatory=$true)][string]$CaseID)
$outDir = "E:\NexTraceWeb\nextrace\Forense\Caso_" + $CaseID
New-Item -Path $outDir -ItemType Directory -Force | Out-Null
wevtutil epl Security   "$outDir\Security.evtx"
wevtutil epl System     "$outDir\System.evtx"
wevtutil epl Application "$outDir\Application.evtx"
Get-Process | Sort-Object CPU -Descending | Out-File "$outDir\processos.txt"
Get-NetTCPConnection | Out-File "$outDir\conexoes.txt"
Get-Service | Where-Object { '$_.Status -eq 'Running' } | Out-File "\servicos.txt"
Write-Host ("✅ Evidências coletadas em " + $outDir) -ForegroundColor Green
