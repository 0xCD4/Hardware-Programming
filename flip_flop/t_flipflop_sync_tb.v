module t_flipflop_sync_tb;
    reg clk;
    reg rst;
    reg t;
    wire q;

    // T Flip-Flop örneği oluştur
    t_flipflop_sync tff (
        .clk(clk),
        .rst(rst),
        .t(t),
        .q(q)
    );

    // Saat sinyali üret (10ns periyot)
    always begin
        #5 clk = ~clk;
    end

    // Test senaryosu
    initial begin
        $dumpfile("t_flipflop_sync.vcd");
        $dumpvars(0, t_flipflop_sync_tb);

        // Başlangıç değerleri
        clk = 0;
        rst = 1;    // Reset aktif
        t = 0;
        
        // Reset'i kaldır
        #20 rst = 0;
        
        // Test 1: T=1 ile toggle
        #10 t = 1;  // q tersine çevrilmeli
        #10 t = 1;  // q tekrar tersine çevrilmeli
        
        // Test 2: T=0 ile durumu koru
        #10 t = 0;  // q değişmemeli
        #20;        // Birkaç saat çevrimi bekle
        
        // Test 3: Reset'i saat darbesi arasında uygula
        #3 rst = 1;  // Reset sinyali ver (saat darbesini beklemeli)
        t = 1;       // T=1 olsa bile reset öncelikli
        
        // Reset'i kaldır ve normal çalışmaya devam et
        #15 rst = 0;
        
        // Test 4: Normal çalışmaya devam
        #10 t = 1;  // q tersine çevrilmeli
        #10 t = 0;  // q korunmalı
        #10 t = 1;  // q tersine çevrilmeli

        #10 $finish;
    end

    // Sonuçları göster
    always @(posedge clk) begin
        $display("Time=%0t rst=%b t=%b q=%b", 
                 $time, rst, t, q);
    end

endmodule
