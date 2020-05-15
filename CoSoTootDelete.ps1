# outbox.json is the Toot data received when downloading your data from CounterSocial.
# saywhatnow.txt is your API key, ensure there are no extra spaces or returns.
# Script will cycle through each of your Toots indiscriminately and delete one every 90 seconds.

$toot = Get-Content .\outbox.json -Raw -Encoding UTF8 | ConvertFrom-Json
$tootpurge = $toot.psobject.properties.value.id -replace '\D+(\d+)\D+','$1'
$soopersecret = Get-Content .\saywhatnow.txt -Raw -Encoding UTF8
ForEach($item in $tootpurge) {
  $PurgeURL = "https://counter.social/api/v1/statuses/$item"
  Invoke-WebRequest -Headers @{"Authorization"="Bearer $soopersecret"} -Uri $PurgeURL -Method DELETE
  Start-Sleep -Seconds 90
  }
