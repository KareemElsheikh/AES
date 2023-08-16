module ShiftRows (Sub_Text,Shift_Text);
    input [127:0] Sub_Text;
    output reg [127:0] Shift_Text;

    wire [31:0] Row1,Row2,Row3,Row4,temp2,temp3,temp4;
    assign Row1 = {Sub_Text[127:120],Sub_Text[95:88],Sub_Text[63:56],Sub_Text[31:24]};
    assign Row2 = {Sub_Text[119:112],Sub_Text[87:80],Sub_Text[55:48],Sub_Text[23:16]};
    assign Row3 = {Sub_Text[111:104],Sub_Text[79:72],Sub_Text[47:40],Sub_Text[15:8]};
    assign Row4 = {Sub_Text[103:96],Sub_Text[71:64],Sub_Text[39:32],Sub_Text[7:0]};

    assign temp2 = {Row2[23:0],Row2[31:24]};
    assign temp3 = {Row3[15:0],Row3[31:16]};
    assign temp4 = {Row4[7:0],Row4[31:8]};

    assign Shift_Text[127:96] = {Row1[31:24],temp2[31:24],temp3[31:24],temp4[31:24]};
    assign Shift_Text[95:64] = {Row1[23:16],temp2[23:16],temp3[23:16],temp4[23:16]};
    assign Shift_Text[63:32] = {Row1[15:8],temp2[15:8],temp3[15:8],temp4[15:8]};
    assign Shift_Text[31:0] = {Row1[7:0],temp2[7:0],temp3[7:0],temp4[7:0]};

endmodule