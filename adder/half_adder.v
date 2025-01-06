//----------------------------------------
// Design Name : half_adder
// Function : 1-bit Half Adder
//----------------------------------------

/* Half Adder Truth Table:
   A B | Sum Carry
   0 0 |  0    0
   0 1 |  1    0
   1 0 |  1    0
   1 1 |  0    1
*/

module half_adder(
    input wire a,    // İlk giriş biti
    input wire b,    // İkinci giriş biti
    output wire sum, // Toplam çıkışı
    output wire cout // Elde çıkışı
);

// Half Adder mantığı
assign sum = a ^ b;    // XOR: Farklı ise 1, aynı ise 0
assign cout = a & b;   // AND: İkisi de 1 ise 1, değilse 0

endmodule
