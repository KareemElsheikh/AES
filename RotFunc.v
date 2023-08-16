module RotFunc (
    input wire [31:0] word,
    output reg [31:0] out
);
    assign out = {word[23:0],word[31:24]};
endmodule