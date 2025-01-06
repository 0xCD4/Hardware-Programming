//----------------------------------------
// Design Name : dff_active_high_reset
// Function : D flip-flop with active-high reset
//----------------------------------------

module dff_active_high_reset (
    data,   // Data Input
    clk,    // Clock Input
    reset,  // Reset input (active-high)
    q       // Q output
);

//----------Input Ports---------------
input data, clk, reset;

//----------Output Ports---------------
output q;

//----------Internal Variables--------
reg q;

//----------Code Starts Here---------
always @ (posedge clk) begin
    if (reset) begin        // reset=1 iken aktif
        q <= 1'b0;         // çıkışı sıfırla
    end else begin         // reset=0 iken normal çalışma
        q <= data;
    end
end

endmodule
