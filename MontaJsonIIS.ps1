$js = '{#modulo#:{Pool: "#pool#",Site: "#site#",Caminho: "#caminho#"},'
$arquivo

Foreach ($i in (Get-IISSite | Select-Object).name){
Write-Host $i
$Site = $i
$m=""
$ca = (Get-Website $i | Select-Object).PhysicalPath
Write-Host $ca
$pool = (Get-IISSite $i | Select-Object -ExpandProperty Applications).ApplicationPoolName
Write-Host $pool
$modulo = (Get-Item -Path $ca | Select-Object).Name
$m = $js.Replace("#modulo#", $modulo)
$m = $m.Replace("#pool#", $pool)
$m = $m.Replace("#site#", $Site)
$m = $m.Replace("#caminho#", $ca)
$m = $m.Replace("\","\\")
$arquivo += $m
}
Write-Host $arquivo