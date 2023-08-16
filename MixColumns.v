module MixColumns (Shift_Text,Mix_Text);
    input [127:0] Shift_Text;
    output reg [127:0] Mix_Text;

    wire [7:0] wire1,wire2,wire3,wire4,wire5,wire6,wire7,wire8;
    wire [7:0] wire9,wire10,wire11,wire12,wire13,wire14,wire15,wire16;
    wire [7:0] wire17,wire18,wire19,wire20,wire21,wire22,wire23,wire24;
    wire [7:0] wire25,wire26,wire27,wire28,wire29,wire30,wire31,wire32;

    Mul2 M1_col1(Shift_Text[127:120],wire1);
    Mul3 M2_col1(Shift_Text[119:112],wire2);
    Mul2 M3_col1(Shift_Text[119:112],wire3);
    Mul3 M4_col1(Shift_Text[111:104],wire4);
    Mul2 M5_col1(Shift_Text[111:104],wire5);
    Mul3 M6_col1(Shift_Text[103:96],wire6);
    Mul3 M7_col1(Shift_Text[127:120],wire7);
    Mul2 M8_col1(Shift_Text[103:96],wire8);


    Mul2 M1_col2(Shift_Text[95:88],wire9);
    Mul3 M2_col2(Shift_Text[87:80],wire10);
    Mul2 M3_col2(Shift_Text[87:80],wire11);
    Mul3 M4_col2(Shift_Text[79:72],wire12);
    Mul2 M5_col2(Shift_Text[79:72],wire13);
    Mul3 M6_col2(Shift_Text[71:64],wire14);
    Mul3 M7_col2(Shift_Text[95:88],wire15);
    Mul2 M8_col2(Shift_Text[71:64],wire16);

    Mul2 M1_col3(Shift_Text[63:56],wire17);
    Mul3 M2_col3(Shift_Text[55:48],wire18);
    Mul2 M3_col3(Shift_Text[55:48],wire19);
    Mul3 M4_col3(Shift_Text[47:40],wire20);
    Mul2 M5_col3(Shift_Text[47:40],wire21);
    Mul3 M6_col3(Shift_Text[39:32],wire22);
    Mul3 M7_col3(Shift_Text[63:56],wire23);
    Mul2 M8_col3(Shift_Text[39:32],wire24);

    Mul2 M1_col4(Shift_Text[31:24],wire25);
    Mul3 M2_col4(Shift_Text[23:16],wire26);
    Mul2 M3_col4(Shift_Text[23:16],wire27);
    Mul3 M4_col4(Shift_Text[15:8],wire28);
    Mul2 M5_col4(Shift_Text[15:8],wire29);
    Mul3 M6_col4(Shift_Text[7:0],wire30);
    Mul3 M7_col4(Shift_Text[31:24],wire31);
    Mul2 M8_col4(Shift_Text[7:0],wire32);



    assign Mix_Text[127:120] = wire1 ^ wire2 ^ Shift_Text[111:104] ^ Shift_Text[103:96];
    assign Mix_Text[119:112] = Shift_Text[127:120] ^ wire3 ^ wire4 ^ Shift_Text[103:96];
    assign Mix_Text[111:104] = Shift_Text[127:120] ^ Shift_Text[119:112] ^ wire5 ^ wire6;
    assign Mix_Text[103:96]  = wire7 ^ Shift_Text[119:112] ^ Shift_Text[111:104] ^ wire8;

    assign Mix_Text[95:88] = wire9 ^ wire10 ^ Shift_Text[79:72] ^ Shift_Text[71:64];
    assign Mix_Text[87:80] = Shift_Text[95:88] ^ wire11 ^ wire12 ^ Shift_Text[71:64];
    assign Mix_Text[79:72] = Shift_Text[95:88] ^ Shift_Text[87:80] ^ wire13 ^ wire14;
    assign Mix_Text[71:64]  = wire15 ^ Shift_Text[87:80] ^ Shift_Text[79:72] ^ wire16;


    assign Mix_Text[63:56] = wire17 ^ wire18 ^ Shift_Text[47:40] ^ Shift_Text[39:32];
    assign Mix_Text[55:48] = Shift_Text[63:56] ^ wire19 ^ wire20 ^ Shift_Text[39:32];
    assign Mix_Text[47:40] = Shift_Text[63:56] ^ Shift_Text[55:48] ^ wire21 ^ wire22;
    assign Mix_Text[39:32]  = wire23 ^ Shift_Text[55:48] ^ Shift_Text[47:40] ^ wire24;

    assign Mix_Text[31:24] = wire25 ^ wire26 ^ Shift_Text[15:8] ^ Shift_Text[7:0];
    assign Mix_Text[23:16] = Shift_Text[31:24] ^ wire27 ^ wire28 ^ Shift_Text[7:0];
    assign Mix_Text[15:8] = Shift_Text[31:24] ^ Shift_Text[23:16] ^ wire29 ^ wire30;
    assign Mix_Text[7:0]  = wire31 ^ Shift_Text[23:16] ^ Shift_Text[15:8] ^ wire32;

    
endmodule