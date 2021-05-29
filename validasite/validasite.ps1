$uri = "https://google.com"

try{
        #For proxy systems
        [System.Net.WebRequest]::DefaultWebProxy = [System.Net.WebRequest]::GetSystemWebProxy()
        [System.Net.WebRequest]::DefaultWebProxy.Credentials = [System.Net.CredentialCache]::DefaultNetworkCredentials

        #Web request
        $req = [system.Net.WebRequest]::Create($uri)
        $res = $req.GetResponse()
}catch {
        #Err handling
        $res = $_.Exception.Response
}
$req = $null

#Getting HTTP status code
$int = [int]$res.StatusCode
 #Writing on the screen
Write-Host "$int - $uri"

#Disposing response if available
if($res){
$res.Dispose()
}