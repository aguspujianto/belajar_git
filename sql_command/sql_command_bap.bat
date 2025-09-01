@echo off
   --sqlcmd -S 192.168.2.200\MSSQLSERVER -i "C:\data\Pak bernad\vs_insentive\gmc\sql_command\sql_command_bap.sql" -o "C:\data\Pak bernad\vs_insentive\gmc\sql_command\sql_command_bap.txt"
   sqlcmd -S localhost\MSSQLSERVER -i "C:\data\Pak bernad\vs_insentive\gmc\sql_command\sql_command_bap.sql" -o "C:\data\Pak bernad\vs_insentive\gmc\sql_command\sql_command_bap.txt"

pause