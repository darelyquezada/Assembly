// Conteo de 1s
// Darely Quezada Guerrero
// Valeria Paola Chávez Flores
// 11/02/25
// Ensamblador

#include <iostream>
#include <string>
#include <limits> // Para verificar errores
using namespace std;

int main() {
    int cad; // Leer
    int uno = 0; // Contador
    string cad2; // Cadena con unos
    int tam;

    while (true) {
        cout << "Dame un numero: ";
        cin >> cad; // Leer

        // Verificar si la entrada es valida
        if (cin.fail()) {
            cin.clear();  // Limpiar si hay error
            cin.ignore(numeric_limits<streamsize>::max(), '\n');  // Ignorar
            cout << "Entrada incorrecta!" << endl;
            continue;  // Repetir la lectura
        }

        // Convertir a string para contar los unos
        cad2 = to_string(cad); // Cast
        tam = cad2.length(); // Medir longitud
        uno = 0; // Reiniciar cont

        for (int i = 0; i < tam; i++) { // Recorrer y checar los 1
            if (cad2[i] == '1') {
                uno++; // Contar
            }
        }
        cout << uno << endl;
    }
}
