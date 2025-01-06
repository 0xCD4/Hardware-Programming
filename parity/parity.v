module parity_using_assign (
    data_in    , //  8 bit data in
    parity_out   //  1 bit parity out
);

output  parity_out ;
input [7:0] data_in ; 
reg parity_out;

// Function to calculate parity
function calc_parity;
    input [7:0] data;
    reg result;
    integer i;
begin
    result = 0;
    for (i = 0; i < 8; i = i + 1) begin
        result = result ^ data[i];
    end
    calc_parity = result;
end
endfunction

// Calculate parity using the function
always @(data_in) begin
    parity_out = calc_parity(data_in);
end

endmodule