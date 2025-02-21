// Conversion de bases
// Darely Quezada Guerrero
// Valeria Paola Chavez Flores
// 19/02/25
// Ensamblador

#include <iostream>
using namespace std;

int main() {
    // Binario
    // Hexadecimal
    // Octal
    double n;
    
    cout << "Enter a number: ";
    cin >> n;
    
    // Separar enteros y decimales
    int entero = static_cast<int>(n);
    ///cout<<"// Entero: "<<entero<<endl;
    double fraccion = n - entero;
    ///cout<<"// Fraccion: "<<fraccion<<endl;
    
    // --------------------------------------------------------
    cout << "  -  B I N A R Y  -  " << endl;
    // --------------------------------------------------------
    
    // Inicializar strings para guardar la respuesta
    string strent = "";
    string strfrac = "";
    
    // PARTE ENTERA
    if(entero == 0){
        strent = "0";
    }
    else{
        while (entero > 0){
            strent=to_string(entero%2)+strent; // Que se vaya construyendo de derecha a izquierda
            entero /= 2;
        }
    }
    ///cout<<"/// Parte entera: "<<strent<<"."<<endl;
    
    // PARTE FRACCIONARIA
    if(fraccion == 0){
        strfrac += "0";
    }
    else{
        int precision = 10;
        while(precision--&&fraccion > 0){
            fraccion*=2;
            int frac2=(int)fraccion; // Se le quita el decimal, es decir, si da 1.8 entonces se guarda el 1...
            fraccion-=frac2; // Y se guarda el 0.8
            strfrac+=to_string(frac2); // Que se vaya construyendo
            /*
             double remain=fraccion-frac2; // Y se guarda el 0.8
             strfrac=strfrac+to_string(frac2); // Que se vaya construyendo
             fraccion=remain; // Actualizar fracc para evaluar 0.8*2=1.6
             */
        }
    }
    ///cout<<"/// Parte fraccionaria: "<<strfrac<<endl;
    
    cout<<"-> Resultado binario final: "<<endl<<strent<<"."<<strfrac<<endl;
    
    // --------------------------------------------------------
    cout << "  -  H E X A D E C I M A L  -  " << endl;
    // --------------------------------------------------------
    
    //10 dec
    //1010 bin
    //A hexa
    
    //28
    //11100
    //1C
    
    string hexa="";
    
    if(n!=0){
        // Reiniciar valores
        entero = static_cast<int>(n);
        fraccion = n - entero;
        
        // PARTE ENTERA
        if(entero == 0){
            strent = "0";
        }
        else{
            while(entero>0){ ///28
                int remain = entero % 16; ///12
                hexa = (remain < 10 ? char('0' + remain) : char('A' + remain - 10)) + hexa; ///A+12-10 = A+2, que en ASCII es 65(A) + 2 = 67 (C)
                // remain<10 entonces escribe un numero del 0 al 9 /// Por que +0?
                // else agregar la letra convirtiendo el numero equivalente al codigo ASCII
                entero/=16; //1
                //luego 1<10 entonces solo se pone 1 y el remain que es C = 1C
            }
        }
        
        // PARTE FRACCIONARIA
        if (fraccion > 0) { // 0.1
            hexa += ".";
            int precision = 10; // Max de decimales en hexadecimal
            while (precision--) {
                fraccion *= 16; // 1.6
                int digito = static_cast<int>(fraccion); // Extraer 1
                hexa += (digito < 10 ? char('0' + digito) : char('A' + digito - 10));
                fraccion -= digito; // Guardar 0.6
                //////if (fraccion == 0) break;
            }
        }
    }
    if(n==0){
        hexa = "0";
    }

    cout<<"-> Resultado hexadecimal final: "<<endl<<hexa<<endl;
    
    // --------------------------------------------------------
    cout << "  -  O C T A L  -  " << endl;
    // --------------------------------------------------------
    
    // Reiniciar valores
    entero = static_cast<int>(n);
    fraccion = n - entero;
    string octal="";
    
    // PARTE ENTERA
    if (entero == 0) {
        octal = "0";
    }
    else {
        while(entero>0){
            int remain = entero % 8;
            octal = char('0' + remain) + octal; // '0' + remain : entonces si no se le agrega el 0 no se convierte el numero a char
            entero /= 8;
        }
    }
    
    // PARTE FRACCIONARIA
    if (fraccion > 0) {
        octal += ".";
        int precision = 10; // Maximo de decimales en octal
        while (precision--) {
            fraccion *= 8;
            int digito = static_cast<int>(fraccion); // Extraer el entero
            octal += char('0' + digito); // Agregar
            fraccion -= digito; // Guardar el decimal
            //////if (fraccion == 0) break;
        }
    }

    cout << "-> Resultado octal final: " << endl << octal << endl;
    
    return 0;
    
    
}
