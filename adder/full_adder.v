//----------------------------------------
// Design Name : full_adder
// Function : 1-bit Full Adder
//----------------------------------------

/* Full Adder Truth Table:
   A B Cin | Sum Cout
   0 0  0  |  0    0
   0 0  1  |  1    0
   0 1  0  |  1    0
   0 1  1  |  0    1
   1 0  0  |  1    0
   1 0  1  |  0    1
   1 1  0  |  0    1
   1 1  1  |  1    1
*/

module full_adder(
    input wire a,     // İlk giriş biti
    input wire b,     // İkinci giriş biti
    input wire cin,   // Giriş eldesi
    output wire sum,  // Toplam çıkışı
    output wire cout  // Çıkış eldesi
);

// Full Adder mantığı
assign sum = a ^ b ^ cin;             // Üçlü XOR
assign cout = (a & b) | (cin & (a ^ b)); // Elde hesaplama

endmodule
