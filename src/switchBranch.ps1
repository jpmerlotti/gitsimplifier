param(
    [string]$RepoPath
)

Write-Host "⏳ (1/4) Buscando executável do git...      " -noNewline
& git --version
if ($lastExitCode -ne "0") { throw "GIT executável não encontrado - garanta que ele está devidamente instalado!" }


Write-Host "⏳ (2/4) Coletando dados essenciais.... "
if (-not $RepoPath) {
    $RepoPath = Read-Host "Informe o caminho do repositório (padrão: caminho atual)"
    if (-not $RepoPath) { $RepoPath = Get-Location }
}

Set-Location $RepoPath
Write-Host "⏳ (3/4) Listando branches disponíveis:"
& git branch -a

$BranchName = Read-Host "Informe o nome da branch para alternar"
Write-Host "⏳ (4/4) Mudando para branch '$BranchName'.... "
git checkout $BranchName
Write-Host "✅ Alterado para a branch '$BranchName' no repositório em $RepoPath" -ForegroundColor Green
