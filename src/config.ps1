param(
    [string]$Scope, # "global" ou "local"
    [string]$UserName,
    [string]$UserEmail
)

Write-Host "⏳ (1/3) Buscando executável do git...      " -noNewline
& git --version
if ($lastExitCode -ne "0") { throw "GIT executável não encontrado - garanta que ele está devidamente instalado!" }

Write-Host "⏳ (2/3) Coletando detalhes do usuário...      "
if (-not $Scope) {
    $Scope = Read-Host "Informe o escopo (global ou local)"
}

if ($Scope -notin @("global", "local")) {
    Write-Host "⚠️ Escopo inválido. Escolha 'global' ou 'local'." -ForegroundColor Yellow
    exit
}

if (-not $UserName) {
    $UserName = Read-Host "Informe o nome de usuário"
}

if (-not $UserEmail) {
    $UserEmail = Read-Host "Informe o email"
}

Write-Host "⏳ (3/3) Aplicando configurações ($Scope)..."
git config --$Scope user.name $UserName
git config --$Scope user.email $UserEmail
Write-Host "✅ Configuração aplicada com sucesso!" -ForegroundColor Green
