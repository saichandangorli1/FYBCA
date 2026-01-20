## FYBCA Programming in C Notes

These notes are structured by unit, covering the key concepts of C programming typically taught in an FYBCA course.

**Unit 1: Overview of C**

* **History:** C was developed by Dennis Ritchie at Bell Labs in the early 1970s. It evolved from earlier languages like B and BCPL. It's a powerful, versatile language used for system programming, application development, and more.
* **Basic Structure of a 'C' Program:** A C program typically consists of:
    * **Preprocessor Directives:** (e.g., `#include <stdio.h>`) These instruct the preprocessor to include header files.
    * **Global Declarations:** Variables and functions declared outside any function.
    * **`main()` Function:** The entry point of the program. Execution begins here.
    * **Local Declarations:** Variables declared inside a function.
    * **Statements:** Instructions that perform actions.
    * **Comments:** Explanations within the code (ignored by the compiler).
* **Steps of Compiling and Executing a 'C' Program:**
    1. **Source Code:** Write the C code in a text editor and save it with a `.c` extension (e.g., `myprogram.c`).
    2. **Preprocessing:** The preprocessor handles directives (like `#include`) and macro expansions.
    3. **Compilation:** The compiler translates the preprocessed code into assembly code.
    4. **Assembly:** The assembler converts assembly code into object code (machine code).
    5. **Linking:** The linker combines object code with library functions to create an executable file.
    6. **Execution:** The executable file is loaded into memory and executed by the operating system.

**Unit 2: Constants, Variables, and Data Types**

* **C Tokens:** The smallest individual units in a C program (keywords, identifiers, constants, strings, operators, special symbols).
* **Constants:** Fixed values that do not change during program execution (e.g., `10`, `3.14`, `'A'`, `"Hello"`). Types include integer, floating-point, character, and string literals.
* **Variables:** Named memory locations that can store values that can change during program execution. Must be declared with a data type.
* **Data Types:** Specify the type of value a variable can hold. Common types include:
    * `int`: Integer values.
    * `float`: Floating-point (decimal) values.
    * `char`: Single characters.
    * `double`: Double-precision floating-point values.
* **Declaration of Variables:** Specifies the data type and name of a variable (e.g., `int age;`).
* **Operators and Expressions:** Operators are symbols that perform operations on operands (variables or constants). An expression combines operands and operators to produce a value.
* **Operator Categories:**
    * **Arithmetic Operators:** `+`, `-`, `*`, `/`, `%` (modulo).
    * **Relational Operators:** `==` (equal to), `!=` (not equal to), `>`, `<`, `>=`, `<=`.
    * **Logical Operators:** `&&` (AND), `||` (OR), `!` (NOT).
    * **Assignment Operators:** `=`, `+=`, `-=`, `*=`, `/=`, `%=`.
    * **Increment and Decrement Operators:** `++` (increment), `--` (decrement).
    * **Conditional Operator:** `? :` (ternary operator).
    * **Bitwise Operators:** `&` (AND), `|` (OR), `^` (XOR), `<<` (left shift), `>>` (right shift), `~` (NOT).
* **Operator Precedence and Associativity:** Determine the order in which operations are performed in an expression.
* **Mathematical Functions:** Functions from the `math.h` library (e.g., `sqrt()`, `sin()`, `cos()`, `pow()`).

**Unit 3: Decision Making and Branching**

* **`if` Statement:** Executes a block of code if a condition is true.
* **`if-else` Statement:** Executes one block of code if a condition is true and another block if it's false.
* **`nested if-else`:** An `if` statement inside another `if` or `else` block.
* **`switch` Statement:** A multi-way branching statement that tests a variable against multiple values.
* **`?:` Operator (Ternary Operator):** A shorthand for `if-else` (e.g., `result = (x > y) ? x : y;`).
* **Looping:** Repeating a block of code multiple times.
* **`for` Loop:** Used when the number of iterations is known.
* **`while` Loop:** Used when the number of iterations is unknown and depends on a condition.
* **`do-while` Loop:** Similar to `while`, but the loop body executes at least once.
* **Nested Loops:** A loop inside another loop.
* **`break` Statement:** Exits a loop or `switch` statement.
* **`continue` Statement:** Skips the remaining statements in the current loop iteration and proceeds to the next iteration.

**Unit 4: Arrays**

* **Introduction:** Arrays are collections of elements of the same data type stored in contiguous memory locations.
* **One-Dimensional Arrays:** A linear sequence of elements.
    * **Declaration:** `int numbers[10];` (declares an array named `numbers` to hold 10 integers).
    * **Initialization:** `int numbers[5] = {1, 2, 3, 4, 5};`
* **Two-Dimensional Arrays:** Arrays with rows and columns (like a matrix).
    * **Declaration:** `int matrix[3][4];` (declares a 3x4 matrix).
    * **Initialization:** `int matrix[2][2] = {{1, 2}, {3, 4}};`
* **Dynamic Arrays:** Arrays whose size is determined at runtime (using functions like `malloc()` in C).

**Unit 5: Functions**

* **Need for Functions:** Modularity, code reusability, and easier program organization.
* **User-Defined Functions:** Functions created by the programmer.
* **Built-in Functions:** Functions provided by the C library (e.g., `printf()`, `scanf()`, `sqrt()`).
* **Elements of User-Defined Functions:**
    * **Function Declaration (Prototype):** Tells the compiler the function's name, return type, and parameters.
    * **Function Definition:** The actual code of the function.
    * **Function Call:** Executing the function.
* **Categories of Functions:** Based on return values and parameters (e.g., functions with/without return values, functions with/without parameters).
* **Nesting of Functions:** Calling a function from within another function.
* **Recursion:** A function calling itself.
* **Passing Arrays to Functions:** Arrays are passed by reference (the memory address is passed).

**Unit 6: Character Arrays and Strings**

* **Introduction:** Strings in C are represented as arrays of characters terminated by a null character (`\0`).
* **Declaring and Initializing String Variables:** `char name[20] = "John";`
* **Arithmetic Operations on Characters:** Characters can be treated as integers (ASCII values).
* **String Handling Functions:** Functions from the `string.h` library (e.g., `strcpy()`, `strcat()`, `strlen()`, `strcmp()`).

**Unit 7: Variables Revisited**

* **Scope:** The region of the program where a variable is accessible.
* **Visibility:** Whether a variable is visible (accessible) in a particular part of the code.
* **Lifetime:** The duration for which a variable exists in memory.
* **Storage Classes:** Keywords that determine the scope, visibility, and lifetime of variables (`auto`, `extern`, `static`, `register`).

**Unit 8: Structures**

* **Introduction:** Structures are user-defined data types that can group together variables of different data types.
* **Defining a Structure:**
    ```c
    struct Student {
        int rollNumber;
        char name[50];
        float marks;
    };
    ```
* **Declaring Structure Variables:** `struct Student student1;`
* **Accessing Structure Members:** Using the dot operator (`.`) (e.g., `student1.rollNumber = 10;`).
* **Arrays of Structures:** An array where each element is a structure.
* **Arrays within Structures:** A structure containing an array as a member.
* **Structures and Functions:** Structures can be passed to and returned from functions.

**Unit 9: Pointers**

* **Understanding Pointers:** Pointers are variables that store memory addresses. They allow you to indirectly access and manipulate data stored in other memory locations.
* **`&` and `*` Operators:**
    * `&` (Address-of Operator): Returns the memory address of a variable. For example, `int x = 10; int *p = &x;` Here, `p` stores the memory address of `x`.
    * `*` (Dereference Operator): Accesses the value stored at a memory address. Using the example above, `*p` would give you the value 10 (the value stored at the memory location pointed to by `p`).
* **Pointer Arithmetic:** You can perform arithmetic operations on pointers, but the operations are scaled by the size of the data type the pointer points to. For example, if `p` is an `int` pointer, `p + 1` will move the pointer to the next integer in memory (not just the next byte). This is particularly useful when working with arrays.
* **Call by Value and Call by Reference:**
    * **Call by Value:** When you pass a variable to a function by value, a copy of the variable's value is passed to the function. Changes made to the parameter inside the function do not affect the original variable.
    * **Call by Reference:** When you pass a variable to a function by reference (using pointers), the memory address of the variable is passed. Changes made to the parameter inside the function *do* affect the original variable.
* **Pointers and Arrays:** The name of an array is actually a pointer to the first element of the array. This is why arrays are often passed to functions by reference.
* **Pointers and Structures:** You can have pointers to structures. You use the `->` operator to access members of a structure through a pointer (e.g., `struct Student *ptr = &student1; ptr->rollNumber = 20;`).

**Unit 10: File Handling in C**

* **Introduction:** File handling allows you to work with files stored on your computer's disk. This is essential for storing and retrieving data persistently.
* **Basic File Operations:**
    1. **Opening a File:** Establishing a connection between your program and the file. You specify the filename and the mode (read, write, append).
    2. **Reading from a File:** Retrieving data from the file.
    3. **Writing to a File:** Storing data into the file.
    4. **Closing a File:** Disconnecting your program from the file (important to save changes and release resources).
* **File Handling Library Functions:** Functions provided in the `stdio.h` header file.
    * `fopen()`: Opens a file. Takes the filename and mode as arguments. Returns a `FILE` pointer.
    * `fclose()`: Closes a file. Takes the `FILE` pointer as an argument.
    * `fprintf()`: Writes formatted data to a file (similar to `printf`).
    * `fscanf()`: Reads formatted data from a file (similar to `scanf`).
    * `fgetc()`: Reads a single character from a file.
    * `fputc()`: Writes a single character to a file.
    * `fgets()`: Reads a line from a file.
    * `fputs()`: Writes a string to a file.
    * `fread()`: Reads a block of data from a file.
    * `fwrite()`: Writes a block of data to a file.
    * `fseek()`: Moves the file pointer to a specific position in the file.
    * `ftell()`: Returns the current position of the file pointer.
* **File Opening Modes:**
    * `"r"`: Read mode. The file must exist.
    * `"w"`: Write mode. Creates a new file or overwrites an existing one.
    * `"a"`: Append mode. Adds data to the end of the file.
    * `"r+"`: Read and write mode. The file must exist.
    * `"w+"`: Read and write mode. Creates a new file or overwrites an existing one.
    * `"a+"`: Read and append mode.
* **Opening a File (Example):**
    ```c
    FILE *fp;
    fp = fopen("myfile.txt", "w");  // Open for writing
    if (fp == NULL) {
        printf("Error opening file.\n");
        exit(1); // Exit the program if the file cannot be opened
    }
    ```
* **Closing a File (Example):**
    ```c
    fclose(fp);
    ```
* **Error Handling:** It's crucial to check the return values of file functions (especially `fopen()`) to handle potential errors (e.g., file not found, permission issues).

**Unit 11: Introduction to Preprocessor**

* **Features of C Preprocessor:** The C preprocessor is a program that runs *before* the compiler. It performs several useful tasks:
    * **Macro Expansion:** Replacing macro names with their definitions.
    * **File Inclusion:** Including the contents of header files.
    * **Conditional Compilation:** Compiling code selectively based on conditions.
* **Macro Expansion:** Macros are defined using `#define`. The preprocessor replaces every instance of the macro name with its defined value *before* compilation.
    ```c
    #define PI 3.14159
    double radius = 5.0;
    double area = PI * radius * radius; // PI is replaced with 3.14159
    ```
* **Macros with Arguments:** Macros can take arguments, making them similar to functions, but they are expanded inline (no function call overhead). *Important:* Use parentheses generously in macro definitions to avoid unexpected behavior due to operator precedence.
    ```c
    #define SQUARE(x) ((x) * (x)) // Correct: Parentheses are essential!
    int y = SQUARE(5); // y becomes 25
    ```
* **Macros versus Functions:** Macros are generally faster than functions (no function call overhead), but they can be less type-safe and can lead to code bloat (if a macro is used many times, the code is duplicated). Functions are generally preferred for more complex logic.
* **File Inclusion:** The `#include` directive is used to include the contents of header files. Header files usually contain function prototypes, definitions of constants, and other declarations.
    * `#include <stdio.h>` (includes standard input/output library)
    * `#include "myheader.h"` (includes a user-defined header file)
* **Conditional Compilation:** Allows you to compile different parts of the code based on conditions. This is useful for debugging, platform-specific code, or creating different versions of a program.
    ```c
    #ifdef DEBUG  // If DEBUG is defined
        printf("Debugging information.\n");
    #endif

    #if VERSION == 1 // If VERSION is 1
        // Code for version 1
    #elif VERSION == 2 // Else if VERSION is 2
        // Code for version 2
    #endif
    ```
* **`#if` and `#elif` Directives:** Used for conditional compilation. `#if` checks a constant expression. `#elif` is used for subsequent conditions (like `else if`). `#else` can be used as a final catch-all. `#endif` closes the conditional block.