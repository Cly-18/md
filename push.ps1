$data=Get-Date -Format "yyyy/dd/MM HH:mm dddd"
git commit -a -m $data
git push -u origin main
cmd /c 'pause'