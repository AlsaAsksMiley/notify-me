# Notify-Me
Simple PowerShell script for notifying user.

Usage (in PowerShell):
```
Notify-Me [[-M] 'Text'][[-T] 'Title'][[-S] Timeout][[-I] 'Type'][-D]
```
or simply
```
Notify-Me -H
```

#### System Requirements
* Microsoft .NET Framework 3 and above
* At least `RemoteSigned` [execution policy](https://technet.microsoft.com/en-us/library/ee176961.aspx) must be set
* It's highly recommended to put script into easy accessible location, which is in PATH

#### Installation
No need to install — just download it and put in preferred location.

#### Options
Option | Description
----|----
`-M` | Notification message
`-T` | Notification title
`-S` | Time in milliseconds for notification to be shown. Default is 10000 ms. Will affect only if no actions were made in last 1-2 minutes.
`-I` | Icon type. Available types are `'None'`, `'Info'`, `'Warning'`, `'Error'`
`-D` | Output some debug data and show notification.
`-H` | Show help


#### Examples
Assuming Notify-Me is accessible from PATH locations:    
 `ffmpeg ... ; $? | Notify-Me.ps1 -M $("{0}" -f $(if($?){"Success!"}else{"Failure!"}))`    
 Show notification with text "Success!" or "Failure!" depending on FFmpeg exit code.    
 `robocopy .\backup .\share\backup /S ; Notify-Me.ps1 -T Robocopy "Finished copying"`    
Show notification with text "Finished copying" after `robocopy` exits.
