param([string]$usuario, [string]$senha)
Set-Location "E:\NexTraceWeb\nextrace"
$usuarios = Import-Csv "Web\usuarios.csv"
$match = $usuarios | Where-Object { $_.usuario -eq $usuario -and $_.senha -eq $senha }
if ($match) {
  Write-Host "✅ Acesso permitido para $usuario ($(.perfil))" -ForegroundColor Green
} else {
  Write-Host "❌ Acesso negado para $usuario" -ForegroundColor Red
}
Read-Host "Pressione ENTER para encerrar"
