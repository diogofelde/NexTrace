<#
================================================================================
  Script: Correlacao-Eventos.ps1
  Autor: Diogo Felde
  Finalidade:
    - Correlacionar múltiplos eventos
    - Priorizar alertas por criticidade e contexto
    - Sugerir playbooks automaticamente
================================================================================
#>

\ = Import-Csv "E:\NexTraceWeb\nextrace\Logs\eventos_sioc.csv"
\ = \ | Where-Object { \.criticidade -eq 'Alta' -or \.origem -eq 'TI' }

foreach (\*.md in \) {
  "🔎 Evento: \ | Origem: \ | Sugerido: Bloquear-IP.ps1" | Out-File "E:\NexTraceWeb\nextrace\Logs\correlacao.log" -Append
}
