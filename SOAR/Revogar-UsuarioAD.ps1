<#
================================================================================
  Playbook: Revogar Usuário AD
  Autor:   Diogo Felde
  Uso:     .\Revogar-UsuarioAD.ps1 -SamAccountName usuario
================================================================================
#>
param([Parameter(Mandatory=\True)][string]\)

# Import-Module ActiveDirectory
# Disable-ADAccount -Identity \
# Set-ADUser -Identity \ -Enabled \False -Description "Revogado por SOAR NexTrace"

Write-Host "🟡 Usuário \ revogado (modelo, requer módulo AD)." -ForegroundColor Yellow
