$startDate = Get-Date;
$basePath = "\\dmps_sql12_fs\DMPS\DMPSReportLibrary\"
Write-Host $startDate;
$dirs = gci -Path $basePath | Where-Object {$_.Attributes -eq 'Directory'}
foreach ( $dir in $dirs ) {
    #Write-Host $dir
    $newPath = $basePath + $dir 
    $badPath = $newPath + "\2014\Purple Summary"
    $badPathExists = Test-Path -Path $badPath;
    if($badPathExists -eq "true"){
        Write-Host "removing: " $badPath
        Remove-Item -Path $badPath -Force -Recurse
    }
}
$endDate = Get-Date;
Write-Host $endDate