$entrada = $args[0]

$servico = $entrada
$caminhosaida = "C:\setup\" + $servico +"_cont.txt"
$caminholog = "C:\Data\Erro__20220120_14_0003.err"
$nomeservico = $servico
if (Test-Path -Path $caminhosaida){
$loganteriorvalor = $caminhosaida
} else{
New-Item -Path $caminhosaida -ItemType "File"
$loganteriorvalor = $caminhosaida
}


$logatualvalor = $caminholog
$loganterior = (Get-Content -Path $loganteriorvalor).Length
$logatual = (Get-Content -Path $logatualvalor).Length


if ($logatual -eq $loganterior){
Restart-Service -Name $nomeservico -Force
Write-Host "Restartou serviço"
}
else{
Set-Content -Path $loganteriorvalor -Value (Get-Content -Path $logatualvalor ) -Force
Write-Host "Preencheu arquivo"
}
