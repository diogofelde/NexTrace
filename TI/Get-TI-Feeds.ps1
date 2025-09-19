param()
\ = "E:\NexTraceWeb\nextrace\TI\coletas_" + (Get-Date -Format "yyyyMMdd_HH00")
New-Item -Path \ -ItemType Directory -Force | Out-Null
. "E:\NexTraceWeb\nextrace\TI\feeds_modelo.ps1"
foreach (\ in \.Keys) {
  \E:\NexTraceWeb\nextrace\Documentacao\error-context.md = Join-Path \ ("\.txt")
  foreach (\ in \[\]) {
    try {
      (Invoke-WebRequest -Uri \ -UseBasicParsing -TimeoutSec 30).Content | Out-File \E:\NexTraceWeb\nextrace\Documentacao\error-context.md -Append -Encoding UTF8
    } catch {
      "{0} ERRO em {1}: {2}" -f (Get-Date -Format "HH:mm:ss"), \, \.Exception.Message | Out-File \E:\NexTraceWeb\nextrace\Documentacao\error-context.md -Append -Encoding UTF8
    }
  }
}
