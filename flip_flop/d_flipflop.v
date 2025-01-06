module d_flipflop(
    input wire clk,      // Saat sinyali
    input wire rst,      // Reset sinyali (aktif yüksek)
    input wire d,        // Veri girişi
    output reg q         // Çıkış
);

// Başlangıç değeri ataması
initial begin
    q = 0;
end

// Senkron D Flip-Flop davranışı
always @(posedge clk) begin
    if (rst) begin      // rst=1 iken resetle
        q <= 1'b0;      // çıkışı sıfırla
    end else begin      // rst=0 iken normal çalış
        q <= d;         // D'yi Q'ya aktar
    end
end

endmodule
