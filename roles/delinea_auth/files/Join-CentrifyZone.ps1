# Invoke DzJoin.exe to enroll system to Delinea Zone
# Parameters
$Zone = "aasgaard.lab/Delinea/Zones/Global/Windows"
$ServiceAccount = "svc_delineadzjoin@aasgaard.lab"
$Secret = "Delinea"

# Invoke DzJoin.exe
echo $Secret | & 'C:\Program Files\Centrify\Centrify Agent for Windows\DzJoin.exe' /f /r yes /z $Zone /u $ServiceAccount
