<#
.SYNOPSIS
    Script - 2
    This script will parse the txt file created by Script - 1 and then starts the SQL services which are not running.

.DESCRIPTION
    Dependent Script.
    This script will parse the txt file created by Script - 1 and then starts the SQL services which are not running.
    It is important to execute Script - 1 first to run this Scrip - 2.        

.INPUTS
    Server List - txt file with the name of the machines/servers which to examine.
    service_status_txt file generated from Script - , services which needs to be restart.
    Requirement of service down then remove servers from server list - txt file it won't work on that.

.EXAMPLE
    .\Script-2.ps1
    This will execute the script and start the NOT running SQL services remotely for respective servers.

.NOTES
    PUBLIC

.AUTHOR
    Harsh Parecha
    Sahista Patel
#>

$list = Get-Content C:\service_status_txt.txt
$list2 = Get-Content C:\server_list.txt
 
$ComputerName = @()
for($i = 0; $i -lt $list.length; $i++){
    $ComputerName =  $list[$i]
    $i++
    if ( $list2.Contains($ComputerName)){
     while( $list[$i] -ne "Server-Break"){
        Get-Service -ComputerName $ComputerName -Name $list[$i] | Start-Service
        $i++
        }
         Get-service -DisplayName *SQL* -ComputerName $ComputerName | where-object {$_.Status -ne "Running"}
    }
    else{
         while( $list[$i] -ne "Server-Break"){
        $i++
        }
    }
     $ComputerName = @()
    }  
