<#
.SYNOPSIS
    Script - 1
    This script will check the status of the SQL Services for mentioned servers [Passed in txt file].
    Gives the email alert as well as HTML file with the table of services specifically NOT IN Running State.
    Two Scripts should be run in sequence. After excution of this script one txt file will be generated then it will processed by Script 2.

.DESCRIPTION
    Independent Script.
    The Server Name, Process Status, Process Name, Display Name.
    It will send an email, if scheduled then it is monitoring technique for SQL services on bunch of servers.
    If it is scheduled with Script - 2 then it auto-restart of the services will trigger without manual interaction.

.INPUTS
    Server List - txt file with the name of the machines/servers which to examine.
    Please set varibles like server list path, output file path, E-Mail id and password as and when guided by comment through code.

.EXAMPLE
    .\Script-1.ps1
    This will execute the script and gives HTML file and email with the details in body.

.NOTES
    PUBLIC

.AUTHOR & OWNER
    Harsh Parecha
    Sahista Patel
#>


#Set the input server list file path
$path = "C:\server_list.txt"
#Set the output file path
$outpath = "C:\service_status_htm.html"
#Set the output file path
$outpath1 = "C:\service_status_txt.txt"
#Set Email From
$EmailFrom = “example@outlook.com”
#Set Email To
$EmailTo = “example@outlook.com"
#Set Email Subject
$Subject = “SQL Service Status”
#Set SMTP Server Details
$SMTPServer = “smtp.outlook.com”
$SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 587)
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential(“example@outlook.com”, “Password”);
$Row = @()
$TextFileContent = @()
$count = 0
$flag = 0
$Tag = 0
$Row = "<html><head><style>
               table {
                        font-family: arial, sans-serif;
                        border: 1px solid #1C6EA4;
                        background-color: #AED6F1;
                        border-collapse: collapse;
                        width: auto;
                     }
               th {
                        font-size: 13px;
                        border: 2px solid #D0E4F5;
                   }
               td {
                        font-size: 13px;
                        border: 1px solid #D0E4F5;
                        width: auto;
                  }
              }
    </style>
    <title>SQL Services</title>
    </head>
    <h2>SQL Sevice Status</h2>

    <body>
<table>"

[System.IO.File]::ReadLines($path) | ForEach-Object {
       
       $computername = $_
      try{
        $Services = Get-service -Displayname *SQL* -ComputerName $computername | where-object {$_.Status -ne "Running"}
        $flag = 0
      }
      catch {
           $computername + " Not available."
           $flag = 1
        }
    if($flag -ne 1){
        $count += 1
        $Row += "<tr><td style='font-size: 15px; font-weight: bold; color:#FDFEFE' bgcolor='#2471A3'>Alert: $count</td></tr><tr><td style='font-size: 15px; font-weight: bold;'>Server Name: $computername</td></tr>"
        $Row += "<tr><td style='width: auto; word-break:keep-all;'>$($Services | ConvertTo-Html -Property Status, Name, DisplayName)</td></tr>"
        $TextFileContent += $computername
        $TextFileContent += $Services.Name
        $TextFileContent += "Server-Break"
        $Tag=1
    }
}

if ($Tag -eq 1){
    $Row += "</table></body></html>"
}
else{
    $Row += "</table><h4>SQL Sevices are running for all the listed servers.</h4></body></html>"
}
Set-Content $outpath $Row
Set-Content $outpath1 $TextFileContent
$Body = $Row

$SMTPClient.EnableSsl = $true
# Create the message
$mail = New-Object System.Net.Mail.Mailmessage $EmailFrom, $EmailTo, $Subject, $Body
$mail.IsBodyHTML=$true
$SMTPClient.Send($mail)
