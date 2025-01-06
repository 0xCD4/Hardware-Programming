// Senkron reset'li D Flip-Flop
module d_flipflop_sync(
    input wire clk,      // Saat sinyali
    input wire rst,      // Senkron reset (aktif yüksek)
    input wire d,        // Veri girişi
    output reg q         // Çıkış
);

// Başlangıç değeri
initial begin
    q = 0;
end

// Senkron reset - sadece saat darbesinde kontrol edilir
always @(posedge clk) begin
    if (rst) begin
        q <= 1'b0;      // Reset aktifse çıkışı sıfırla
    end else begin
        q <= d;         // Normal çalışma
    end
end

endmodule

// Asenkron reset'li D Flip-Flop
module d_flipflop_async(
    input wire clk,      // Saat sinyali
    input wire rst,      // Asenkron reset (aktif yüksek)
    input wire d,        // Veri girişi
    output reg q         // Çıkış
);

// Başlangıç değeri
initial begin
    q = 0;
end

// Asenkron reset - saat darbesini beklemeden hemen etki eder
always @(posedge clk or posedge rst) begin
    if (rst) begin
        q <= 1'b0;      // Reset aktifse hemen çıkışı sıfırla
    end else begin
        q <= d;         // Normal çalışma
    end
end

endmodule
