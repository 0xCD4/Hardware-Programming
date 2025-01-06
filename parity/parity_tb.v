module parity_tb;
    reg [7:0] data_in;
    wire parity_out;
    integer i;
    
    // Instantiate the parity checker
    parity_using_assign parity_inst (
        .data_in(data_in),
        .parity_out(parity_out)
    );
    
    initial begin
        $dumpfile("parity.vcd");
        $dumpvars(0, parity_tb);
        
        // Test with incrementing values using for loop
        for (i = 0; i < 16; i = i + 1) begin
            data_in = i;
            #10;
            $display("Input: %b (decimal: %d), Parity: %b", data_in, data_in, parity_out);
        end
        
        // Test some specific cases
        data_in = 8'b11111111;
        #10;
        $display("Input: %b (All ones), Parity: %b", data_in, parity_out);
        
        data_in = 8'b10101010;
        #10;
        $display("Input: %b (Alternating), Parity: %b", data_in, parity_out);
        
        $finish;
    end
endmodule
