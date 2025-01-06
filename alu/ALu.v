// ALU with basic arithmetic and logical operations
module alu(
    input wire [7:0] a,          // First operand (8-bit)
    input wire [7:0] b,          // Second operand (8-bit)
    input wire [2:0] opcode,     // Operation selection
    output reg [7:0] result,     // Result of operation
    output reg zero,             // Zero flag (set when result is 0)
    output reg carry,            // Carry flag for arithmetic operations
    output reg overflow          // Overflow flag for signed arithmetic
);

    // Operation codes
    parameter ADD = 3'b000;      // Addition
    parameter SUB = 3'b001;      // Subtraction
    parameter AND = 3'b010;      // Bitwise AND
    parameter OR  = 3'b011;      // Bitwise OR
    parameter XOR = 3'b100;      // Bitwise XOR
    parameter SHL = 3'b101;      // Shift left
    parameter SHR = 3'b110;      // Shift right
    parameter CMP = 3'b111;      // Compare (sets flags only)

    // Temporary variable for carry calculations
    reg [8:0] temp;

    always @(*) begin
        // Default flag values
        // Set default flag values to 0
        zero = 1'b0;
        carry = 1'b0;
        overflow = 1'b0;
        
        case(opcode)
            ADD: begin
                // Addition with carry
                temp = {1'b0, a} + {1'b0, b};
                result = temp[7:0];
                carry = temp[8];
                // Overflow occurs when adding two positives gives negative
                // or adding two negatives gives positive
                overflow = (a[7] == b[7]) && (result[7] != a[7]);
            end
            
            SUB: begin
                // Subtraction with borrow
                temp = {1'b0, a} - {1'b0, b};
                result = temp[7:0];
                carry = temp[8];
                // Overflow occurs when subtracting positive from negative gives positive
                // or subtracting negative from positive gives negative
                overflow = (a[7] != b[7]) && (result[7] == b[7]);
            end
            
            AND: begin
                result = a & b;
            end
            
            OR: begin
                result = a | b;
            end
            
            XOR: begin
                result = a ^ b;
            end
            
            SHL: begin
                // Shift left, capture carry out
                {carry, result} = {a, 1'b0};
            end
            
            SHR: begin
                // Shift right, capture carry out
                result = a >> 1;
                carry = a[0];
            end
            
            CMP: begin
                // Compare (like subtraction but only sets flags)
                temp = {1'b0, a} - {1'b0, b};
                result = temp[7:0];
                carry = temp[8];
                overflow = (a[7] != b[7]) && (result[7] == b[7]);
            end
            
            default: result = 8'b0;
        endcase
        
        // Set zero flag if result is zero
        zero = (result == 8'b0);
    end

endmodule