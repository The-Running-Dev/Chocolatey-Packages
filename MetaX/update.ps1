Import-Module AU

function global:au_GetLatest {
    $releaseUrl = 'http://danhinsley.com/metax/metax.html'
    $versionRegEx = 'V([0-9\.]+)\sReleased'
    $url = 'http://www.danhinsley.com/downloads/MetaXSetup.msi'

    $releasePage = Invoke-WebRequest -Uri $releaseUrl -UseBasicParsing
    $version = ([regex]::match($releasePage.Content, $versionRegEx).Groups[1].Value)

    return @{ Version = $version; Url32 = $url }
}

function global:au_SearchReplace {
    return @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"          = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*checksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
        }
    }
}

update -ChecksumFor none