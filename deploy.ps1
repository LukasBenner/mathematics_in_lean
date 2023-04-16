
& mdbook build

mkdir deploy
Set-Location deploy
git init
Copy-Item ..\out\* . -Recurse
git add -A

$date = Get-Date
git commit -m "Update $date"
git push git@github.com:LukasBenner/mathematics_in_lean.git +HEAD:gh-pages

Set-Location ..\
Remove-Item deploy -Recurse -Force