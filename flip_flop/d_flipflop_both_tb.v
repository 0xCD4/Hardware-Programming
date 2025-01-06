module d_flipflop_both_tb;
    // Test sinyalleri
    reg clk;
    reg rst;
    reg d;
    wire q_sync;    // Senkron FF çıkışı
    wire q_async;   // Asenkron FF çıkışı

    // Her iki D Flip-Flop örneğini oluştur
    d_flipflop_sync dff_sync (
        .clk(clk),
        .rst(rst),
        .d(d),
        .q(q_sync)
    );

    d_flipflop_async dff_async (
        .clk(clk),
        .rst(rst),
        .d(d),
        .q(q_async)
    );

    // Saat sinyali üret (10ns periyot)
    always begin
        #5 clk = ~clk;
    end

    // Test senaryosu
    initial begin
        $dumpfile("d_flipflop_both.vcd");
        $dumpvars(0, d_flipflop_both_tb);

        // Başlangıç değerleri
        clk = 0;
        rst = 0;
        d = 1;

        // Normal çalışma
        #20;
        
        // Reset'i saat darbesi arasında aktif et
        #3 rst = 1;     // Saat darbesinden 3 birim sonra reset
        
        // Asenkron reset hemen etki eder, senkron reset saat darbesini bekler
        #10;
        
        // Reset'i kaldır
        rst = 0;
        d = 1;
        
        // Normal çalışmaya devam
        #20;

        // Testi bitir
        $finish;
    end

    // Sonuçları göster
    always @(posedge clk or posedge rst) begin
        $display("Time=%0t rst=%b d=%b sync_q=%b async_q=%b", 
                 $time, rst, d, q_sync, q_async);
    end

endmodule
