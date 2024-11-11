@echo off
setlocal enabledelayedexpansion

goto main

:fixed_positive name <[whole]> <[frac]>
if "%2" neq "" (
	set /a "%1_whole=%2"
	if "%3" neq "" (
		set /a "%1_frac=%3"
	)
) else (
	set "%1_whole=0"
	set "%1_frac=0"
)
exit /b

:fixed_positive_add first second [to]
if "%3" neq "" (
	set /a "%3_frac=%1_frac+%2_frac"
	set /a "%3_whole=%1_whole+%2_whole"
	if !%3_frac! gtr 100000000 (
		set /a "%3_whole+=1"
		set /a "%3_frac-=100000000"
	) else if !%3_frac! lss 0 (
		set /a "%3_whole-=1"
		set /a "%3_frac=100000000+%3_frac"
	)
) else (
	set /a "%1_frac+=%2_frac"
	set /a "%1_whole+=%2_whole"
	if !%1_frac! gtr 100000000 (
		set /a "%1_whole+=1"
		set /a "%1_frac-=100000000"
	) else if !%1_frac! lss 0 (
		set /a "%1_whole-=1"
		set /a "%1_frac=100000000+%1_frac"
	)
)
exit /b

:fixed_positive_value_add first <whole> <frac> [to]
if "%4" neq "" (
	set /a "%4_frac=%1_frac+%3"
	set /a "%4_whole=%1_whole+%2"
	if !%4_frac! gtr 100000000 (
		set /a "%4_whole+=1"
		set /a "%4_frac-=100000000"
	) else if !%4_frac! lss 0 (
		set /a "%4_whole-=1"
		set /a "%4_frac=100000000+%4_frac"
	)
) else (
	set /a "%1_frac+=%3"
	set /a "%1_whole+=%2"
	if !%1_frac! gtr 100000000 (
		set /a "%1_whole+=1"
		set /a "%1_frac-=100000000"
	) else if !%1_frac! lss 0 (
		set /a "%1_whole-=1"
		set /a "%1_frac=100000000+%1_frac"
	)
)
exit /b

:fixed_positive_subtract first second [to]
if "%3" neq "" (
	set /a "%3_frac=%1_frac-%2_frac"
	set /a "%3_whole=%1_whole-%2_whole"
	if !%3_frac! gtr 100000000 (
		set /a "%3_whole+=1"
		set /a "%3_frac-=100000000"
	) else if !%3_frac! lss 0 (
		set /a "%3_whole-=1"
		set /a "%3_frac=100000000+%3_frac"
	)
) else (
	set /a "%1_frac-=%2_frac"
	set /a "%1_whole-=%2_whole"
	if !%1_frac! gtr 100000000 (
		set /a "%1_whole+=1"
		set /a "%1_frac-=100000000"
	) else if !%1_frac! lss 0 (
		set /a "%1_whole-=1"
		set /a "%1_frac=100000000+%1_frac"
	)
)
exit /b

:fixed_positive_value_subtract first <whole> <frac> [to]
if "%4" neq "" (
	set /a "%4_frac=%1_frac-%3"
	set /a "%4_whole=%1_whole-%2"
	if !%4_frac! gtr 100000000 (
		set /a "%4_whole+=1"
		set /a "%4_frac-=100000000"
	) else if !%4_frac! lss 0 (
		set /a "%4_whole-=1"
		set /a "%4_frac=100000000+%4_frac"
	)
) else (
	set /a "%1_frac-=%3"
	set /a "%1_whole-=%2"
	if !%1_frac! gtr 100000000 (
		set /a "%1_whole+=1"
		set /a "%1_frac-=100000000"
	) else if !%1_frac! lss 0 (
		set /a "%1_whole-=1"
		set /a "%1_frac=100000000+%1_frac"
	)
)
exit /b

:fixed_positive_multiply first second [to]
if "%3" neq "" (
	set /a "%3_whole=%1_whole*%2_whole"
	
	set "__fixed_positive_multiply_new_frac=0"
	
	set "__fixed_positive_multiply_divisor=100000000"
	set "__fixed_positive_multiply_multiplier=1"
	
	set /a "__fixed_positive_multiply_frac=%1_frac"
	set /a "__fixed_positive_multiply_other_frac=%2_frac"
	
	:__fixed_positive_multiply_loop
	set /a "__fixed_positive_multiply_result=%1_whole*(__fixed_positive_multiply_other_frac%%10)"
	set /a "__fixed_positive_multiply_result2=%2_whole*(__fixed_positive_multiply_frac%%10)"
	
	set /a "%3_whole+=(__fixed_positive_multiply_result/__fixed_positive_multiply_divisor)+__fixed_positive_multiply_result2/__fixed_positive_multiply_divisor"
	set /a "__fixed_positive_multiply_new_frac+=((__fixed_positive_multiply_result%%__fixed_positive_multiply_divisor)+(__fixed_positive_multiply_result2%%__fixed_positive_multiply_divisor))*__fixed_positive_multiply_multiplier"
	set /a "__fixed_positive_multiply_new_frac+=(%1_frac*(__fixed_positive_multiply_other_frac%%10))/__fixed_positive_multiply_divisor"
	
	set /a "__fixed_positive_multiply_frac/=10"
	set /a "__fixed_positive_multiply_other_frac/=10"
	set /a "__fixed_positive_multiply_divisor/=10"
	set /a "__fixed_positive_multiply_multiplier*=10"
	if !__fixed_positive_multiply_divisor! neq 0 goto __fixed_positive_multiply_loop
	set /a "%3_frac=__fixed_positive_multiply_new_frac"
	if !%3_frac! gtr 100000000 (
		set /a "%3_whole+=1"
		set /a "%3_frac-=100000000"
	)
	exit /b
) else (
	set /a "%1_whole*=%2_whole"
	
	set "__fixed_positive_multiply_new_frac=0"
	
	set "__fixed_positive_multiply_divisor=100000000"
	set "__fixed_positive_multiply_multiplier=1"
	
	set /a "__fixed_positive_multiply_frac=%1_frac"
	set /a "__fixed_positive_multiply_other_frac=%2_frac"
	
	:__fixed_positive_multiply_loop_2
	set /a "__fixed_positive_multiply_result=%1_whole*(__fixed_positive_multiply_other_frac%%10)"
	set /a "__fixed_positive_multiply_result2=%2_whole*(__fixed_positive_multiply_frac%%10)"
	
	set /a "%1_whole+=(__fixed_positive_multiply_result/__fixed_positive_multiply_divisor)+__fixed_positive_multiply_result2/__fixed_positive_multiply_divisor"
	set /a "__fixed_positive_multiply_new_frac+=((__fixed_positive_multiply_result%%__fixed_positive_multiply_divisor)+(__fixed_positive_multiply_result2%%__fixed_positive_multiply_divisor))*__fixed_positive_multiply_multiplier+(%1_frac*(__fixed_positive_multiply_other_frac%%10))/__fixed_positive_multiply_divisor"
	
	set /a "__fixed_positive_multiply_frac/=10"
	set /a "__fixed_positive_multiply_other_frac/=10"
	set /a "__fixed_positive_multiply_divisor/=10"
	set /a "__fixed_positive_multiply_multiplier*=10"
	if !__fixed_positive_multiply_divisor! neq 0 goto __fixed_positive_multiply_loop_2
	set /a "%1_frac=__fixed_positive_multiply_new_frac"
	if !%1_frac! gtr 100000000 (
		set /a "%1_whole+=1"
		set /a "%1_frac-=100000000"
	)
)
exit /b

:fixed_positive_value_multiply first <whole> <frac> [to]
if "%3" neq "" (
	set /a "%4_whole=%1_whole*%2"
	
	set "__fixed_positive_value_multiply_new_frac=0"
	
	set "__fixed_positive_value_multiply_divisor=100000000"
	set "__fixed_positive_value_multiply_multiplier=1"
	
	set /a "__fixed_positive_value_multiply_frac=%1_frac"
	set /a "__fixed_positive_value_multiply_other_frac=%3"
	
	:__fixed_positive_value_multiply_loop
	set /a "__fixed_positive_value_multiply_result=%1_whole*(__fixed_positive_value_multiply_other_frac%%10)"
	set /a "__fixed_positive_value_multiply_result2=%2*(__fixed_positive_value_multiply_frac%%10)"
	set /a "%4_whole+=(__fixed_positive_value_multiply_result/__fixed_positive_value_multiply_divisor)+__fixed_positive_value_multiply_result2/__fixed_positive_value_multiply_divisor"
	set /a "__fixed_positive_value_multiply_new_frac+=((__fixed_positive_value_multiply_result%%__fixed_positive_value_multiply_divisor)+(__fixed_positive_value_multiply_result2%%__fixed_positive_value_multiply_divisor))*__fixed_positive_value_multiply_multiplier"
	set /a "__fixed_positive_value_multiply_new_frac+=(%1_frac*(__fixed_positive_value_multiply_other_frac%%10))/__fixed_positive_value_multiply_divisor"
	set /a "__fixed_positive_value_multiply_frac/=10"
	set /a "__fixed_positive_value_multiply_other_frac/=10"
	set /a "__fixed_positive_value_multiply_divisor/=10"
	set /a "__fixed_positive_value_multiply_multiplier*=10"
	if !__fixed_positive_value_multiply_divisor! neq 0 goto __fixed_positive_value_multiply_loop
	set /a "%4_frac=__fixed_positive_value_multiply_new_frac"
	if !%4_frac! gtr 100000000 (
		set /a "%4_whole+=1"
		set /a "%4_frac-=100000000"
	)
	exit /b
) else (
	set /a "%1_whole*=%2"
	
	set "__fixed_positive_value_multiply_new_frac=0"
	
	set "__fixed_positive_value_multiply_divisor=100000000"
	set "__fixed_positive_value_multiply_multiplier=1"
	
	set /a "__fixed_positive_value_multiply_frac=%1_frac"
	set /a "__fixed_positive_value_multiply_other_frac=%3"
	
	:__fixed_positive_value_multiply_loop_2
	set /a "__fixed_positive_value_multiply_result=%1_whole*(__fixed_positive_value_multiply_other_frac%%10)"
	set /a "__fixed_positive_value_multiply_result2=%2*(__fixed_positive_value_multiply_frac%%10)"
	
	set /a "%1_whole+=(__fixed_positive_value_multiply_result/__fixed_positive_value_multiply_divisor)+__fixed_positive_value_multiply_result2/__fixed_positive_value_multiply_divisor"
	set /a "__fixed_positive_value_multiply_new_frac+=((__fixed_positive_value_multiply_result%%__fixed_positive_value_multiply_divisor)+(__fixed_positive_value_multiply_result2%%__fixed_positive_value_multiply_divisor))*__fixed_positive_value_multiply_multiplier+(%1_frac*(__fixed_positive_value_multiply_other_frac%%10))/__fixed_positive_value_multiply_divisor"
	
	set /a "__fixed_positive_value_multiply_frac/=10"
	set /a "__fixed_positive_value_multiply_other_frac/=10"
	set /a "__fixed_positive_value_multiply_divisor/=10"
	set /a "__fixed_positive_value_multiply_multiplier*=10"
	if !__fixed_positive_value_multiply_divisor! neq 0 goto __fixed_positive_value_multiply_loop_2
	set /a "%1_frac=__fixed_positive_value_multiply_new_frac"
	if !%1_frac! gtr 100000000 (
		set /a "%1_whole+=1"
		set /a "%1_frac-=100000000"
	)
)
exit /b


:fixed_positive_display name
set /a "whl=%1_whole"
set /a "frc=%1_frac"
set "frc=00000000%frc%"
set "frc=%frc:~-8%"
echo %whl%.%frc%
exit /b

:fixed_positive_display_nnl name
set /a "whl=%1_whole"
set /a "frc=%1_frac"
set "frc=00000000%frc%"
set "frc=%frc:~-8%"
set /p "=%whl%.%frc%" < nul
exit /b

:fixed_positive_extract_whole name dest
set /a "%2=%1_whole"
exit /b

:fixed_positive_extract_fraction name dest
set /a "%2=%1_frac"
exit /b

:fixed_positive_extract name dest_whl dest_frc
set /a "%2=%1_whole"
set /a "%3=%1_frac"
exit /b

:fixed_positive_compare first second
if !%1_whole! gtr !%2_whole! (
	exit /b 1
) else if !%1_frac! gtr !%2_frac! (
	exit /b 1
) else if !%1_whole! lss !%2_whole! (
	exit /b -1
) else if !%1_frac! lss !%2_frac! (
	exit /b -1
) else (
	exit /b 0
)

:fixed_positive_compare_greater first second
if !%1_whole! gtr !%2_whole! (
	exit /b 1
) else if !%1_frac! gtr !%2_frac! (
	exit /b 1
) else (
	exit /b 0
)

:fixed_positive_compare_less first second
if !%1_whole! lss !%2_whole! (
	exit /b 1
) else if !%1_frac! lss !%2_frac! (
	exit /b 1
) else (
	exit /b 0
)

:fixed_positive_compare_equal first second
if !%1_whole! equ !%2_whole! ( 
	  if !%1_frac! equ !%2_frac! (
	   exit /b 1
	) else (
		exit /b 0
	)
) else (
	exit /b 0
)

:fixed_positive_compare_greater_or_equal first second
if !%1_whole! geq !%2_whole! (
	exit /b 1
) else if !%1_frac! geq !%2_frac! (
	exit /b 1
) else (
	exit /b 0
)

:fixed_positive_compare_less_or_equal first second
if !%1_whole! leq !%2_whole! (
	exit /b 1
) else if !%1_frac! leq !%2_frac! (
	exit /b 1
) else (
	exit /b 0
)

:fixed_positive_compare_not_equal first second
if !%1_whole! neq !%2_whole! (
	exit /b 1
) else if !%1_frac! neq !%2_frac! (
	exit /b 1
) else (
	exit /b 0
)

:main

call :fixed_positive x 5 21220000
call :fixed_positive y 5 21220000

echo XY
call :fixed_positive_display x
call :fixed_positive_display y

call :fixed_positive_add x y z

call :fixed_positive_display z

call :fixed_positive_value_add x 1 50000000 z

call :fixed_positive_display z

call :fixed_positive_subtract x y z

call :fixed_positive_display z

call :fixed_positive_value_subtract x 1 50000000 z

call :fixed_positive_display z

call :fixed_positive_multiply x y z

call :fixed_positive_display z

call :fixed_positive_value_multiply x 1 50000000 z

call :fixed_positive_display z

call :fixed_positive_compare x y
if errorlevel 1 (
	echo X is greater than Y
) else if errorlevel -1 (
	echo X is less than Y
) else (
	echo X is equal to Y
)

call :fixed_positive_compare_greater x y
if errorlevel 1 (
	echo X is greater than Y
) else (
	echo X is not greater than Y
)

call :fixed_positive_compare_less x y
if errorlevel 1 (
	echo X is less than Y
) else (
	echo X is not less than Y
)

call :fixed_positive_compare_equal x y
if errorlevel 1 (
	echo X is equal to Y
) else (
	echo X is not equal to Y
)

call :fixed_positive_compare_greater_or_equal x y
if errorlevel 1 (
	echo X is greater than or equal to Y
) else (
	echo X is not greater than or equal to Y
)

call :fixed_positive_compare_less_or_equal x y
if errorlevel 1 (
	echo X is less than or equal to Y
) else (
	echo X is not less than or equal to Y
)

call :fixed_positive_compare_not_equal x y
if errorlevel 1 (
	echo X is not equal to Y
) else (
	echo X is equal to Y
)
