$startDate = Get-Date;
$basePath = "\\dmps_sql12_fs\DMPS\DMPSReportLibrary\"
Write-Host $startDate;
$dirs = gci -Path $basePath | Where-Object {$_.Attributes -eq 'Directory'}
foreach ( $dir in $dirs ) {
    #Write-Host $dir
    $newPath = $basePath + $dir 
    $badPath = $newPath + "\2014\Purple Summary\Quarterly FICA SUI FUTA\3rd Quarter"
    $goodPath = $newPath + "\2014\Quarterly Summary\Quarterly FICA SUI FUTA\3rd Quarter"
    $badPathExists = Test-Path -Path $badPath;
    if($badPathExists -eq "true"){
        Write-Host "move: " $badPath " to " $goodPath;
        move-item -path $badPath -destination $goodPath
    }
}
$endDate = Get-Date;
Write-Host $endDate