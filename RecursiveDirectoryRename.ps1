$startDate = Get-Date;
$basePath = "[ReplaceMeWithTheStartingPath]"
Write-Host $startDate;
$dirs = gci -Path $basePath | Where-Object {$_.Attributes -eq 'Directory'}
foreach ( $dir in $dirs ) {
    Write-Host $dir
    $newPath = $basePath + $dir
    Set-Location $newPath

    $dirPurpleSummaries = gci -Path $newPath -Recurse | Where-Object {$_.Attributes -eq 'Directory' -and $_.Name -eq '[FolderNameToBeReplaced]'}
    foreach ( $dirPurpleSummary in $dirPurpleSummaries ) {
        Write-Host $dirPurpleSummary
        $item = Get-Item $dirPurpleSummary.FullName
        $oldpath = $($item.fullname)
        $oldname = $($item.fullname | split-path -leaf)
        $newname = $($oldname) -replace "[FolderNameToBeReplaced]","[NewFolderName]"
        #write-host Checking Path: $oldpath
        if (!$oldname.contains($newname)) {
            Write-Host Renaming $oldname to $newname;
            Rename-Item -Path $oldpath -NewName $newname
        }
    }
}
$endDate = Get-Date;
Write-Host $endDate