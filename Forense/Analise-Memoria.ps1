<#
================================================================================
  Projeto: NexTrace - Plataforma SOC/NOC 24/7
  Script:  Analise-Memoria.ps1
  Autor:   Diogo Felde
  Local:   Santo André - SP, Brasil
  Data:    19/09/2025 16:04
  Versão:  1.0
  Finalidade: Executar análises padrão com Volatility (se instalado)
================================================================================
#>
param([Parameter(Mandatory=$true)][string]$DumpPath)
$outDir = "E:\NexTraceWeb\nextrace\Forense\Memoria_" + (Get-Date -Format "yyyyMMdd_HHmm")
New-Item -Path $outDir -ItemType Directory -Force | Out-Null
try {
  volatility -f $DumpPath --profile=Win10x64_19041 pslist  > "$outDir\processos.txt"
  volatility -f $DumpPath --profile=Win10x64_19041 netscan  > "$outDir\rede.txt"
  volatility -f $DumpPath --profile=Win10x64_19041 malfind > "$outDir\malware.txt"
} catch {
  "Falha ao executar Volatility: {0}" -f $_.Exception.Message | Out-File "$outDir\erro.txt"
}
Write-Host ("✅ Análise de memória concluída em " + $outDir) -ForegroundColor Green
