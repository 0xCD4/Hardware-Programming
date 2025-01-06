module alu_tb;

// Test sinyalleri
reg [2:0] opcode;
reg [31:0] op_a;
reg [31:0] op_b;
wire [31:0] result;

// ALU modülü örneği
ALU #(.N(32)) alu_inst (
    .opcode(opcode),
    .op_a(op_a),
    .op_b(op_b),
    .result(result)
);

// Test senaryoları
initial begin
    $dumpfile("alu.vcd");
    $dumpvars(0, alu_tb);
    
    // Test 1: ADD işlemi
    opcode = 3'd0;  // ADD
    op_a = 32'd10;
    op_b = 32'd20;
    #10;
    $display("ADD: %d + %d = %d", op_a, op_b, result);
    
    // Test 2: LESS karşılaştırması
    opcode = 3'd1;  // LESS
    op_a = 32'd15;
    op_b = 32'd20;
    #10;
    $display("LESS: %d < %d = %d", op_a, op_b, result);
    
    // Test 3: EQ karşılaştırması
    opcode = 3'd2;  // EQ
    op_a = 32'd20;
    op_b = 32'd20;
    #10;
    $display("EQ: %d == %d = %d", op_a, op_b, result);
    
    // Test 4: OR işlemi
    opcode = 3'd3;  // OR
    op_a = 32'h0F;
    op_b = 32'hF0;
    #10;
    $display("OR: %h | %h = %h", op_a, op_b, result);
    
    // Test 5: AND işlemi
    opcode = 3'd4;  // AND
    op_a = 32'h0F;
    op_b = 32'hFF;
    #10;
    $display("AND: %h & %h = %h", op_a, op_b, result);
    
    // Test 6: NOT işlemi
    opcode = 3'd5;  // NOT
    op_a = 32'h0F;
    #10;
    $display("NOT: ~%h = %h", op_a, result);
    
    // Test 7: Geçersiz opcode
    opcode = 3'd7;
    #10;
    $display("Invalid opcode: result = %h", result);
    
    $finish;
end

endmodule
