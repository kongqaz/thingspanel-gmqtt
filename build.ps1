$env:GOOS="linux"
$env:GOARCH="amd64"
$env:CGO_ENABLED="0"
Set-Location cmd/gmqttd
go build -o ../../gmqttd-linux .
Set-Location ../..
Write-Host "Built gmqttd-linux successfully"
