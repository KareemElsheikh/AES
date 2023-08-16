module AddRoundKey (text,Key,AddKeyText);
    input [127:0] text;
    input [127:0] Key;
    output reg [127:0] AddKeyText;

    assign AddKeyText = text ^ Key;
endmodule