@echo off
setlocal enabledelayedexpansion

goto main

:gcd v1 v2 to
set /a "__gcd_a=%1"
set /a "__gcd_b=%2"
:__gcd_loop
set "__gcd_tmp=%__gcd_a%"
set "__gcd_a=%__gcd_b%"
set /a "__gcd_b=__gcd_tmp %% __gcd_b"
if %__gcd_b% neq 0 goto __gcd_loop
set "%3=%__gcd_a%"
exit /b

:lcm <v1> <v2> to
set /a "__gcd_a=%1"
set /a "__gcd_b=%2"
echo LCM %__gcd_a% %__gcd_b%
:__lcm_loop
set "__gcd_tmp=%__gcd_a%"
set "__gcd_a=%__gcd_b%"
set /a "__gcd_b=__gcd_tmp %% __gcd_b"
if %__gcd_b% neq 0 goto __lcm_loop
set /a "%3=%1 * %2 / __gcd_a"
exit /b

:float name <[whole]> <[numerator]> <[denominator]>
if "%2" neq "" (
	set /a "%1_numerator=%2 * %4 + %3"
	set /a "%1_denominator=%4"
) else (
	set /a "%1_denominator=1"
)
exit /b

:float_shorten name [to]
call :gcd %1_numerator %1_denominator __float_shorten_gcd
if "%2" neq "" (
	set /a "%3_numerator=%1_numerator / __float_shorten_gcd"
	set /a "%3_denominator=%1_denominator / __float_shorten_gcd"
) else (
	set /a "%1_numerator/=__float_shorten_gcd"
	set /a "%1_denominator/=__float_shorten_gcd"	
)
exit /b

:float_add first second [to]
call :lcm %1_denominator %2_denominator __float_add_lcm
if "%3" neq "" (
	set /a "%3_numerator=%1_numerator * (__float_add_lcm / %1_denominator) + %2_numerator * (__float_add_lcm / %2_denominator)"
	set "%3_denominator=%__float_add_lcm%"
) else (
	set /a "%1_numerator=%1_numerator * (__float_add_lcm / %1_denominator) + %2_numerator * (__float_add_lcm / %2_denominator)"
	set "%1_denominator=%__float_add_lcm%"
)
exit /b

:float_subtract first second [to]
call :lcm %1_denominator %2_denominator __float_subtract_lcm
if "%3" neq "" (
	set /a "%3_numerator=%1_numerator * (__float_subtract_lcm / %1_denominator) - %2_numerator * (__float_subtract_lcm / %2_denominator)"
	set "%3_denominator=%__float_subtract_lcm%"
) else (
	set /a "%1_numerator=%1_numerator * (__float_subtract_lcm / %1_denominator) - %2_numerator * (__float_subtract_lcm / %2_denominator)"
	set "%1_denominator=%__float_subtract_lcm%"
)
exit /b

:float_multiply first second [to]
if "%3" neq "" (
	set /a "%3_numerator=%1_numerator * %2_numerator"
	set /a "%3_denominator=%1_denominator * %2_denominator"
	call :gcd %3_numerator %3_denominator __float_multiply_gcd
	set /a "%3_numerator/=__float_multiply_gcd"
	set /a "%3_denominator/=__float_multiply_gcd"
) else (
	set /a "%1_numerator=%1_numerator * %2_numerator"
	set /a "%1_denominator=%1_denominator * %2_denominator"
	call :gcd %1_numerator %1_denominator __float_multiply_gcd
	set /a "%1_numerator/=__float_multiply_gcd"
	set /a "%1_denominator/=__float_multiply_gcd"
)
exit /b

:float_divide first second [to]
if "%3" neq "" (
	set /a "%3_numerator=%1_numerator * %2_denominator
	set /a "%3_denominator=%1_denominator * %2_numerator"
	call :gcd %3_numerator %3_denominator __float_divide_gcd
	set /a "%3_numerator/=__float_multiply_gcd"
	set /a "%3_denominator/=__float_multiply_gcd"
) else (
	set /a "%1_numerator=%1_numerator * %2_denominator
	set /a "%1_denominator=%1_denominator * %2_numerator"
	call :gcd %1_numerator %1_denominator __float_multiply_gcd
	set /a "%1_numerator/=__float_multiply_gcd"
	set /a "%1_denominator/=__float_multiply_gcd"
)
exit /b

:float_display name
echo !%1_numerator!/!%1_denominator!
exit /b

:float_display_nnl name
set /p "=!%1_numerator!/!%1_denominator!" < nul
exit /b

:float_display_decimal name <precision>
set "precision=%2"
if !%1_numerator! lss 0 (
	set /a "remainder=-%1_numerator %% %1_denominator"
) else (
	set /a "remainder=%1_numerator %% %1_denominator"
) 
set /a "whole=%1_numerator / %1_denominator"
set /p "=%whole%." < nul
set /a "__float_display_decimal_i=0"
:__float_display_decimal_loop
set /a "remainder*=10"
set /a "digit=remainder / %1_denominator"
set /p "_=%digit%" < nul
set /a "remainder%%= %1_denominator"
if !__float_display_decimal_i! lss %precision% (
	if !remainder! neq 0 (
		set /a "__float_display_decimal_i+=1"
		goto __float_display_decimal_loop
	)
)
echo.
exit /b


:float_display_decimal_nnl name <precision>
set "precision=%2"
if !%1_numerator! lss 0 (
	set /a "remainder=-%1_numerator %% %1_denominator"
) else (
	set /a "remainder=%1_numerator %% %1_denominator"
) 
set /a "whole=%1_numerator / %1_denominator"
set /p "=%whole%." < nul
set /a "__float_display_decimal_nnl_i=0"
:__float_display_decimal_nnl_loop
set /a "remainder*=10"
set /a "digit=remainder / %1_denominator"
set /p "_=%digit%" < nul
set /a "remainder%%= %1_denominator"
if !__float_display_decimal_i! lss %precision% (
	if !remainder! neq 0 (
		set /a "__float_display_decimal_nnl_i+=1"
		goto __float_display_decimal_nnl_loop_loop
	)
)
exit /b

:main

call :float z 2 2 10
call :float_display z
call :float_shorten z
call :float_display z

call :float x 1 1 2
call :float y 3 4 5


call :float_display x
call :float_display_decimal x 10

call :float_display y
call :float_display_decimal y 10

call :float_add x y 
call :float_display x
call :float_display_decimal x 10

call :float_subtract x y 
call :float_display x
call :float_display_decimal x 10


call :float_multiply x y
call :float_display x
call :float_display_decimal x 10


::call :float_divide x y 
::call :float_display x
::call :float_display_decimal x 10

