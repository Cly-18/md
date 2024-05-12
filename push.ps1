$data=Get-Date -Format "yyyy/dd/MM HH:mm dddd"
git commit -a -m $data
git push -u origin main
git push -u gitee master
cmd /c 'pause'