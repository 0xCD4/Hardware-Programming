//----------------------------------------
// Design Name : ripple_carry_adder
// Function : 4-bit Ripple Carry Adder
//----------------------------------------

module ripple_carry_adder(
    input wire [3:0] a,    // 4-bit ilk sayı
    input wire [3:0] b,    // 4-bit ikinci sayı
    input wire cin,        // Giriş eldesi
    output wire [3:0] sum, // 4-bit toplam
    output wire cout       // Çıkış eldesi
);

// Ara eldeleri tutmak için
wire c1, c2, c3;

// 4 adet full adder kullanarak 4-bitlik toplama
full_adder fa0(
    .a(a[0]), 
    .b(b[0]), 
    .cin(cin), 
    .sum(sum[0]), 
    .cout(c1)
);

full_adder fa1(
    .a(a[1]), 
    .b(b[1]), 
    .cin(c1), 
    .sum(sum[1]), 
    .cout(c2)
);

full_adder fa2(
    .a(a[2]), 
    .b(b[2]), 
    .cin(c2), 
    .sum(sum[2]), 
    .cout(c3)
);

full_adder fa3(
    .a(a[3]), 
    .b(b[3]), 
    .cin(c3), 
    .sum(sum[3]), 
    .cout(cout)
);

endmodule
