function Show-Menu {
    Write-Host ""
    Write-Host "Bem vindo ao Git Simplifier"
    Write-Host "#-----------------------------"
    Write-Host "1. Configuração Inicial (global ou local)"
    Write-Host "2. Criar ou Clonar Repositório"
    Write-Host "3. Listar Branches"
    Write-Host "4. Mudar de Branch"
    Write-Host "5. Criar Branch"
    Write-Host "6. Sincronizar Repositório"
    Write-Host "0. Sair"
    Write-Host "#-----------------------------"
}

do {
    Set-Location "C:\Projetos\SistemasOperacionais\"
    Show-Menu
    $choice = Read-Host ">>>"

    switch ($choice) {
        "1" { . C:\Projetos\SistemasOperacionais\src\config.ps1 }
        "2" { . C:\Projetos\SistemasOperacionais\src\createOrClone.ps1 }
        "3" { . C:\Projetos\SistemasOperacionais\src\listBranches.ps1 }
        "4" { . C:\Projetos\SistemasOperacionais\src\switchBranch.ps1 }
        "5" { . C:\Projetos\SistemasOperacionais\src\createBranch.ps1 }
        "6" { . C:\Projetos\SistemasOperacionais\src\syncRepo.ps1 }
        "0" { Write-Host "⏳ Saindo..." -ForegroundColor Yellow; break }
        default { Write-Host "⚠️  Opção inválida. Tente novamente." -ForegroundColor Red }
    }
} while ($choice -ne "0")
