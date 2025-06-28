$contents = Get-Content ".\scoop-list.json" | ConvertFrom-Json

foreach ($bucket in $contents.buckets) {
    # Write-Host "$($bucket.Name)"
    scoop bucket add $bucket.Name
}

foreach ($app in $contents.apps) {
    # Wrist-Host "$($app.Name)"
    scoop install $app.Name
}
