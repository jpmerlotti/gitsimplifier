param(
    [string]$RepoPath,
    [string]$BranchName
)

Write-Host "⏳ (1/3) Buscando executável do git...      " -noNewline
& git --version
if ($lastExitCode -ne "0") { throw "GIT executável não encontrado - garanta que ele está devidamente instalado!" }

Write-Host "⏳ (2/3) Coletando detalhes...      "
if (-not $RepoPath) {
    $RepoPath = Read-Host "Informe o caminho do repositório (padrão: caminho atual)"
    if (-not $RepoPath) { $RepoPath = Get-Location }
}

Set-Location $RepoPath
if (-not $BranchName) {
    $BranchName = Read-Host "Informe o nome da nova branch"
}

Write-Host "⏳ (3/3) Criando branch '$BranchName'..."
git checkout -b $BranchName
Write-Host "✅ Branch '$BranchName' criada e ativada com sucesso!" -ForegroundColor Green
