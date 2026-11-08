# Stellt die aktuelle lerntool.html online (GitHub Pages). Aufruf:
#   powershell -ExecutionPolicy Bypass -File "web\veroeffentlichen.ps1"
$ErrorActionPreference = 'Stop'
$web = $PSScriptRoot
Copy-Item (Join-Path $web '..\lerntool.html') (Join-Path $web 'index.html') -Force
Set-Location $web
git add -A
git diff --cached --quiet
if ($LASTEXITCODE -eq 0) { Write-Host 'Keine Änderungen, nichts zu veröffentlichen.'; exit 0 }
git commit -m "Lerntool aktualisiert $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
git push
Write-Host 'Online. Nach etwa einer Minute ist die neue Version auf dem Handy (App einmal neu öffnen).'
