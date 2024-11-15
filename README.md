
# Floating/Fixed point in Batch  

Floating/Fixed point numbers implemented purely in batch.


## Features

- Addition, subtraction, multiplication for _float, __float, ___float_positive
- Division for _float, __float



## Documentation
<details>
<summary><h3>_float</h3></summary>
<details>
<summary><h4>float</h4></summary>
The `float` function initializes a floating-point variable with a specified name and value, combining both an integer and fractional part.

Syntax:
```cmd
call :float name <whole_part> <[numerator]> <[denominator]>
```
Parameters:

- `name`        (string):  The name of the floating-point variable.
- `whole_part`  (integer): The whole number part of the value.
- `numerator`   (integer, optional): The numerator of the fractional part.
- `denominator` (integer, optional): The denominator of the fractional part.

Result: <br>
`name` floating-point variable will contain the value.

Description: <br>
This function creates a floating-point variable by combining the whole part and fractional part, calculated as:
$` \text{data}=\text{whole\_part}*32768+\frac{\text{numerator}*32768}{\text{denominator}} `$

</details>
<details>
<summary><h4>float_add</h4></summary>
The `float_add` function adds one floating-point variable to another.

Syntax:
```cmd
call :float_add first second [to]
```

Parameters:
- `first`       (string):  The name of the first floating-point variable to add (addend). If no result variable is provided, this will be updated with the result.
- `second`      (string):  The name of the second floating-point variable to add (addend).
- `to`          (string, optional):  The name of the resulting floating-point variable that will hold the sum. If not provided, `first` will be updated with the result.

Result: <br>
`to` will contain the result if provided, `first` otherwise.

Description: <br>
This function adds the value of the second floating-point variable to the first and stores the result in the variable specified by to. If no result variable (to) is provided, first will be updated with the result.
</details>
<details>
<summary><h4>float_subtract</h4></summary>
The float_subtract function subtracts one floating-point variable from another.

Syntax:

```cmd
call :float_subtract first second [to]
```

Parameters:
- `first` (string): The name of the first floating-point variable (minuend). If no result variable is provided, this will be updated with the result.
- `second` (string): The name of the second floating-point variable (subtrahend).
- `to` (optional, string): The name of the resulting floating-point variable that will hold the difference. If not provided, `first` will be updated with the result.

Result: <br>
`to` will contain the result if provided, `first` otherwise.

Description: <br>
This function subtracts the value of the second floating-point variable from the first and stores the result in the variable specified by to. If no result variable (to) is provided, first will be updated with the result.
</details>
<details>
<summary><h4>float_multiply</h4></summary>
The float_multiply function multiplies one floating-point variable by another.

Syntax:
```cmd
call :float_multiply first second [to]
```
Parameters:
- `first` (string): The name of the first floating-point variable (multiplicand). If no result variable is provided, this will be updated with the result.
- `second` (string): The name of the second floating-point variable (multiplier).
- `to` (optional, string): The name of the resulting floating-point variable that will hold the product. If not provided, `first` will be updated with the result.

Result: <br>
`to` will contain the result if provided, `first` otherwise.

Description: This function multiplies the values of the first and second floating-point variables and stores the result in the variable specified by to. If no result variable (to) is provided, first will be updated with the result.
</details>
<details>
<summary><h4>float_divide</h4></summary>
The float_divide function divides one floating-point variable by another.

Syntax:
```cmd
call :float_divide first second [to]
```

Parameters:
- `first` (string): The name of the first floating-point variable (dividend). If no result variable is provided, this will be updated with the result.
- `second` (string): The name of the second floating-point variable (divisor).
- `to` (optional, string): The name of the resulting floating-point variable that will hold the quotient. If not provided, `first` will be updated with the result.

Result: <br>
`to` will contain the result if provided, `first` otherwise.

Description: <br>
This function divides the value of the first floating-point variable by the value of the second floating-point variable and stores the result in the variable specified by to. If no result variable (to) is provided, first will be updated with the result.
</details>
<details>
<summary><h4>float_display</h4></summary>
The float_display function displays floating-point variable.

Syntax:
```cmd
call :float_display name
```

Parameters:
- `name` (string): The name of the floating-point variable to display.

Result: <br>
None.

Description: <br>
This function displays the value of the floating-point variable.
</details>
<details>
<summary><h4>float_display_nnl</h4></summary>
The float_display_nnl function displays floating-point variable without appending newline.

Syntax:
```cmd
call :float_display_nnl name
```

Parameters:
- `name` (string): The name of the floating-point variable to display.

Description: <br>
This function displays the value of the floating-point variable without appending newline.
</details>
<details>
<summary><h4>float_extract</h4></summary>
The float_extract function extracts floating-point variable to the provided variables.

Syntax:
```cmd
call :float_extract name dest_whole dest_frac
```

Parameters:
- `name` (string): The name of the floating-point variable to display extract.
- `dest_whole` (string): The name of variable to extract the whole part to.
- `dest_frac` (string): The name of variable to extract the fractional part to.

Result: <br>
`dest_frac` and `dest_whole` will contain the result.

Description: <br>
This function extracts the value of the floating-point variable to the provided ones.
</details>
<details>
<summary><h4>float_extract_whole</h4></summary>
The float_extract_whole function extracts whole part of floating-point variable to provided variable.

Syntax:
```cmd
call :float_extract_whole name dest
```

Parameters:
- `name` (string): The name of the floating-point variable to display extract.
- `dest` (string): The name of variable to extract the whole part to.

Result: <br>
`dest` will contain the result.

Description: <br>
This function extracts the value of the whole part of the floating-point variable to provided one.
</details>
<details>
<summary><h4>float_extract_fraction</h4></summary>
The float_extract_fraction function extracts fractional part of floating-point variable to provided variable.

Syntax:
```cmd
call :float_extract_fraction name dest
```

Parameters:
- `name` (string): The name of the floating-point variable to display extract.
- `dest` (string): The name of variable to extract the fractional part to.

Description: <br>
This function extracts the value of the fractional part of the floating-point variable to provided one.
</details>
<details>
<summary><h4>float_compare</h4></summary>
The float_compare function compares one floating-point variable to another.

Syntax:
```cmd
call :float_compare first second
```

Parameters:
- `first` (string): The name of the first floating-point variable
- `second` (string): The name of the second floating-point variable.

Result: <br>
`errorlevel` will contain the result of the comparison: 1 if greater, 0 if equal, -1 if less.

Description: <br>
This function compares the value of the first floating-point variable to the value of the second floating-point variable and stores the result in `errorlevel`: 1 if greater, 0 if equal, -1 if less.
</details>
<details>
<summary><h4>float_compare_greater</h4></summary>
The float_compare function compares one floating-point variable to another.

Syntax:
```cmd
call :float_compare_greater first second
```

Parameters:
- `first` (string): The name of the first floating-point variable
- `second` (string): The name of the second floating-point variable.

Result: <br>
`errorlevel` will contain the result of the comparison: 1 if greater, 0 otherwise.

Description: <br>
This function compares the value of the first floating-point variable to the value of the second floating-point variable and stores the result in `errorlevel`: 1 if greater, 0 otherwise.
</details>
<details>
<summary><h4>float_compare_less</h4></summary>
The float_compare function compares one floating-point variable to another.

Syntax:
```cmd
call :float_compare_less first second
```

Parameters:
- `first` (string): The name of the first floating-point variable
- `second` (string): The name of the second floating-point variable.

Result: <br>
`errorlevel` will contain the result of the comparison: 1 if less, 0 otherwise.

Description: <br>
This function compares the value of the first floating-point variable to the value of the second floating-point variable and stores the result in `errorlevel`: 1 if less, 0 otherwise.
</details>
<details>
<summary><h4>float_compare_equal</h4></summary>
The float_compare function compares one floating-point variable to another.

Syntax:
```cmd
call :float_compare_equal first second
```

Parameters:
- `first` (string): The name of the first floating-point variable
- `second` (string): The name of the second floating-point variable.

Result: <br>
`errorlevel` will contain the result of the comparison: 1 if equal, 0 otherwise.

Description: <br>
This function compares the value of the first floating-point variable to the value of the second floating-point variable and stores the result in `errorlevel`: 1 if equal, 0 otherwise.
</details>
<details>
<summary><h4>float_compare_greater_or_equal</h4></summary>
The float_compare function compares one floating-point variable to another.

Syntax:
```cmd
call :float_compare_greater_or_equal first second
```

Parameters:
- `first` (string): The name of the first floating-point variable
- `second` (string): The name of the second floating-point variable.

Result: <br>
`errorlevel` will contain the result of the comparison: 1 if greater or equal, 0 otherwise.

Description: <br>
This function compares the value of the first floating-point variable to the value of the second floating-point variable and stores the result in errorlevel: 1 if greater or equal, 0 otherwise.
</details>
<details>
<summary><h4>float_compare_less_or_equal</h4></summary>
The float_compare function compares one floating-point variable to another.

Syntax:
```cmd
call :float_compare_less_or_equal first second
```

Parameters:
- `first` (string): The name of the first floating-point variable
- `second` (string): The name of the second floating-point variable.

Result: <br>
`errorlevel` will contain the result of the comparison: 1 if less or equal, 0 otherwise.

Description: <br>
This function compares the value of the first floating-point variable to the value of the second floating-point variable and stores the result in errorlevel: 1 if greater or equal, 0 otherwise.
</details>
<details>
<summary><h4>float_compare_not_equal</h4></summary>
The float_compare function compares one floating-point variable to another.

Syntax:
```cmd
call :float_compare_not_equal first second
```

Parameters:
- `first` (string): The name of the first floating-point variable
- `second` (string): The name of the second floating-point variable.

Result: <br>
`errorlevel` will contain the result of the comparison: 1 if not equal, 0 otherwise.

Description: <br>
This function compares the value of the first floating-point variable to the value of the second floating-point variable and stores the result in errorlevel: 1 if not equal, 0 otherwise.
</details>
</details>
<details>
<summary><h3>__float</h3></summary>
<details>
<summary><h4>float</h4></summary>
The `float` function initializes a floating-point variable with a specified name and value, combining both an integer and fractional part.

Syntax:
```cmd
call :float name <whole_part> <[numerator]> <[denominator]>
```
Parameters:

- `name`        (string):  The name of the floating-point variable.
- `whole_part`  (integer): The whole number part of the value.
- `numerator`   (integer, optional): The numerator of the fractional part.
- `denominator` (integer, optional): The denominator of the fractional part.

Result: <br>
`name` floating-point variable will contain the value.

Description: <br>
This function creates a floating-point variable by numerator and denominator, calculated as:
$` \text{data\_numerator}=\text{whole\_part}*\text{denominator}+\text{numerator} `$ <br>
$` \text{data\_denominator}=\text{denominator} `$
</details>
<details>
<summary><h4>float_shorten</h4></summary>
The `float_shorten` function shortens one floating-point variable.

Syntax:
```cmd
call :float_shorten first [to]
```

Parameters:
- `first`       (string):  The name of the floating-point variable to shorten (addend). If no result variable is provided, this will be updated with the result.
- `to`          (string, optional):  The name of the resulting floating-point variable that will hold the result. If not provided, `first` will be updated with the result.

Result: <br>
`to` will contain the result if provided, `first` otherwise.

Description: <br>
This function shortens the value of the floating-point variable and stores the result in the variable specified by to. If no result variable (to) is provided, first will be updated with the result.
</details>
<details>
<summary><h4>float_add</h4></summary>
The `float_add` function adds one floating-point variable to another.

Syntax:
```cmd
call :float_add first second [to]
```

Parameters:
- `first`       (string):  The name of the first floating-point variable to add (addend). If no result variable is provided, this will be updated with the result.
- `second`      (string):  The name of the second floating-point variable to add (addend).
- `to`          (string, optional):  The name of the resulting floating-point variable that will hold the sum. If not provided, `first` will be updated with the result.

Result: <br>
`to` will contain the result if provided, `first` otherwise.

Description: <br>
This function adds the value of the second floating-point variable to the first and stores the result in the variable specified by to. If no result variable (to) is provided, first will be updated with the result.
</details>
<details>
<summary><h4>float_subtract</h4></summary>
The float_subtract function subtracts one floating-point variable from another.

Syntax:

```cmd
call :float_subtract first second [to]
```

Parameters:
- `first` (string): The name of the first floating-point variable (minuend). If no result variable is provided, this will be updated with the result.
- `second` (string): The name of the second floating-point variable (subtrahend).
- `to` (optional, string): The name of the resulting floating-point variable that will hold the difference. If not provided, `first` will be updated with the result.

Result: <br>
`to` will contain the result if provided, `first` otherwise.

Description: <br>
This function subtracts the value of the second floating-point variable from the first and stores the result in the variable specified by to. If no result variable (to) is provided, first will be updated with the result.
</details>
<details>
<summary><h4>float_multiply</h4></summary>
The float_multiply function multiplies one floating-point variable by another.

Syntax:
```cmd
call :float_multiply first second [to]
```
Parameters:
- `first` (string): The name of the first floating-point variable (multiplicand). If no result variable is provided, this will be updated with the result.
- `second` (string): The name of the second floating-point variable (multiplier).
- `to` (optional, string): The name of the resulting floating-point variable that will hold the product. If not provided, `first` will be updated with the result.

Result: <br>
`to` will contain the result if provided, `first` otherwise.

Description: This function multiplies the values of the first and second floating-point variables and stores the result in the variable specified by to. If no result variable (to) is provided, first will be updated with the result.
</details>
<details>
<summary><h4>float_divide</h4></summary>
The float_divide function divides one floating-point variable by another.

Syntax:
```cmd
call :float_divide first second [to]
```

Parameters:
- `first` (string): The name of the first floating-point variable (dividend). If no result variable is provided, this will be updated with the result.
- `second` (string): The name of the second floating-point variable (divisor).
- `to` (optional, string): The name of the resulting floating-point variable that will hold the quotient. If not provided, `first` will be updated with the result.

Result: <br>
`to` will contain the result if provided, `first` otherwise.

Description: <br>
This function divides the value of the first floating-point variable by the value of the second floating-point variable and stores the result in the variable specified by to. If no result variable (to) is provided, first will be updated with the result.
</details>
<details>
<summary><h4>float_display</h4></summary>
The float_display function displays floating-point variable.

Syntax:
```cmd
call :float_display name
```

Parameters:
- `name` (string): The name of the floating-point variable to display.

Result: <br>
None.

Description: <br>
This function displays the value of the floating-point variable.
</details>
<details>
<summary><h4>float_display_decimal</h4></summary>
The float_display_decimal function displays floating-point variable in decimal form.

Syntax:
```cmd
call :float_display_decimal name
```

Parameters:
- `name` (string): The name of the floating-point variable to display.

Result: <br>
None.

Description: <br>
This function displays the value of the floating-point variable in decimal form.
</details>
<details>
<summary><h4>float_display_nnl</h4></summary>
The float_display_nnl function displays floating-point variable without appending newline.

Syntax:
```cmd
call :float_display_nnl name
```

Parameters:
- `name` (string): The name of the floating-point variable to display.

Description: <br>
This function displays the value of the floating-point variable without appending newline.
</details>
<details>
<summary><h4>float_display_decimal_nnl</h4></summary>
The float_display_decimal_nnl function displays floating-point variable without appending newline in decimal form.

Syntax:
```cmd
call :float_display_nnl name
```

Parameters:
- `name` (string): The name of the floating-point variable to display.

Description: <br>
This function displays the value of the floating-point variable without appending newline in decimal form.
</details>
<details>
<summary><h4>float_extract</h4></summary>
The float_extract function extracts floating-point variable to the provided variables.

Syntax:
```cmd
call :float_extract name dest_whole dest_frac
```

Parameters:
- `name` (string): The name of the floating-point variable to display extract.
- `dest_whole` (string): The name of variable to extract the whole part to.
- `dest_frac` (string): The name of variable to extract the fractional part to.

Result: <br>
`dest_frac` and `dest_whole` will contain the result.

Description: <br>
This function extracts the value of the floating-point variable to the provided ones.
</details>
<details>
<summary><h4>float_extract_whole</h4></summary>
The float_extract_whole function extracts whole part of floating-point variable to provided variable.

Syntax:
```cmd
call :float_extract_whole name dest
```

Parameters:
- `name` (string): The name of the floating-point variable to display extract.
- `dest` (string): The name of variable to extract the whole part to.

Result: <br>
`dest` will contain the result.

Description: <br>
This function extracts the value of the whole part of the floating-point variable to provided one.
</details>
<details>
<summary><h4>float_extract_fraction</h4></summary>
The float_extract_fraction function extracts fractional part of floating-point variable to provided variable.

Syntax:
```cmd
call :float_extract_fraction name dest
```

Parameters:
- `name` (string): The name of the floating-point variable to display extract.
- `dest` (string): The name of variable to extract the fractional part to.

Description: <br>
This function extracts the value of the fractional part of the floating-point variable to provided one.
</details>
<details>
<summary><h4>float_compare</h4></summary>
The float_compare function compares one floating-point variable to another.

Syntax:
```cmd
call :float_compare first second
```

Parameters:
- `first` (string): The name of the first floating-point variable
- `second` (string): The name of the second floating-point variable.

Result: <br>
`errorlevel` will contain the result of the comparison: 1 if greater, 0 if equal, -1 if less.

Description: <br>
This function compares the value of the first floating-point variable to the value of the second floating-point variable and stores the result in `errorlevel`: 1 if greater, 0 if equal, -1 if less.
</details>
<details>
<summary><h4>float_compare_greater</h4></summary>
The float_compare function compares one floating-point variable to another.

Syntax:
```cmd
call :float_compare_greater first second
```

Parameters:
- `first` (string): The name of the first floating-point variable
- `second` (string): The name of the second floating-point variable.

Result: <br>
`errorlevel` will contain the result of the comparison: 1 if greater, 0 otherwise.

Description: <br>
This function compares the value of the first floating-point variable to the value of the second floating-point variable and stores the result in `errorlevel`: 1 if greater, 0 otherwise.
</details>
<details>
<summary><h4>float_compare_less</h4></summary>
The float_compare function compares one floating-point variable to another.

Syntax:
```cmd
call :float_compare_less first second
```

Parameters:
- `first` (string): The name of the first floating-point variable
- `second` (string): The name of the second floating-point variable.

Result: <br>
`errorlevel` will contain the result of the comparison: 1 if less, 0 otherwise.

Description: <br>
This function compares the value of the first floating-point variable to the value of the second floating-point variable and stores the result in `errorlevel`: 1 if less, 0 otherwise.
</details>
<details>
<summary><h4>float_compare_equal</h4></summary>
The float_compare function compares one floating-point variable to another.

Syntax:
```cmd
call :float_compare_equal first second
```

Parameters:
- `first` (string): The name of the first floating-point variable
- `second` (string): The name of the second floating-point variable.

Result: <br>
`errorlevel` will contain the result of the comparison: 1 if equal, 0 otherwise.

Description: <br>
This function compares the value of the first floating-point variable to the value of the second floating-point variable and stores the result in `errorlevel`: 1 if equal, 0 otherwise.
</details>
<details>
<summary><h4>float_compare_greater_or_equal</h4></summary>
The float_compare function compares one floating-point variable to another.

Syntax:
```cmd
call :float_compare_greater_or_equal first second
```

Parameters:
- `first` (string): The name of the first floating-point variable
- `second` (string): The name of the second floating-point variable.

Result: <br>
`errorlevel` will contain the result of the comparison: 1 if greater or equal, 0 otherwise.

Description: <br>
This function compares the value of the first floating-point variable to the value of the second floating-point variable and stores the result in errorlevel: 1 if greater or equal, 0 otherwise.
</details>
<details>
<summary><h4>float_compare_less_or_equal</h4></summary>
The float_compare function compares one floating-point variable to another.

Syntax:
```cmd
call :float_compare_less_or_equal first second
```

Parameters:
- `first` (string): The name of the first floating-point variable
- `second` (string): The name of the second floating-point variable.

Result: <br>
`errorlevel` will contain the result of the comparison: 1 if less or equal, 0 otherwise.

Description: <br>
This function compares the value of the first floating-point variable to the value of the second floating-point variable and stores the result in errorlevel: 1 if greater or equal, 0 otherwise.
</details>
<details>
<summary><h4>float_compare_not_equal</h4></summary>
The float_compare function compares one floating-point variable to another.

Syntax:
```cmd
call :float_compare_not_equal first second
```

Parameters:
- `first` (string): The name of the first floating-point variable
- `second` (string): The name of the second floating-point variable.

Result: <br>
`errorlevel` will contain the result of the comparison: 1 if not equal, 0 otherwise.

Description: <br>
This function compares the value of the first floating-point variable to the value of the second floating-point variable and stores the result in errorlevel: 1 if not equal, 0 otherwise.
</details>
</details>

## License

[batch_floating_fixed_point](https://github.com/cyber-wojtek/batch_floating_fixed_point) © 2024 by [Wojciech Dudek](https://github.com/cyber-wojtek) is licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/?ref=chooser-v1) 

## Authors

- [@cyber-wojtek](https://www.github.com/cyber-wojtek)

