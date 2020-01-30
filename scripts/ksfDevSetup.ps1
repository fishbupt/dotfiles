function InstallChoco
{
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    Write-Output "Run InstallChoco"
}

$packagesByPython = 'cmake', 'conan'
$packagesByChoco = 'nodejs-lts', 'python3', 'git', 'vim', 'neovim', 'vscode', 'git-fork', '7zip', 'ninja'

function InstallPackages
{
   

    ForEach($item in $packagesByChoco)
    {
        choco upgrade $item -y
        Write-Output "To Install $item"
    }

    
    ForEach($item in $packagesByPython)
    {
        choco install $item --source python
    }
    
}
function UninstallPackages
{
    ForEach($item in $packagesByPython)
    {
        Invoke-Expression "pip uninstall $item -y"
    }

    ForEach($item in $packagesByChoco)
    {
        choco uninstall $item -y
    }
}

function CheckInstallPackages
{
    $cmds = 'node --version', 'python --version', 'git --version'
    ForEach($cmd in $cmds)
    {
        Invoke-Expression $cmd
    }
}

function Install
{
    If(Test-Path -Path "C:\ProgramData\chocolatey") 
    {
        InstallPackages
        # CheckInstallPackages
    }
    Else
    {
        InstallChoco
        InstallPackages
    }
}


If($args.Length -gt 0)
{
    Write-Output 'here'
    ForEach($arg in $args)
    {
        If($arg -eq 'uninstall')
        {
            UninstallPackages
        }
        Else 
        {
            Write-Output "Unknown arg: $arg"
        }
    }
}
Else
{
    Install
}


