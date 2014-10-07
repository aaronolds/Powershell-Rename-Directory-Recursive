param([String]$p1, [Datetime]$p2)

$dirs = Get-ChildItem -PATH $p1 | Where-Object { $_.Attributes -eq 'Directory' -and $_.CreationTime -le $p2 }

foreach($dir in $dirs){
    Write-Host $dir
    #Remove-Item -Path $dir -Force -Recurse
}