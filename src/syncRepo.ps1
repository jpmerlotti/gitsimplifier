param(
    [string]$RepoPath
)

Write-Host "⏳ (1/6) Buscando executável do git...      " -noNewline
& git --version
if ($lastExitCode -ne "0") { throw "GIT executável não encontrado - garanta que ele está devidamente instalado!" }

Write-Host "⏳ (2/6) Coletando dados essenciais.... "
if (-not $RepoPath) {
    $RepoPath = Read-Host "Informe o caminho do repositório (padrão: caminho atual)"
    if (-not $RepoPath) { $RepoPath = Get-Location }
}

Set-Location $RepoPath
Write-Host "⏳ (3/6) Sincronizando repositório em $RepoPath..."

Write-Host "⏳ (4/6) Atualizando referências locais..."
git fetch

Write-Host "⏳ (5/6) Fazendo pull das alterações..."
git pull

Write-Host "⏳ (6/6) Fazendo push das alterações locais..."
git push

Write-Host "✅ Repositório sincronizado com sucesso!" -ForegroundColor Green
