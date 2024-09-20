#include "src/calculator.h"

int main() {
    // Function calls to calculate
    // Write your all possible input scenarios here
    // Notice that calculator code written here works with floats now
    calculator(1000, '*', 3);

    calculator(500, '+', 200);

    calculator(100, '/', 0);

    calculator(1, 'A', 1);
    calculator(2147483647,'-', 1);
    calculator(2147483647,'*', 2147483647);
    calculator(2000000000, '+', 2000000123);
    calculator(2000000000,'FUZZ', 2000000123);
    // Adding extra comment to test pipeline for 2024

    return 0;
}
