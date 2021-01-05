# SQL-Services---Always-Running
## Script - 2
This script will parse the txt file created by Script - 1 and then starts the SQL services which are not running.

Dependent Script.
This script will parse the txt file created by Script - 1 and then starts the SQL services which are not running.
It is important to execute Script - 1 first to run this Scrip - 2.

## Prerequisites

Windows OS - Powershell
It is important to execute Script - 1 first to run this Scrip - 2.

## Note
  
If requirement of service down then remove servers from server list - txt file it won't work on that.


## Use

Open Powershell
"C:\Script-2.ps1"


## Input
Server list file path to (example) {$path = "C:\server_list.txt"}<br>
The input txt file path created by Script - 1 (example) {$path = "C:\service_status_txt.txt"}<br>


## Output

This will execute the script and start the NOT running SQL services remotely for respective servers.

## License

Copyright 2020 Harsh & Sahista

## Contribution

* [Harsh Parecha] (https://github.com/TheLastJediCoder)
* [Sahista Patel] (https://github.com/Sahista-Patel)<br>
We love contributions, please comment to contribute!

## Code of Conduct

Contributors have adopted the Covenant as its Code of Conduct. Please understand copyright and what actions will not be abided.
