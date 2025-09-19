param()
if ((Get-Date).Day -ne 1) { exit }
\ = "E:\NexTraceWeb\nextrace\Compliance\relatorio_compliance_" + (Get-Date -Format "yyyyMMdd_HHmm") + ".txt"
Get-Content "E:\NexTraceWeb\nextrace\Compliance\LGPD_checklist.txt","E:\NexTraceWeb\nextrace\Compliance\ISO27001_checklist.txt","E:\NexTraceWeb\nextrace\Compliance\NIST_CSF_checklist.txt" | Out-File \ -Encoding UTF8
