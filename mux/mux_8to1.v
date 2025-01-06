//----------------------------------------
// Design Name : mux_8to1
// Function    : 8-to-1 Multiplexer
//----------------------------------------

/* 8:1 MUX Truth Table:
   sel[2:0] | out
     000    | in0
     001    | in1
     010    | in2
     011    | in3
     100    | in4
     101    | in5
     110    | in6
     111    | in7
*/

module mux_8to1(
    input wire [7:0] in,      // 8 giriş (in[7:0])
    input wire [2:0] sel,     // 3-bit seçim
    output reg out            // Çıkış
);

// MUX mantığı
always @(*) begin
    case(sel)
        3'b000: out = in[0];  // in0 seçildi
        3'b001: out = in[1];  // in1 seçildi
        3'b010: out = in[2];  // in2 seçildi
        3'b011: out = in[3];  // in3 seçildi
        3'b100: out = in[4];  // in4 seçildi
        3'b101: out = in[5];  // in5 seçildi
        3'b110: out = in[6];  // in6 seçildi
        3'b111: out = in[7];  // in7 seçildi
        default: out = 1'b0;  // Varsayılan durum
    endcase
end

endmodule
