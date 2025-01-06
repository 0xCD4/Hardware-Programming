//----------------------------------------
// Design Name : mux_2to1
// Function    : 2-to-1 Multiplexer
//----------------------------------------

/* 2:1 MUX Truth Table:
   sel in0 in1 | out
    0   0   x  |  0
    0   1   x  |  1
    1   x   0  |  0
    1   x   1  |  1
*/

module mux_2to1(
    input wire in0,     // İlk giriş
    input wire in1,     // İkinci giriş
    input wire sel,     // Seçim sinyali
    output wire out     // Çıkış
);

// MUX mantığı
assign out = (sel) ? in1 : in0;  // sel=1 ise in1, sel=0 ise in0 seçilir

endmodule
