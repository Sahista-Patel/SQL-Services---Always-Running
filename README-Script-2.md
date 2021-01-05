# SQL-Services---Always-Running
## Script - 1
This script will check the status of the SQL Services for mentioned servers (Passed in txt file). Gives the email alert as well as HTML file with the table of services specifically NOT IN Running State. Two Scripts should be run in sequence. After excution of this script one txt file will be generated then it will processed by Script 2.

Independent Script.
The Server Name, Process Status, Process Name, Display Name.
It will send an email, if scheduled then it is monitoring technique for SQL services on bunch of servers.
If it is scheduled with Script - 2 then it auto-restart of the services will trigger without manual interaction.

## Prerequisites

Windows OS - Powershell

## Note
  
Server Name - Name of the target Machine
Process Status - SQL Services State except Running
Process Name - Service Name
Display Name - Service's display Name


## Use

Open Powershell
"C:\Script-1.ps1"


# Input
Server list file path to (example) {$path = "C:\server_list.txt"}<br>
The output txt file path for next script input (example) {$path = "C:\service_status_txt.txt"}<br>
The output file path to (example) {$outpath = "C:\disk_status_htm.html"}<br>
Give Disk Space threshold in % (0 to 100) (example) {$DiskThreshold = 50}<br>
Set Email From (example) {$EmailFrom = “example@outlook.com”}<br>
Set Email To (example) {$EmailTo = “example@outlook.com"}<br>
Set Email Subject (example) {$Subject = “Disk Space Status”}<br>
Set SMTP Server Details (example) {<br> 
$SMTPServer = “smtp.outlook.com” <br>
$SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 587)<br>
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential(“example@outlook.com”, “Password”);}

## Example O/P

![alt text](https://github.com/Sahista-Patel/SQL-Services---Always-Running/blob/Powershell/services.PNG)

## License

Copyright 2020 Harsh & Sahista

## Contribution

* [Harsh Parecha] (https://github.com/TheLastJediCoder)
* [Sahista Patel] (https://github.com/Sahista-Patel)<br>
We love contributions, please comment to contribute!

## Code of Conduct

Contributors have adopted the Covenant as its Code of Conduct. Please understand copyright and what actions will not be abided.
