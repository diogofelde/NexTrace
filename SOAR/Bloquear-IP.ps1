<#
================================================================================
  Playbook: Bloquear IP
  Autor:   Diogo Felde
  Uso:     .\Bloquear-IP.ps1 -IP 192.168.1.100
================================================================================
#>
param([Parameter(Mandatory=\True)][string]\)

New-NetFirewallRule -DisplayName "NexTrace-Block-\" -Direction Inbound -RemoteAddress \ -Action Block -Profile Any -Enabled True
New-NetFirewallRule -DisplayName "NexTrace-Block-\" -Direction Outbound -RemoteAddress \ -Action Block -Profile Any -Enabled True

Write-Host "✅ IP bloqueado: \" -ForegroundColor Green
