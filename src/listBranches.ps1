param(
    [string]$RepoPath
)

Write-Host "⏳ (1/3) Buscando executável do git...      " -noNewline
& git --version
if ($lastExitCode -ne "0") { throw "GIT executável não encontrado - garanta que ele está devidamente instalado!" }

Write-Host "⏳ (2/3) Coletando dados essenciais.... "
if (-not $RepoPath) {
    $RepoPath = Read-Host "Informe o caminho do repositório (padrão: caminho atual)"
    if (-not $RepoPath) { $RepoPath = Get-Location }
}

Set-Location $RepoPath
Write-Host "⏳ (3/3) Listando branches no repositório em $RepoPath..."
& git branch -a
