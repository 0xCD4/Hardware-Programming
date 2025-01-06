module adder_tb;
    // Half Adder test sinyalleri
    reg ha_a, ha_b;
    wire ha_sum, ha_cout;
    
    // Full Adder test sinyalleri
    reg fa_a, fa_b, fa_cin;
    wire fa_sum, fa_cout;
    
    // 4-bit Ripple Carry Adder test sinyalleri
    reg [3:0] rca_a, rca_b;
    reg rca_cin;
    wire [3:0] rca_sum;
    wire rca_cout;
    
    // Test edilecek modüller
    half_adder ha(
        .a(ha_a),
        .b(ha_b),
        .sum(ha_sum),
        .cout(ha_cout)
    );
    
    full_adder fa(
        .a(fa_a),
        .b(fa_b),
        .cin(fa_cin),
        .sum(fa_sum),
        .cout(fa_cout)
    );
    
    ripple_carry_adder rca(
        .a(rca_a),
        .b(rca_b),
        .cin(rca_cin),
        .sum(rca_sum),
        .cout(rca_cout)
    );
    
    initial begin
        $dumpfile("adder.vcd");
        $dumpvars(0, adder_tb);
        
        // Half Adder Testi
        $display("Half Adder Test:");
        ha_a = 0; ha_b = 0; #10;
        $display("a=%b b=%b | sum=%b cout=%b", ha_a, ha_b, ha_sum, ha_cout);
        ha_a = 0; ha_b = 1; #10;
        $display("a=%b b=%b | sum=%b cout=%b", ha_a, ha_b, ha_sum, ha_cout);
        ha_a = 1; ha_b = 0; #10;
        $display("a=%b b=%b | sum=%b cout=%b", ha_a, ha_b, ha_sum, ha_cout);
        ha_a = 1; ha_b = 1; #10;
        $display("a=%b b=%b | sum=%b cout=%b", ha_a, ha_b, ha_sum, ha_cout);
        
        // Full Adder Testi
        $display("\nFull Adder Test:");
        fa_a = 0; fa_b = 0; fa_cin = 0; #10;
        $display("a=%b b=%b cin=%b | sum=%b cout=%b", fa_a, fa_b, fa_cin, fa_sum, fa_cout);
        fa_a = 1; fa_b = 1; fa_cin = 0; #10;
        $display("a=%b b=%b cin=%b | sum=%b cout=%b", fa_a, fa_b, fa_cin, fa_sum, fa_cout);
        fa_a = 1; fa_b = 1; fa_cin = 1; #10;
        $display("a=%b b=%b cin=%b | sum=%b cout=%b", fa_a, fa_b, fa_cin, fa_sum, fa_cout);
        
        // 4-bit Ripple Carry Adder Testi
        $display("\n4-bit Ripple Carry Adder Test:");
        rca_a = 4'b0011; rca_b = 4'b0011; rca_cin = 0; #10;
        $display("a=%b b=%b cin=%b | sum=%b cout=%b", rca_a, rca_b, rca_cin, rca_sum, rca_cout);
        rca_a = 4'b1111; rca_b = 4'b0001; rca_cin = 0; #10;
        $display("a=%b b=%b cin=%b | sum=%b cout=%b", rca_a, rca_b, rca_cin, rca_sum, rca_cout);
        
        $finish;
    end
endmodule
