//----------------------------------------
// Design Name : decoder_2to4
// Function    : 2-to-4 Decoder with Enable
//----------------------------------------

/* Decoder Truth Table:
   en in[1:0] | out[3:0]
   0    xx    | 0000     (devre pasif)
   1    00    | 0001
   1    01    | 0010
   1    10    | 0100
   1    11    | 1000
*/

module decoder_2to4(
    input wire [1:0] in,     // 2-bit giriş
    input wire en,           // Enable sinyali
    output reg [3:0] out     // 4-bit çıkış
);

// Decoder mantığı
always @(*) begin
    if (!en)
        out = 4'b0000;  // Enable=0 ise tüm çıkışlar 0
    else
        case(in)
            2'b00 : out = 4'b0001;
            2'b01 : out = 4'b0010;
            2'b10 : out = 4'b0100;
            2'b11 : out = 4'b1000;
            default : out = 4'b0000;
        endcase
end

endmodule
