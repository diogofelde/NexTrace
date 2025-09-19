Set-Location "E:\NexTraceWeb\nextrace"
$evento = [PSCustomObject]@{ tipo = 'Acesso não autorizado'; origem = 'TI'; criticidade = 'Alta'; timestamp = (Get-Date) }
$evento | Export-Csv "Logs\eventos_sioc.csv" -NoTypeInformation
& "Inteligencia\Correlacao-Eventos.ps1"
Write-Host "✅ Validação executada." -ForegroundColor Green
Read-Host "Pressione ENTER para encerrar"
