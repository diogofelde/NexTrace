param(
  [string] \,
  [string] \
)

\ = "E:\NexTraceWeb\nextrace\Logs\web_20250919_1635.log"

switch (\) {
  "Executivo" {
    & powershell.exe -ExecutionPolicy Bypass -File "E:\NexTraceWeb\nextrace\Executivo\Gerar-Executivo-Estrategico.ps1"
    "✅ Módulo Executivo executado." | Out-File \ -Append
  }
  "Compliance" {
    & powershell.exe -ExecutionPolicy Bypass -File "E:\NexTraceWeb\nextrace\Compliance\Run-Compliance.ps1"
    "✅ Módulo Compliance executado." | Out-File \ -Append
  }
  "TI" {
    & powershell.exe -ExecutionPolicy Bypass -File "E:\NexTraceWeb\nextrace\TI\Get-TI-Feeds.ps1"
    "✅ Módulo TI executado." | Out-File \ -Append
  }
  "Forense" {
    & powershell.exe -ExecutionPolicy Bypass -File "E:\NexTraceWeb\nextrace\Forense\Coletar-Evidencias.ps1" -CaseID \
    "✅ Módulo Forense executado com CaseID \." | Out-File \ -Append
  }
  "Monitoramento" {
    & powershell.exe -ExecutionPolicy Bypass -File "E:\NexTraceWeb\nextrace\Monitoramento\Check-Servicos.ps1"
    "✅ Módulo Monitoramento executado." | Out-File \ -Append
  }
  "Backup" {
    & powershell.exe -ExecutionPolicy Bypass -File "E:\NexTraceWeb\nextrace\Backup\Run-Backup.ps1"
    "✅ Módulo Backup executado." | Out-File \ -Append
  }
  "SOAR" {
    & powershell.exe -ExecutionPolicy Bypass -File "E:\NexTraceWeb\nextrace\SOAR\Bloquear-IP.ps1" -IP \
    "✅ Módulo SOAR executado com IP \." | Out-File \ -Append
  }
  "CMDB" {
    Get-Content "E:\NexTraceWeb\nextrace\CMDB\modelo_cmdb.txt" | Out-File \ -Append
    "✅ Módulo CMDB visualizado." | Out-File \ -Append
  }
  "Documentacao" {
    Get-ChildItem "E:\NexTraceWeb\nextrace\Documentacao" -File | ForEach-Object { "\" | Out-File \ -Append }
    "✅ Módulo Documentação visualizado." | Out-File \ -Append
  }
  default {
    "❌ Módulo inválido: \" | Out-File \ -Append
  }
}

Get-Content \
