module encoder_decoder_tb;
    // Encoder test sinyalleri
    reg [3:0] enc_in;
    wire [1:0] enc_out;
    wire enc_valid;
    
    // Decoder test sinyalleri
    reg [1:0] dec_in;
    reg dec_en;
    wire [3:0] dec_out;
    
    // Test edilecek modüller
    encoder_4to2 enc(
        .in(enc_in),
        .out(enc_out),
        .valid(enc_valid)
    );
    
    decoder_2to4 dec(
        .in(dec_in),
        .en(dec_en),
        .out(dec_out)
    );
    
    initial begin
        $dumpfile("encoder_decoder.vcd");
        $dumpvars(0, encoder_decoder_tb);
        
        // Encoder Testi
        $display("4-to-2 Priority Encoder Test:");
        enc_in = 4'b0001; #10;
        $display("in=%b | out=%b valid=%b", enc_in, enc_out, enc_valid);
        
        enc_in = 4'b0010; #10;
        $display("in=%b | out=%b valid=%b", enc_in, enc_out, enc_valid);
        
        enc_in = 4'b0100; #10;
        $display("in=%b | out=%b valid=%b", enc_in, enc_out, enc_valid);
        
        enc_in = 4'b1000; #10;
        $display("in=%b | out=%b valid=%b", enc_in, enc_out, enc_valid);
        
        enc_in = 4'b1100; #10;  // Öncelik testi
        $display("in=%b | out=%b valid=%b", enc_in, enc_out, enc_valid);
        
        enc_in = 4'b0000; #10;  // Geçersiz giriş testi
        $display("in=%b | out=%b valid=%b", enc_in, enc_out, enc_valid);
        
        // Decoder Testi
        $display("\n2-to-4 Decoder Test:");
        dec_en = 1;  // Decoder aktif
        
        dec_in = 2'b00; #10;
        $display("en=%b in=%b | out=%b", dec_en, dec_in, dec_out);
        
        dec_in = 2'b01; #10;
        $display("en=%b in=%b | out=%b", dec_en, dec_in, dec_out);
        
        dec_in = 2'b10; #10;
        $display("en=%b in=%b | out=%b", dec_en, dec_in, dec_out);
        
        dec_in = 2'b11; #10;
        $display("en=%b in=%b | out=%b", dec_en, dec_in, dec_out);
        
        // Enable=0 testi
        dec_en = 0; #10;
        $display("en=%b in=%b | out=%b", dec_en, dec_in, dec_out);
        
        $finish;
    end
endmodule
