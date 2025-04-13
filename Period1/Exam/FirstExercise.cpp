// First Exercise
// Valeria Paola Chavez Flores
// Darely Quezada Guerrero
// 10 / 03/ 2025
// Assembly

#include <iostream>
#include <cstring>
using namespace std;

int main() {
    int number, base;
    string result;

    cout << "Enter number to convert: "; // Read integer
    cin >> number;
    cout << "Enter base: "; // Read base
    cin >> base;

    if(number == 0){ // Verify it is not 0
        result = "0";
    }
    else { // If it is not 0, then proceed to do the convertion
        while (number > 0){ 
            result = to_string(number % base) + result; // Building the string from right to left
            number /= base; // Divide integer by base
        }
    }
    cout << "Result: " << result << "\n";
    cout << "Base: " << base;

}