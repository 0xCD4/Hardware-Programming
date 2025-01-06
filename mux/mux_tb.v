module mux_tb;
    // 2:1 MUX test sinyalleri
    reg in0_2to1, in1_2to1;
    reg sel_2to1;
    wire out_2to1;
    
    // 4:1 MUX test sinyalleri
    reg [3:0] in_4to1;
    reg [1:0] sel_4to1;
    wire out_4to1;
    
    // 8:1 MUX test sinyalleri
    reg [7:0] in_8to1;
    reg [2:0] sel_8to1;
    wire out_8to1;
    
    // Test edilecek modüller
    mux_2to1 mux2(
        .in0(in0_2to1),
        .in1(in1_2to1),
        .sel(sel_2to1),
        .out(out_2to1)
    );
    
    mux_4to1 mux4(
        .in(in_4to1),
        .sel(sel_4to1),
        .out(out_4to1)
    );
    
    mux_8to1 mux8(
        .in(in_8to1),
        .sel(sel_8to1),
        .out(out_8to1)
    );
    
    initial begin
        $dumpfile("mux.vcd");
        $dumpvars(0, mux_tb);
        
        // 2:1 MUX Testi
        $display("2:1 MUX Test:");
        in0_2to1 = 0; in1_2to1 = 1; sel_2to1 = 0; #10;
        $display("sel=%b in0=%b in1=%b | out=%b", sel_2to1, in0_2to1, in1_2to1, out_2to1);
        sel_2to1 = 1; #10;
        $display("sel=%b in0=%b in1=%b | out=%b", sel_2to1, in0_2to1, in1_2to1, out_2to1);
        
        // 4:1 MUX Testi
        $display("\n4:1 MUX Test:");
        in_4to1 = 4'b1010; // Test girişleri
        
        sel_4to1 = 2'b00; #10;
        $display("sel=%b in=%b | out=%b", sel_4to1, in_4to1, out_4to1);
        sel_4to1 = 2'b01; #10;
        $display("sel=%b in=%b | out=%b", sel_4to1, in_4to1, out_4to1);
        sel_4to1 = 2'b10; #10;
        $display("sel=%b in=%b | out=%b", sel_4to1, in_4to1, out_4to1);
        sel_4to1 = 2'b11; #10;
        $display("sel=%b in=%b | out=%b", sel_4to1, in_4to1, out_4to1);
        
        // 8:1 MUX Testi
        $display("\n8:1 MUX Test:");
        in_8to1 = 8'b10101010; // Test girişleri
        
        sel_8to1 = 3'b000; #10;
        $display("sel=%b in=%b | out=%b", sel_8to1, in_8to1, out_8to1);
        sel_8to1 = 3'b011; #10;
        $display("sel=%b in=%b | out=%b", sel_8to1, in_8to1, out_8to1);
        sel_8to1 = 3'b110; #10;
        $display("sel=%b in=%b | out=%b", sel_8to1, in_8to1, out_8to1);
        sel_8to1 = 3'b111; #10;
        $display("sel=%b in=%b | out=%b", sel_8to1, in_8to1, out_8to1);
        
        $finish;
    end
endmodule
