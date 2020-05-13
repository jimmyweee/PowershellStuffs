$toot = Get-Content .\outbox.json -Raw -Encoding UTF8 | ConvertFrom-Json
$tootpurge = $toot.psobject.properties.value.id -replace '\D+(\d+)\D+','$1'
$soopersecret = Get-Content .\saywhatnow.txt -Raw -Encoding UTF8
ForEach($item in $tootpurge) {
  $PurgeURL = "https://counter.social/api/v1/statuses/$item"
  Invoke-WebRequest -Headers @{"Authorization"="Bearer $soopersecret"} -Uri $PurgeURL -Method DELETE
  Start-Sleep -Seconds 90
  }
