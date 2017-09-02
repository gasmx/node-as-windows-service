@ECHO OFF

SET basedir=C:\www\dedicado-service
SET dir=%basedir%\nssm.exe
SET service=MY_SERVICE_11

ECHO INSTALLING SERVICE %service%

%dir% stop %service%
%dir% remove %service% confirm
%dir% install %service% %service%
%dir% set %service% Application %basedir%\initializer.bat
%dir% set %service% AppDirectory %basedir%
%dir% set %service% Description "Node Windows Service test"
%dir% set %service% Start %service%
%dir% set %service% AppStopMethodSkip 0
%dir% set %service% AppStopMethodConsole 0
%dir% set %service% AppStopMethodWindow 0
%dir% set %service% AppStopMethodThreads 0
%dir% set %service% AppThrottle 0
%dir% set %service% AppExit Default Ignore
%dir% set %service% AppRestartDelay 0
%dir% set %service% AppStdout %basedir%\logs\%service%.log
%dir% set %service% AppStderr %basedir%\logs\%service%.log
%dir% set %service% AppStdoutCreationDisposition 4
%dir% set %service% AppStderrCreationDisposition 4
%dir% set %service% AppRotateFiles 1
%dir% set %service% AppRotateOnline 0
%dir% set %service% AppRotateSeconds 3600
%dir% set %service% AppRotateBytes 524288