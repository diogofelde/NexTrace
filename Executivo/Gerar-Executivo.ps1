param()
\E:\NexTraceWeb\nextrace\Executivo = 'E:\NexTraceWeb\nextrace'
\  = Join-Path \E:\NexTraceWeb\nextrace\Executivo ('Executivo\executivo_' + (Get-Date -Format 'yyyyMMdd_HHmm') + '.md')

\  = (Get-ChildItem (Join-Path \E:\NexTraceWeb\nextrace\Executivo 'Relatorios') -File -ErrorAction SilentlyContinue).Count
\ = (Get-ChildItem (Join-Path \E:\NexTraceWeb\nextrace\Executivo 'Dashboards') -File -ErrorAction SilentlyContinue).Count
\ = (Get-ChildItem (Join-Path \E:\NexTraceWeb\nextrace\Executivo 'Vuln') -Directory -ErrorAction SilentlyContinue).Count

\ = "# Relatório Executivo NexTrace
Autor: Diogo Felde
Data: 19/09/2025 15:36

Resumo de Produção:
- Relatórios técnicos: \
- Dashboards: \
- Scans de vulnerabilidade: \"

\ | Out-File \ -Encoding UTF8

Write-Host "✅ Relatório executivo gerado: \" -ForegroundColor Green
