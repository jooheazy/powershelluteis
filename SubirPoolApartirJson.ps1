$modulo = "Beneficio","Negocio"

$json = Get-Content -Path .\CD\Core.json | Out-String | ConvertFrom-Json

#Import-Module ServerManager
#Add-WindowsFeature Web-Scripting-Tools

Foreach ($i in $modulo) {
Import-Module WebAdministration;
Write-Host $i
$sistema = $json.$i
$apppool = $json.$i.Pool
Write-Host $sistema
Write-Host $apppool
$apppoost = (Get-WebAppPoolState -Name $apppool | Select-Object).value
echo $apppoost
if ($apppoost -match "Stopped"){
Start-WebAppPool -Name $apppool
Write-Host "Pool " $apppool " Startado"
}
else {
Write-Host "Pool já está Startado."
}
}