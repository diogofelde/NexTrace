<#
================================================================================
  Playbook: Isolar Host
  Autor:   Diogo Felde
  Uso:     .\Isolar-Host.ps1 -TargetHost LOCAL
================================================================================
#>
param([string] = "LOCAL")

Write-Host "🔒 Iniciando isolamento do host: " -ForegroundColor Yellow

# Bloqueio de tráfego
New-NetFirewallRule -DisplayName "NexTrace-Isolamento" -Direction Inbound -Action Block -Profile Any -Enabled True -ErrorAction SilentlyContinue
New-NetFirewallRule -DisplayName "NexTrace-Isolamento" -Direction Outbound -Action Block -Profile Any -Enabled True -ErrorAction SilentlyContinue

Write-Host "✅ Host isolado via firewall." -ForegroundColor Green
