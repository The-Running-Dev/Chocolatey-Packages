$ErrorActionPreference = 'Stop'

$arguments = @{
    packageName    = $env:ChocolateyPackageName
    softwareName   = 'MetaX*'
    url            = 'http://www.danhinsley.com/downloads/MetaXSetup.msi'
    checksum       = ''
    fileType       = 'msi'
    checksumType   = ''
    silentArgs     = '/quiet'
    validExitCodes = @(0, 1641, 3010)
}

Install-ChocolateyPackage @arguments
