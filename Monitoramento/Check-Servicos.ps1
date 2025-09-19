param()
\ = "E:\NexTraceWeb\nextrace\Monitoramento\status_servicos_" + (Get-Date -Format "yyyyMMdd_HHmm") + ".txt"
Get-Service | Where-Object { \.Status -eq 'Running' } | Out-File \
