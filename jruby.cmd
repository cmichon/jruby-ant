@echo off
setlocal
set GEM_HOME=%~dps0gem
set GEM_PATH=%GEM_PATH%
set TERM=vt100
%JAVA_HOME%\bin\java             ^
-Xmx2G -XX:+PerfDisableSharedMem ^
-Djava.io.tmpdir=%~dps0tmp       ^
-cp %~dps0lib/* org.jruby.Main   ^
-rubygems %*
del /q %~dps0tmp
endlocal
