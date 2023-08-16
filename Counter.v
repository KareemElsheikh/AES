module Counter (clk,Round);
    input  clk;
    output reg [6:0] Round;
    assign Round = 7'b0000000;
always @(posedge clk) 
    begin
         Round = Round + 1;   
    end     
endmodule