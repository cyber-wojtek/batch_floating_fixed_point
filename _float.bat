@echo off
setlocal enabledelayedexpansion

goto main

:float name <[whole]> <[numerator]> <[denominator]>
if "%2" neq "" (
	set /a "%1=%2*32768"
	if "%3" neq "" (
		set /a %1+=%3*32768/%4
	)
) else (
	set "%1=0"
)
exit /b

:float_add first second [to]
if "%3" neq "" (
	set /a "%3=%1+%2"
) else (
	set /a "%1+=%2"
)
exit /b

:float_subtract first second [to]
if "%3" neq "" (
	set /a "%3=%1-%2"
) else (
	set /a "%1-=%2"
)
exit /b

:float_multiply first second [to]
if "%3" neq "" (
	set /a "%3=%1/32768*(%2/32768)*32768+%1/32768*(%2%%32768)+%2/32768*(%1%%32768)+%1%%32768*(%2%%32768)/32768"
) else (
	set /a "%1=%1/32768*(%2/32768)*32768+%1/32768*(%2%%32768)+%2/32768*(%1%%32768)+%1%%32768*(%2%%32768)/32768"
)
exit /b

:float_divide first second [to]
if "%3" neq "" (
	set /a "res=%1/%2"
	if "%res%" gtr "32768" set /a "%3=res*32768" else set /a "%3=%1*127/%2*256"
) else (
	set /a "res=%1/%2"
	if "%res%" gtr "32768" set /a "%1=res*32768" else set /a "%1=%1*127/%2*256"
)
exit /b

:float_display name
set /a "whl=%1/32768"
set /a "frc=%1 %% 32768 * 10000 / 32768"
echo %whl%.%frc%
exit /b

:float_display_nnl name
set /a "whl=%1/32768"
set /a "frc=%1 %% 32768 * 10000 / 32768"
set /p "=%whl%.%frc%" < nul
exit /b

:float_extract_whole name dest
set /a "%2=%name%/32768"
exit /b

:float_extract_fraction name dest
set /a "%2=%name% %% 32768 * 10000 / 32768"
exit /b

:float_extract name dest_whl dest_frc
set /a "%2=%name%/32768"
set /a "%3=%name% %% 32768 * 10000 / 32768"
exit /b

:main

call :float x 200 57 59
call :float y 301 43 217

call :float_display x
call :float_display y

call :float_add x y

call :float_display x

call :float_subtract x y

call :float_display x

call :float_multiply x y

call :float_display x

