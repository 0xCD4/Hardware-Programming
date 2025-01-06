//----------------------------------------
// Design Name : t_flipflop_sync
// Function : T flip-flop with sync reset
//----------------------------------------

/* Test Sonuçları:
   Time=5   rst=1 t=0 q=0  // Reset aktif, çıkış 0
   Time=15  rst=1 t=0 q=0  // Reset devam ediyor
   Time=25  rst=0 t=0 q=0  // Reset kalktı, T=0 olduğu için değişim yok
   Time=35  rst=0 t=1 q=0  // T=1 oldu, bir sonraki saat darbesinde değişecek
   Time=45  rst=0 t=1 q=1  // Çıkış 0'dan 1'e değişti
   Time=55  rst=0 t=0 q=0  // T=0, değişim yok
   Time=65  rst=0 t=0 q=0  // T=0 devam ediyor
   Time=75  rst=1 t=1 q=0  // Reset aktif oldu
   Time=85  rst=1 t=1 q=0  // Reset devam ediyor
   Time=95  rst=0 t=1 q=0  // Reset kalktı
   Time=105 rst=0 t=1 q=1  // Normal toggle işlemi
   Time=115 rst=0 t=0 q=0  // T=0, değişim yok
   Time=125 rst=0 t=1 q=0  // T=1, toggle başlıyor
   Time=135 rst=0 t=1 q=1  // Çıkış 1'de kaldı
   Time=145 rst=0 t=0 q=0  // T=0, çıkış 0'a döndü
*/

module t_flipflop_sync (
    input wire clk,      // Saat girişi
    input wire rst,      // Senkron reset (aktif yüksek)
    input wire t,        // Toggle girişi
    output reg q         // Çıkış
);

// Başlangıç değeri
initial begin
    q = 0;
end

// T Flip-Flop davranışı (senkron reset)
always @(posedge clk) begin    // Sadece saat kenarında kontrol
    if (rst) begin
        q <= 1'b0;            // Reset sadece saat kenarında
    end else if (t) begin
        q <= ~q;              // Toggle işlemi
    end
    // T=0 iken mevcut durumu koru
end

endmodule

