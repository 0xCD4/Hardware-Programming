

module dff_sync_reset (
    data,   // Data Input
    clk,    // Clock Input
    reset,  // Reset input
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
    if (~reset) begin
        q <= 1'b0;
    end else begin
        q <= data;
    end
end

endmodule //End Of Module dff_sync_reset
