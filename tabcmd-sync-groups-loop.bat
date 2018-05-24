@echo OFF
 
:: This script loops through AD group names in a CSV file and syncs them with a Tableau Server
:: The CSV file should only contain a single column of group names, one per line, in the first column
:: Note you MUST install tabcmd first and know the path where the executable is located

:: You need to set all these variables first for the script to work!
set tabcmdpath="C:\Program Files\Tableau\Tableau Server\2018.1\extras\Command Line Utility"
set tableauservername="https://server.tableau.com"
set siteid=""
set serveruser="tableau"
set password="tableau"
set groupcsv="C:\temp\test.csv"
set workingdir=%~dp0

cd /d %tabcmdpath%

tabcmd login -s %tableauservername% -t %siteid% -u %serveruser% -p %password%

for /F "usebackq" %%a in (%groupcsv%) do tabcmd syncgroup %%a

tabcmd logout

cd %workingdir%

