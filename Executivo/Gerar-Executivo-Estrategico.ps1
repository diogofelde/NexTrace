param()
\E:\NexTraceWeb\nextrace = "E:\NexTraceWeb\nextrace"
\  = Join-Path \E:\NexTraceWeb\nextrace ("Executivo\executivo_estrategico_" + (Get-Date -Format "yyyyMMdd_HHmm") + ".txt")
\  = (Get-ChildItem (Join-Path \E:\NexTraceWeb\nextrace "Relatorios") -File -ErrorAction SilentlyContinue).Count
\ = (Get-ChildItem (Join-Path \E:\NexTraceWeb\nextrace "Dashboards") -File -ErrorAction SilentlyContinue).Count
\ = (Get-ChildItem (Join-Path \E:\NexTraceWeb\nextrace "Vuln") -Directory -ErrorAction SilentlyContinue).Count
\ = "================================================================================"
\ = @()
\ += \
\ += "Relatório Executivo Estratégico - NexTrace"
\ += "Autor: Diogo Felde"
\ += "Local: Santo André - SP, Brasil"
\ += "Data: " + (Get-Date -Format "dd/MM/yyyy HH:mm")
\ += \
\ += "KPIs Consolidados:"
\ += "- Relatórios técnicos gerados: \"
\ += "- Dashboards operacionais: \"
\ += "- Scans de vulnerabilidade realizados: \"
\ += \
\ | Out-File \ -Encoding UTF8
