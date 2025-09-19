param()
\E:\NexTraceWeb\nextrace  = 'E:\NexTraceWeb\nextrace'
\20250919_1516     = Get-Date -Format 'yyyyMMdd_HHmm'
\E:\NexTraceWeb\nextrace\Backup\Backup_20250919_1516 = Join-Path \E:\NexTraceWeb\nextrace ("Backup\Backup_" + \20250919_1516)
New-Item -Path \E:\NexTraceWeb\nextrace\Backup\Backup_20250919_1516 -ItemType Directory -Force | Out-Null
\E:\NexTraceWeb\nextrace\Backup\Backup_20250919_1516\robocopy.log = Join-Path \E:\NexTraceWeb\nextrace\Backup\Backup_20250919_1516 "robocopy.log"
robocopy "\E:\NexTraceWeb\nextrace" "\E:\NexTraceWeb\nextrace\Backup\Backup_20250919_1516" /E /R:2 /W:2 /XD "\E:\NexTraceWeb\nextrace\Backup" > \E:\NexTraceWeb\nextrace\Backup\Backup_20250919_1516\robocopy.log
