$startDate = Get-Date;
$basePath = "[ReplaceMeWithTheStartingPath]"
Write-Host $startDate;
$dirs = gci -Path $basePath | Where-Object {$_.Attributes -eq 'Directory'}
foreach ( $dir in $dirs ) {
    #Write-Host $dir
    $newPath = $basePath + $dir 
    $badPath = $newPath + "[OriginalFolderName]"
    $goodPath = $newPath + "[NewFolderName]"
    $badPathExists = Test-Path -Path $badPath;
    if($badPathExists -eq "true"){
        Write-Host "move: " $badPath " to " $goodPath;
        move-item -path $badPath -destination $goodPath
    }
}
$endDate = Get-Date;
Write-Host $endDate