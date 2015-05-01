param (
$M = 'READ ME!!!11', # Notification message
$T = 'Notification', # Notification title
[int]$S = 10000,     # Timeout
[ValidateSet('None', 'Info', 'Warning', 'Error')]
$I = 'Info',         # Icon type
[switch]$D,          # Debug?
[switch]$H           # Help
)
[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") | Out-Null

if($H) {
	echo ""
		 "{0}: Simple tool for notifying user." -f $MyInvocation.MyCommand.Name
		 " Usage: {0} [[-M] 'Text'][[-T] 'Title'][[-S] Timeout][[-I] 'Type'][-D]" -f $MyInvocation.MyCommand.Definition
		 " or `t{0} -H" -f $MyInvocation.MyCommand.Definition
		 ""
		 " -M`tNotification message"
		 " -T`tNotification title"
		 " -S`tTime in milliseconds for notification to be shown. Default is 10000 ms."
		 "`tWill affect only if no actions were made in last 1-2 minutes."
		 " -I`tIcon type. Available types are 'None', 'Info', 'Warning', 'Error'"
		 " -D`tOutput some debug data and show notification."
		 " -H`tShow this help"
		 ""
		 " Example:"
		 " ffmpeg ... ; `$? | {0} -M `$(`"{1}`" -f `$(if(`$?){2}else{3}))" -f $MyInvocation.MyCommand.Name, '{0}', '{"Success!"}', '{"Failure!"}'
		 " robocopy .\backup .\share\backup /S ; {0} -T Robocopy `"Finished copying`"" -f $MyInvocation.MyCommand.Name
} else {

    If ($D) {
    	echo "Debug data:"
    	echo $("Script: {0}" -f $MyInvocation.MyCommand.Definition)
    	echo "`$T=$T"
    	echo "`$M=$M"
    	echo "`$S=$S"
    	echo "`$I=$I"
    	echo "`$D=$D"
	}

	if ($bNotify) {
	 $bNotify.Dispose()
	}

	$bNotify = New-Object System.Windows.Forms.NotifyIcon                 # Initialise notification balloon object
	$path = Get-Process -id $pid | Select-Object -ExpandProperty Path     # Get path of current program instance
	$bNotify.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($path)   # Set tray icon to program's one
	$bNotify.Visible         = $True  # Set notfication visible
	$bNotify.BalloonTipTitle = $T     # Set notification title
	$bNotify.BalloonTipText  = $M     # Set notification message
	$bNotify.BalloonTipIcon  = $I     # Set notification       
	$bNotify.ShowBalloonTip([int]$S)  # Show balloon for specified time
}
