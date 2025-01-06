module dff_active_high_reset_tb;
    reg clk;
    reg reset;
    reg data;
    wire q;

    // DFF örneği oluştur
    dff_active_high_reset dff (
        .data(data),
        .clk(clk),
        .reset(reset),
        .q(q)
    );

    // Saat sinyali üret
    always begin
        #5 clk = ~clk;
    end

    // Test senaryosu
    initial begin
        $dumpfile("dff_active_high_reset.vcd");
        $dumpvars(0, dff_active_high_reset_tb);

        // Başlangıç değerleri
        clk = 0;
        reset = 0;    // Reset pasif
        data = 0;

        // Normal çalışma
        #15 data = 1;
        #10 data = 0;
        
        // Reset'i aktif et
        #10 reset = 1;  // Reset aktif (1 iken aktif)
        data = 1;       // Data değişse bile çıkış 0 kalmalı
        
        // Reset'i kaldır
        #15 reset = 0;  // Reset pasif
        
        // Normal çalışmaya devam
        #10 data = 0;
        #10 data = 1;

        #10 $finish;
    end

    // Sonuçları göster
    always @(posedge clk) begin
        $display("Time=%0t reset=%b data=%b q=%b", 
                 $time, reset, data, q);
    end

endmodule
