<#
================================================================================
  Playbook: Coletar Evidências
  Autor:   Diogo Felde
  Uso:     .\Coletar-Evidencias.ps1 -CaseID 123
================================================================================
#>
param([Parameter(Mandatory=\True)][string]\)

\ = "E:\NexTraceWeb\nextrace\Forense\Caso_\"
New-Item -Path \ -ItemType Directory -Force | Out-Null

# Coleta de logs do Windows
wevtutil epl Security "\\Security.evtx"
wevtutil epl System   "\\System.evtx"

# Snapshot de processos
Get-Process | Sort-Object CPU -Descending | Out-File "\\processos.txt"

Write-Host "✅ Evidências coletadas em \" -ForegroundColor Green
