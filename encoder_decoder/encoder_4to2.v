//----------------------------------------
// Design Name : encoder_4to2
// Function    : 4-to-2 Priority Encoder
//----------------------------------------

/* Priority Encoder Truth Table:
   in[3:0] | out[1:0]
   0001    |    00
   0010    |    01
   0100    |    10
   1000    |    11
   
   Öncelik yüksek bite verilir. Örneğin:
   1010    |    11    (in[3]=1 olduğu için)
   0110    |    10    (in[2]=1 olduğu için)
*/

module encoder_4to2(
    input wire [3:0] in,     // 4-bit giriş
    output reg [1:0] out,    // 2-bit çıkış
    output reg valid         // Geçerli giriş göstergesi
);

// Priority encoder mantığı
always @(*) begin
    valid = 1'b1;  // Varsayılan olarak geçerli
    
    casex(in)
        4'b1xxx : out = 2'b11;  // in[3]=1 ise
        4'b01xx : out = 2'b10;  // in[2]=1 ise
        4'b001x : out = 2'b01;  // in[1]=1 ise
        4'b0001 : out = 2'b00;  // in[0]=1 ise
        default : begin
            out = 2'b00;
            valid = 1'b0;  // Geçersiz giriş
        end
    endcase
end

endmodule
