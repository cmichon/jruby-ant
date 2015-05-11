@echo off
setlocal
set IRBRC=%~dps0irbrc
jruby -S %~n0
endlocal
