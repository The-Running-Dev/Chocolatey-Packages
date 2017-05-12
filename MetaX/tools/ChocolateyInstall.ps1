$ErrorActionPreference = 'Stop'

$arguments = @{
    packageName    = $env:ChocolateyPackageName
    softwareName   = 'MetaX*'
    url            = 'http://www.danhinsley.com/downloads/MetaXSetup.msi'
    checksum       = 'AA0CB5CB4E06BD31A0227C0236FBB757E0CBB564B4B8649D7A6A9BEE55549D95'
    fileType       = 'msi'
    checksumType   = 'sha256'
    silentArgs     = '/quiet'
    validExitCodes = @(0, 1641, 3010)
}

Install-ChocolateyPackage @arguments
