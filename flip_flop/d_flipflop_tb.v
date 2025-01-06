module d_flipflop_tb;
    // Test sinyalleri
    reg clk;
    reg rst;
    reg d;
    wire q;

    // D Flip-Flop örneği oluştur
    d_flipflop dff (
        .clk(clk),
        .rst(rst),
        .d(d),
        .q(q)
    );

    // Saat sinyali üret (10ns periyot)
    always begin
        #5 clk = ~clk;  // Her 5 zaman biriminde saat değişir
    end

    // Test senaryosu
    initial begin
        // Dalga formunu kaydet
        $dumpfile("d_flipflop.vcd");
        $dumpvars(0, d_flipflop_tb);

        // Başlangıç değerleri
        clk = 0;
        // rst'ye başlangıç değeri vermiyoruz
        d = 0;
        
        // rst'nin x değerini gör
        #10;
        $display("Başlangıçta rst = %b", rst);

        // Normal test senaryosu
        rst = 1;        // Reset'i aktif et
        #15 rst = 0;    // Reset'i kaldır

        // Farklı veri değerleri test et
        #10 d = 1;
        #10 d = 0;
        #10 d = 1;

        // Testi bitir
        #10 $finish;
    end

    // Sonuçları göster
    always @(posedge clk) begin
        $display("Time=%0t rst=%b d=%b q=%b", $time, rst, d, q);
    end

endmodule
