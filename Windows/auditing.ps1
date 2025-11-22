# Audit System Powershell
###########################################
######## Script Auditing ##################
###########################################
############### by magicsale ##############
###########################################
##################################
# GitHub: https://github.com/MS-0x404
##################################
$data = Get-Date
$log = "C:\log_audit.txt"
$validIDs = @("4776", "4624", "4720", "4732", "4733", "4726", "1102", "4740", "4647", "4656", "4663", "4658")

function help() {
Write-Host "Event ID:"
@"
4776: Fail Logon.
4624: An account was successfully logged on.
4720: A user account was created.
4732: A member was added from a security-enabled local group.
4733: A member was added from a security-enabled local group.
4726: A user account was deleted
1102: the audit log was cleared
4740: A user account was locked out
4647: user initiated logoff
4656: An Handle to an object was requested.
4663: An attempt was made to access an object
4658: the handle of an object was closed
"@ | Write-Host
return
}
function audit($idname, $userdata) {
    if ([string]::IsNullOrEmpty($userdata)) {
        Get-WinEvent -FilterHashtable @{LogName='Security'; Id=$idname} | Sort-Object TimeCreated -Descending | Format-List
    } else {
        Get-WinEvent -FilterHashtable @{LogName='Security'; Id=$idname; Data=$userdata} | Sort-Object TimeCreated -Descending | Format-List
    }}


function main() {
    Write-Host "Welcome to Audit - Powershell | Windows"
    Write-Host "-----------------------------------------"
    Write-Host "-------------------     $data - By MS    "
    $ID = Read-Host("Scrivi ID che vuoi monitorare (o 'help' per aiuto)")
    if ( $ID -eq "help" ) {
        help
        exit 1
    }

    if ($validIDs -contains $ID) {
        $target = Read-Host("Scrivi (user, handle ID, Type) che vuoi monitorare (o lascia vuoto)")
        audit $ID $target | Tee-Object -FilePath $log
    } else {
        Write-Host "Comando non valido!"
        exit 1
    }
}

main 

