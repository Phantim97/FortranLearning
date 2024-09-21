# Fortran Cheatsheet

This repo is just to contain a quick ref to everything in Fortran that would be practically needed.
Although ; are not mandatory, coming from languages like C++ it makes me feel more at home with this language.

## Keywords

### Fortran Keywords

- **Control Statements:**
    - `DO`
    - `END DO`
    - `IF`
    - `THEN`
    - `ELSE`
    - `ELSE IF`
    - `END IF`
    - `SELECT CASE`
    - `CASE`
    - `END SELECT`
    - `WHERE`
    - `ELSEWHERE`
    - `END WHERE`
    - `CYCLE`
    - `EXIT`
    - `GOTO`
    - `STOP`
    - `PAUSE`
    - `RETURN`
    - `CALL`

- **Program Structure:**
    - `PROGRAM`
    - `END PROGRAM`
    - `SUBROUTINE`
    - `END SUBROUTINE`
    - `FUNCTION`
    - `END FUNCTION`
    - `MODULE`
    - `END MODULE`
    - `CONTAINS`
    - `BLOCK`
    - `END BLOCK`
    - `INTERFACE`
    - `END INTERFACE`

- **Data Declaration:**
    - `IMPLICIT`
    - `NONE`
    - `INTEGER`
    - `REAL`
    - `COMPLEX`
    - `LOGICAL`
    - `CHARACTER`
    - `TYPE`
    - `PARAMETER`
    - `DIMENSION`
    - `ALLOCATABLE`
    - `POINTER`
    - `TARGET`
    - `INTENT`
    - `OPTIONAL`
    - `EXTERNAL`
    - `INTRINSIC`
    - `COMMON`
    - `EQUIVALENCE`
    - `DATA`
    - `SAVE`
    - `KIND`

- **Input/Output:**
    - `READ`
    - `WRITE`
    - `PRINT`
    - `OPEN`
    - `CLOSE`
    - `INQUIRE`
    - `REWIND`
    - `BACKSPACE`
    - `ENDFILE`

- **Intrinsic Functions:**
    - `ABS`
    - `SIN`
    - `COS`
    - `TAN`
    - `EXP`
    - `LOG`
    - `SQRT`
    - `MIN`
    - `MAX`
    - `SUM`
    - `PRODUCT`
    - `DOT_PRODUCT`
    - `ALLOCATE`
    - `DEALLOCATE`
    - `SIZE`
    - `SHAPE`
    - `LBOUND`
    - `UBOUND`
    - `TRIM`
    - `LEN`
    - `INDEX`
    - `MOD`
    - `AND`
    - `OR`
    - `NOT`
    - `ANY`
    - `ALL`
    - `MERGE`

- **Memory Management:**
    - `ALLOCATE`
    - `DEALLOCATE`
    - `NULLIFY`
    - `ASSOCIATE`

- **Pointer Operations:**
    - `POINTER`
    - `ALLOCATABLE`
    - `TARGET`
    - `NULL`
    - `NULLIFY`

- **Module Operations:**
    - `MODULE`
    - `USE`
    - `END MODULE`
    - `PUBLIC`
    - `PRIVATE`

- **Miscellaneous:**
    - `IMPLICIT NONE`
    - `INCLUDE`
    - `INTERFACE`
    - `ABSTRACT INTERFACE`
    - `IMPORT`
    - `OPTIONAL`
    - `SELECTED_REAL_KIND`
    - `SELECTED_INT_KIND`
    - `INTENT(IN)`
    - `INTENT(OUT)`
    - `INTENT(INOUT)`
    - `PURE`
    - `ELEMENTAL`
    - `RECURSIVE`
    - `RESULT`
    - `ALLOCATABLE`
    - `NOPASS`
    - `PASS`
    - `NON_INTRINSIC`
    - `EXTENDS`

### Notes:
- These keywords are reserved and cannot be used as identifiers (like variable names) in Fortran programs.
- Fortran has evolved over time, so some keywords are specific to more recent standards (e.g., Fortran 90, Fortran 2003, Fortran 2008).

### Fortran Primitive Data Types

- **Integer Types:**
    - `INTEGER`
        - `INTEGER(KIND=1)` (1-byte integer, typically `INTEGER*1`)
        - `INTEGER(KIND=2)` (2-byte integer, typically `INTEGER*2`)
        - `INTEGER(KIND=4)` (4-byte integer, typically `INTEGER*4`)
        - `INTEGER(KIND=8)` (8-byte integer, typically `INTEGER*8`)

- **Real (Floating-Point) Types:**
    - `REAL`
        - `REAL(KIND=4)` (Single precision, typically `REAL*4`)
        - `REAL(KIND=8)` (Double precision, typically `REAL*8`)
        - `REAL(KIND=16)` (Quadruple precision, typically `REAL*16`)

- **Complex Types:**
    - `COMPLEX`
        - `COMPLEX(KIND=4)` (Single precision complex, typically `COMPLEX*8`)
        - `COMPLEX(KIND=8)` (Double precision complex, typically `COMPLEX*16`)
        - `COMPLEX(KIND=16)` (Quadruple precision complex, typically `COMPLEX*32`)

- **Logical (Boolean) Types:**
    - `LOGICAL`
        - `LOGICAL(KIND=1)` (1-byte logical, typically `LOGICAL*1`)
        - `LOGICAL(KIND=2)` (2-byte logical, typically `LOGICAL*2`)
        - `LOGICAL(KIND=4)` (4-byte logical, typically `LOGICAL*4`)
        - `LOGICAL(KIND=8)` (8-byte logical, typically `LOGICAL*8`)

- **Character Types:**
    - `CHARACTER(LEN=*)` (Character string of specified length)

- **Derived Types:**
    - `TYPE` (User-defined composite types)

### Notes:
- The `KIND` parameter specifies the kind of the data type, which generally corresponds to the precision or storage size.
- `INTEGER`, `REAL`, `COMPLEX`, `LOGICAL`, and `CHARACTER` are the most common primitive data types in Fortran.
- The `KIND` values are system-dependent, so the actual byte sizes might vary across different compilers or platforms.
- Fortran Arrays start at 1, not 0.
### Fortran Useful Functions and Statements

- **Input/Output Operations:**
    - `PRINT`
        - Description: Writes output to the standard output (console).
        - Example:
          ```fortran
          print *, "Hello, World!"
          ```

    - `READ`
        - Description: Reads input from the standard input (keyboard) or a file.
        - Example:
          ```fortran
          read *, x
          read(unit=10, fmt=*) var1, var2
          ```

    - `WRITE`
        - Description: Writes output to a file or device.
        - Example:
          ```fortran
          write(*, *) "Hello, World!"
          write(unit=10, fmt='(A)') "Hello, File!"
          ```

    - `OPEN`
        - Description: Opens a file for reading, writing, or both.
        - Example:
          ```fortran
          open(unit=10, file='data.txt', status='old', action='read')
          ```

    - `CLOSE`
        - Description: Closes an open file.
        - Example:
          ```fortran
          close(unit=10)
          ```

    - `INQUIRE`
        - Description: Retrieves information about files or I/O units.
        - Example:
          ```fortran
          inquire(file='data.txt', exist=exists)
          ```

    - `REWIND`
        - Description: Rewinds a file to the beginning.
        - Example:
          ```fortran
          rewind(unit=10)
          ```

    - `BACKSPACE`
        - Description: Moves the file position indicator one record backward.
        - Example:
          ```fortran
          backspace(unit=10)
          ```

    - `ENDFILE`
        - Description: Marks the end of a file.
        - Example:
          ```fortran
          endfile(unit=10)
          ```

- **Mathematical Functions:**
    - `ABS`
        - Description: Returns the absolute value of a number.
        - Example:
          ```fortran
          x = abs(-5)  ! x = 5
          ```

    - `MOD`
        - Description: Returns the remainder of a division (modulus).
        - Example:
          ```fortran
          r = mod(10, 3)  ! r = 1
          ```

    - `SQRT`
        - Description: Returns the square root of a number.
        - Example:
          ```fortran
          y = sqrt(25.0)  ! y = 5.0
          ```

    - `EXP`
        - Description: Returns the exponential of a number (e^x).
        - Example:
          ```fortran
          z = exp(1.0)  ! z ≈ 2.71828
          ```

    - `LOG`
        - Description: Returns the natural logarithm of a number.
        - Example:
          ```fortran
          x = log(2.71828)  ! x ≈ 1.0
          ```

    - `SIN`, `COS`, `TAN`
        - Description: Trigonometric functions for sine, cosine, and tangent.
        - Example:
          ```fortran
          s = sin(pi/2)  ! s = 1.0
          c = cos(0.0)  

### Fortran Symbolic Notation for Boolean Operators

- `==`  : Equal to
- `/=`  : Not equal to
- `<`   : Less than
- `<=`  : Less than or equal to
- `>`   : Greater than
- `>=`  : Greater than or equal to