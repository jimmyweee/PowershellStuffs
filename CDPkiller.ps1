# Kill these services to stop Windows 10 from connecting to activity.windows.com
# Must be run as Administrator

$killme = Get-Service | Where {$_.Name -like "CDPUser*"}
Stop-Service $killme
Stop-Service CDPSvc
