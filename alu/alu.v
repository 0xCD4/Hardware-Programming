//----------------------------------------
// Design Name : ALU
// Function    : Arithmetic Logic Unit with 6 operations
//----------------------------------------

// Operation codes
`define ADD  3'd0    // Toplama
`define LESS 3'd1    // Küçüktür karşılaştırması
`define EQ   3'd2    // Eşitlik karşılaştırması
`define OR   3'd3    // Mantıksal OR
`define AND  3'd4    // Mantıksal AND
`define NOT  3'd5    // Mantıksal NOT

module ALU(
    input [2:0] opcode,      // İşlem kodu
    input [N-1:0] op_a,      // İlk operand
    input [N-1:0] op_b,      // İkinci operand
    output reg [N-1:0] result    // Sonuç
);

parameter N = 32;  // Operand genişliği

// ALU işlemleri
always @* begin
    case(opcode)
        `ADD:  result = op_a + op_b;      // Toplama
        `LESS: result = op_a < op_b;      // Küçüktür
        `EQ:   result = op_a == op_b;     // Eşitlik
        `OR:   result = op_a | op_b;      // OR
        `AND:  result = op_a & op_b;      // AND
        `NOT:  result = ~op_a;            // NOT (sadece op_a kullanılır)
        default: result = 0;              // Geçersiz opcode
    endcase
end

endmodule
