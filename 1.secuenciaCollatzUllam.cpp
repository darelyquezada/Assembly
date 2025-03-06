// Secuencia de Collatz / Ulam
// Darely Quezada Guerrero
// Valeria Paola Chávez Flores
// 30/01/25
// Ensamblador

#include <iostream>

using namespace std;

int main() {
    long long int n; // Entero largo positivo

    do {
        cout << "Dame un numero: ";
        cin >> n; // Leer

        if (cin.fail() || n <= 0) {
            cin.clear();  // Limpia si hay error
            cin.ignore(numeric_limits<streamsize>::max(), '\n');  // Ignorar
            cout << "Invalid input. Please enter a positive integer." << endl;
            n = 0;  // Repetir
        }
    } while (n <= 0);

    while (n != 1) { // Repetir hasta que de 1
        cout << n << " "; // Imprimir
        if (n % 2 == 0) // Si es par...
            n = n / 2;
        else // Si no es par, multiplicar por 3 y sumar 1
            n = (n * 3) + 1;
    }
    cout << n << endl;
    return 0;
}
