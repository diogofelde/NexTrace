<#
================================================================================
  Script: Gerar-Relatorio.ps1
  Autor: Diogo Felde
  Finalidade:
    - Gerar relatório técnico/executivo
    - Exportar para PDF
================================================================================
#>

Set-Location "E:\NexTraceWeb\nextrace"

$word = New-Object -ComObject Word.Application
$word.Visible = $false

$doc = $word.Documents.Add()
$selection = $word.Selection

$selection.TypeText("Relatório Executivo - NexTrace SOC/NOC")
$selection.TypeParagraph()
$selection.TypeText("Data: $(Get-Date -Format 'dd/MM/yyyy HH:mm')")
$selection.TypeParagraph()
$selection.TypeText("Incidentes críticos, conformidade, resposta automatizada.")
$selection.TypeParagraph()

$path = "E:\NexTraceWeb\nextrace\Relatorios\PDF_$(Get-Date -Format 'yyyyMMdd_HHmm').pdf"
$doc.SaveAs([ref]$path, [ref]17)  # 17 = wdFormatPDF
$doc.Close()
$word.Quit()
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($word) | Out-Null

Write-Host "`n✅ Relatório PDF gerado em: $path" -ForegroundColor Cyan
Read-Host "Pressione ENTER para encerrar"