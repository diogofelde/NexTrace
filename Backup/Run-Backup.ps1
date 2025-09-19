param()
\ = Get-Date -Format "yyyyMMdd_HHmm"
\E:\NexTraceWeb\nextrace\Documentacao\error-context.md  = "E:\NexTraceWeb\nextrace\Backup\Backup_\"
New-Item -Path \E:\NexTraceWeb\nextrace\Documentacao\error-context.md -ItemType Directory -Force | Out-Null
robocopy "E:\NexTraceWeb\nextrace" \E:\NexTraceWeb\nextrace\Documentacao\error-context.md /E /R:2 /W:2 /XD "E:\NexTraceWeb\nextrace\Backup" > "\E:\NexTraceWeb\nextrace\Documentacao\error-context.md\robocopy.log"
