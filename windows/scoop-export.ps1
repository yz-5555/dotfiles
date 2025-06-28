$target = ".\scoop-list.json"

# Remove old target
Remove-Item -Path $target -Recurse -Force
Write-Host "Removed $target"

scoop export > "$target"
Write-Host "Created $target"
