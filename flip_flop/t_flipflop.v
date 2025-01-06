//----------------------------------------
// Design Name : t_flipflop
// Function : T flip-flop with async reset
//----------------------------------------

module t_flipflop (
    input wire clk,      // Saat girişi
    input wire rst,      // Asenkron reset (aktif yüksek)
    input wire t,        // Toggle girişi
    output reg q         // Çıkış
);

// Başlangıç değeri
initial begin
    q = 0;
end

// T Flip-Flop davranışı
always @(posedge clk or posedge rst) begin
    if (rst) begin
        q <= 1'b0;              // Reset aktifken çıkışı sıfırla
    end else if (t) begin
        q <= ~q;                // T=1 iken çıkışı tersle
    end
    // T=0 iken mevcut durumu koru (else gerekmiyor)
end

endmodule

// Başlangıç: q = 0
// Saat Darbesi 1: t = 1 → q = 1  (0'dan 1'e değişti)
// Saat Darbesi 2: t = 1 → q = 0  (1'den 0'a değişti)
// Saat Darbesi 3: t = 0 → q = 0  (değişmedi, korudu)
// Saat Darbesi 4: t = 1 → q = 1  (0'dan 1'e değişti)