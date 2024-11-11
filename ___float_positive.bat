@echo off
setlocal enabledelayedexpansion

goto main

:float_positive name <[whole]> <[frac]>
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

:float_positive_add first second [to]
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

:float_positive_value_add first <whole> <frac> [to]
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

:float_positive_subtract first second [to]
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

:float_positive_value_subtract first <whole> <frac> [to]
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

:float_positive_multiply first second [to]
if "%3" neq "" (
	set /a "%3_whole=%1_whole*%2_whole"
	
	set "__float_positive_multiply_new_frac=0"
	
	set "__float_positive_multiply_divisor=100000000"
	set "__float_positive_multiply_multiplier=1"
	
	set /a "__float_positive_multiply_frac=%1_frac"
	set /a "__float_positive_multiply_other_frac=%2_frac"
	
	:__float_positive_multiply_loop
	set /a "__float_positive_multiply_result=%1_whole*(__float_positive_multiply_other_frac%%10)"
	set /a "__float_positive_multiply_result2=%2_whole*(__float_positive_multiply_frac%%10)"
	
	set /a "%3_whole+=(__float_positive_multiply_result/__float_positive_multiply_divisor)+__float_positive_multiply_result2/__float_positive_multiply_divisor"
	set /a "__float_positive_multiply_new_frac+=((__float_positive_multiply_result%%__float_positive_multiply_divisor)+(__float_positive_multiply_result2%%__float_positive_multiply_divisor))*__float_positive_multiply_multiplier"
	set /a "__float_positive_multiply_new_frac+=(%1_frac*(__float_positive_multiply_other_frac%%10))/__float_positive_multiply_divisor"
	
	set /a "__float_positive_multiply_frac/=10"
	set /a "__float_positive_multiply_other_frac/=10"
	set /a "__float_positive_multiply_divisor/=10"
	set /a "__float_positive_multiply_multiplier*=10"
	if !__float_positive_multiply_divisor! neq 0 goto __float_positive_multiply_loop
	set /a "%3_frac=__float_positive_multiply_new_frac"
	if !%3_frac! gtr 100000000 (
		set /a "%3_whole+=1"
		set /a "%3_frac-=100000000"
	)
	exit /b
) else (
	set /a "%1_whole*=%2_whole"
	
	set "__float_positive_multiply_new_frac=0"
	
	set "__float_positive_multiply_divisor=100000000"
	set "__float_positive_multiply_multiplier=1"
	
	set /a "__float_positive_multiply_frac=%1_frac"
	set /a "__float_positive_multiply_other_frac=%2_frac"
	
	:__float_positive_multiply_loop_2
	set /a "__float_positive_multiply_result=%1_whole*(__float_positive_multiply_other_frac%%10)"
	set /a "__float_positive_multiply_result2=%2_whole*(__float_positive_multiply_frac%%10)"
	
	set /a "%1_whole+=(__float_positive_multiply_result/__float_positive_multiply_divisor)+__float_positive_multiply_result2/__float_positive_multiply_divisor"
	set /a "__float_positive_multiply_new_frac+=((__float_positive_multiply_result%%__float_positive_multiply_divisor)+(__float_positive_multiply_result2%%__float_positive_multiply_divisor))*__float_positive_multiply_multiplier+(%1_frac*(__float_positive_multiply_other_frac%%10))/__float_positive_multiply_divisor"
	
	set /a "__float_positive_multiply_frac/=10"
	set /a "__float_positive_multiply_other_frac/=10"
	set /a "__float_positive_multiply_divisor/=10"
	set /a "__float_positive_multiply_multiplier*=10"
	if !__float_positive_multiply_divisor! neq 0 goto __float_positive_multiply_loop_2
	set /a "%1_frac=__float_positive_multiply_new_frac"
	if !%1_frac! gtr 100000000 (
		set /a "%1_whole+=1"
		set /a "%1_frac-=100000000"
	)
)
exit /b

:float_positive_value_multiply first <whole> <frac> [to]
if "%3" neq "" (
	set /a "%4_whole=%1_whole*%2"
	
	set "__float_positive_value_multiply_new_frac=0"
	
	set "__float_positive_value_multiply_divisor=100000000"
	set "__float_positive_value_multiply_multiplier=1"
	
	set /a "__float_positive_value_multiply_frac=%1_frac"
	set /a "__float_positive_value_multiply_other_frac=%3"
	
	:__float_positive_value_multiply_loop
	set /a "__float_positive_value_multiply_result=%1_whole*(__float_positive_value_multiply_other_frac%%10)"
	set /a "__float_positive_value_multiply_result2=%2*(__float_positive_value_multiply_frac%%10)"
	set /a "%4_whole+=(__float_positive_value_multiply_result/__float_positive_value_multiply_divisor)+__float_positive_value_multiply_result2/__float_positive_value_multiply_divisor"
	set /a "__float_positive_value_multiply_new_frac+=((__float_positive_value_multiply_result%%__float_positive_value_multiply_divisor)+(__float_positive_value_multiply_result2%%__float_positive_value_multiply_divisor))*__float_positive_value_multiply_multiplier"
	set /a "__float_positive_value_multiply_new_frac+=(%1_frac*(__float_positive_value_multiply_other_frac%%10))/__float_positive_value_multiply_divisor"
	set /a "__float_positive_value_multiply_frac/=10"
	set /a "__float_positive_value_multiply_other_frac/=10"
	set /a "__float_positive_value_multiply_divisor/=10"
	set /a "__float_positive_value_multiply_multiplier*=10"
	if !__float_positive_value_multiply_divisor! neq 0 goto __float_positive_value_multiply_loop
	set /a "%4_frac=__float_positive_value_multiply_new_frac"
	if !%4_frac! gtr 100000000 (
		set /a "%4_whole+=1"
		set /a "%4_frac-=100000000"
	)
	exit /b
) else (
	set /a "%1_whole*=%2"
	
	set "__float_positive_value_multiply_new_frac=0"
	
	set "__float_positive_value_multiply_divisor=100000000"
	set "__float_positive_value_multiply_multiplier=1"
	
	set /a "__float_positive_value_multiply_frac=%1_frac"
	set /a "__float_positive_value_multiply_other_frac=%3"
	
	:__float_positive_value_multiply_loop_2
	set /a "__float_positive_value_multiply_result=%1_whole*(__float_positive_value_multiply_other_frac%%10)"
	set /a "__float_positive_value_multiply_result2=%2*(__float_positive_value_multiply_frac%%10)"
	
	set /a "%1_whole+=(__float_positive_value_multiply_result/__float_positive_value_multiply_divisor)+__float_positive_value_multiply_result2/__float_positive_value_multiply_divisor"
	set /a "__float_positive_value_multiply_new_frac+=((__float_positive_value_multiply_result%%__float_positive_value_multiply_divisor)+(__float_positive_value_multiply_result2%%__float_positive_value_multiply_divisor))*__float_positive_value_multiply_multiplier+(%1_frac*(__float_positive_value_multiply_other_frac%%10))/__float_positive_value_multiply_divisor"
	
	set /a "__float_positive_value_multiply_frac/=10"
	set /a "__float_positive_value_multiply_other_frac/=10"
	set /a "__float_positive_value_multiply_divisor/=10"
	set /a "__float_positive_value_multiply_multiplier*=10"
	if !__float_positive_value_multiply_divisor! neq 0 goto __float_positive_value_multiply_loop_2
	set /a "%1_frac=__float_positive_value_multiply_new_frac"
	if !%1_frac! gtr 100000000 (
		set /a "%1_whole+=1"
		set /a "%1_frac-=100000000"
	)
)
exit /b


:float_positive_display name
set /a "whl=%1_whole"
set /a "frc=%1_frac"
set "frc=00000000%frc%"
set "frc=%frc:~-8%"
echo %whl%.%frc%
exit /b

:float_positive_display_nnl name
set /a "whl=%1_whole"
set /a "frc=%1_frac"
set "frc=00000000%frc%"
set "frc=%frc:~-8%"
set /p "=%whl%.%frc%" < nul
exit /b

:float_positive_extract_whole name dest
set /a "%2=%1_whole"
exit /b

:float_positive_extract_fraction name dest
set /a "%2=%1_frac"
exit /b

:float_positive_extract name dest_whl dest_frc
set /a "%2=%1_whole"
set /a "%3=%1_frac"
exit /b

:main

call :float_positive x 5 21220000
call :float_positive y 2 12345500

echo XY
call :float_positive_display x
call :float_positive_display y

call :float_positive_add x y z

call :float_positive_display z

call :float_positive_value_add x 1 50000000 z

call :float_positive_display z

call :float_positive_subtract x y z

call :float_positive_display z

call :float_positive_value_subtract x 1 50000000 z

call :float_positive_display z

call :float_positive_multiply x y z

call :float_positive_display z

call :float_positive_value_multiply x 1 50000000 z

call :float_positive_display z


