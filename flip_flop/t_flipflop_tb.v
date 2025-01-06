module t_flipflop_tb;
    reg clk;
    reg rst;
    reg t;
    wire q;

    // T Flip-Flop örneği oluştur
    t_flipflop tff (
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
        $dumpfile("t_flipflop.vcd");
        $dumpvars(0, t_flipflop_tb);

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
        
        // Test 3: Alternatif toggle
        #10 t = 1;  // q tersine çevrilmeli
        #10 t = 0;  // q korunmalı
        #10 t = 1;  // q tersine çevrilmeli
        
        // Test 4: Reset kontrolü
        #10 rst = 1;  // q sıfırlanmalı
        t = 1;        // Reset aktifken t'nin etkisi olmamalı
        #20 rst = 0;  // Reset kaldırıldı
        
        // Test 5: Reset sonrası normal çalışma
        #10 t = 1;    // q tersine çevrilmeli
        #10 t = 1;    // q tekrar tersine çevrilmeli

        #10 $finish;
    end

    // Sonuçları göster
    always @(posedge clk) begin
        $display("Time=%0t rst=%b t=%b q=%b", 
                 $time, rst, t, q);
    end

endmodule
