//----------------------------------------
// Design Name : mux_4to1
// Function    : 4-to-1 Multiplexer
//----------------------------------------

/* 4:1 MUX Truth Table:
   sel[1:0] | out
     00     | in0
     01     | in1
     10     | in2
     11     | in3
*/

module mux_4to1(
    input wire [3:0] in,      // 4 giriş (in[3:0])
    input wire [1:0] sel,     // 2-bit seçim
    output reg out            // Çıkış
);

// MUX mantığı
always @(*) begin
    case(sel)
        2'b00: out = in[0];   // in0 seçildi
        2'b01: out = in[1];   // in1 seçildi
        2'b10: out = in[2];   // in2 seçildi
        2'b11: out = in[3];   // in3 seçildi
        default: out = 1'b0;  // Varsayılan durum
    endcase
end

endmodule
