param(
    [string]$Action, # "create" ou "clone"
    [string]$TargetFolder,
    [string]$RepoNameOrUrl
)

if (-not $Action) {
    $Action = Read-Host "Escolha 'create' para criar um repositório ou 'clone' para clonar"
}

if ($Action -eq "create") {
    if (-not $TargetFolder) {
        $TargetFolder = Read-Host "Informe o caminho para criar o repositório (padrão: caminho atual)"
        if (-not $TargetFolder) { $TargetFolder = Get-Location }
    }

    if (-not $RepoNameOrUrl) {
        Write-Host "Nenhum nome informado. Inicializando repositório no diretório atual: $TargetFolder"
        Set-Location $TargetFolder
        git init
    }
    else {
        if (-not (Test-Path -Path $TargetFolder)) {
            Write-Host "O diretório '$TargetFolder' não existe. Criando diretório..."
            New-Item -ItemType Directory -Force -Path $TargetFolder
        }
        
        Set-Location $TargetFolder
        if (-not (Test-Path -Path "$TargetFolder\$RepoNameOrUrl")) {
            Write-Host "Criando repositório '$RepoNameOrUrl' no diretório '$TargetFolder'..."
            mkdir $RepoNameOrUrl
            Set-Location $RepoNameOrUrl
            git init
            Write-Host "Repositório '$RepoNameOrUrl' criado com sucesso!" -ForegroundColor Green
        }
        else {
            Write-Host "Repositório '$RepoNameOrUrl' já existe em '$TargetFolder'. Inicializando repositório no diretório existente."
            Set-Location "$TargetFolder\$RepoNameOrUrl"
            git init
        }
    }

}
elseif ($Action -eq "clone") {
    if (-not $RepoNameOrUrl) {
        $RepoNameOrUrl = Read-Host "Informe a URL do repositório para clonar"
    }

    if (-not $TargetFolder) {
        $TargetFolder = Read-Host "Informe o caminho para clonar o repositório (padrão: caminho atual)"
        if (-not $TargetFolder) { $TargetFolder = Get-Location }
    }

    Set-Location $TargetFolder
    git clone $RepoNameOrUrl
    Write-Host "Repositório '$RepoNameOrUrl' clonado com sucesso para $TargetFolder!" -ForegroundColor Green

}
else {
    Write-Host "Ação inválida. Escolha 'create' ou 'clone'." -ForegroundColor Red
}
