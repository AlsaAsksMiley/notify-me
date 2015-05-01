# notify-me
Simple PowerShell script for notifying user
Usage:
```
Notify-Me [[-M] 'Text'][[-T] 'Title'][[-S] Timeout][[-I] 'Type'][-D]
```
or simply
```
Notify-Me -H
```
#### Options


Option | Description
----|----
`-M` | Notification message
`-T` | Notification title
`-S` | Time in milliseconds for notification to be shown. Default is 10000 ms. Will affect only if no actions were made in last 1-2 minutes.
`-I` | Icon type. Available types are 'None', 'Info', 'Warning', 'Error'
`-D` | Output some debug data and show notification.
`-H` | Show this help


#### Examples
 `ffmpeg ... ; $? | Notify-Me.ps1 -M $("{0}" -f $(if($?){"Success!"}else{"Failure!"}))`
 
 `robocopy .\backup .\share\backup /S ; Notify-Me.ps1 -T Robocopy "Finished copying"`
