module aes_box (
    input [7:0] in_byte,
    output reg [7:0] out_byte
);
    reg [7:0] box[0:255];

    // Initialize box values
    initial begin
        box[0] = 8'h63; box[1] = 8'h7C; box[2] = 8'h77; box[3] = 8'h7B;
        box[4] = 8'hF2; box[5] = 8'h6B; box[6] = 8'h6F; box[7] = 8'hC5;
        box[8] = 8'h30; box[9] = 8'h01; box[10] = 8'h67; box[11] = 8'h2B;
        box[ 12] = 8'hFE; box[ 13] = 8'hD7; box[ 14] = 8'hAB; box[ 15] = 8'h76;
        box[ 16] = 8'hCA; box[ 17] = 8'h82; box[ 18] = 8'hC9; box[ 19] = 8'h7D;
        box[ 20] = 8'hFA; box[ 21] = 8'h59; box[ 22] = 8'h47; box[ 23] = 8'hF0;
        box[ 24] = 8'hAD; box[ 25] = 8'hD4; box[ 26] = 8'hA2; box[ 27] = 8'hAF;
        box[ 28] = 8'h9C; box[ 29] = 8'hA4; box[ 30] = 8'h72; box[ 31] = 8'hC0;
        box[ 32] = 8'hB7; box[ 33] = 8'hFD; box[ 34] = 8'h93; box[ 35] = 8'h26;
        box[ 36] = 8'h36; box[ 37] = 8'h3F; box[ 38] = 8'hF7; box[ 39] = 8'hCC;
        box[ 40] = 8'h34; box[ 41] = 8'hA5; box[ 42] = 8'hE5; box[ 43] = 8'hF1;
        box[ 44] = 8'h71; box[ 45] = 8'hD8; box[ 46] = 8'h31; box[ 47] = 8'h15;
        box[ 48] = 8'h04; box[ 49] = 8'hC7; box[ 50] = 8'h23; box[ 51] = 8'hC3;
        box[ 52] = 8'h18; box[ 53] = 8'h96; box[ 54] = 8'h05; box[ 55] = 8'h9A;
        box[ 56] = 8'h07; box[ 57] = 8'h12; box[ 58] = 8'h80; box[ 59] = 8'hE2;
        box[ 60] = 8'hEB; box[ 61] = 8'h27; box[ 62] = 8'hB2; box[ 63] = 8'h75;
        box[ 64] = 8'h09; box[ 65] = 8'h83; box[ 66] = 8'h2C; box[ 67] = 8'h1A;
        box[ 68] = 8'h1B; box[ 69] = 8'h6E; box[ 70] = 8'h5A; box[ 71] = 8'hA0;
        box[ 72] = 8'h52; box[ 73] = 8'h3B; box[ 74] = 8'hD6; box[ 75] = 8'hB3;
        box[ 76] = 8'h29; box[ 77] = 8'hE3; box[ 78] = 8'h2F; box[ 79] = 8'h84;
        box[ 80] = 8'h53; box[ 81] = 8'hD1; box[ 82] = 8'h00; box[ 83] = 8'hED;
        box[ 84] = 8'h20; box[ 85] = 8'hFC; box[ 86] = 8'hB1; box[ 87] = 8'h5B;
        box[ 88] = 8'h6A; box[ 89] = 8'hCB; box[ 90] = 8'hBE; box[ 91] = 8'h39;
        box[ 92] = 8'h4A; box[ 93] = 8'h4C; box[ 94] = 8'h58; box[ 95] = 8'hCF;
        box[ 96] = 8'hD0; box[ 97] = 8'hEF; box[ 98] = 8'hAA; box[ 99] = 8'hFB;
        box[100] = 8'h43; box[101] = 8'h4D; box[102] = 8'h33; box[103] = 8'h85;
        box[104] = 8'h45; box[105] = 8'hF9; box[106] = 8'h02; box[107] = 8'h7F;
        box[108] = 8'h50; box[109] = 8'h3C; box[110] = 8'h9F; box[111] = 8'hA8;
        box[112] = 8'h51; box[113] = 8'hA3; box[114] = 8'h40; box[115] = 8'h8F;
        box[116] = 8'h92; box[117] = 8'h9D; box[118] = 8'h38; box[119] = 8'hF5;
        box[120] = 8'hBC; box[121] = 8'hB6; box[122] = 8'hDA; box[123] = 8'h21;
        box[124] = 8'h10; box[125] = 8'hFF; box[126] = 8'hF3; box[127] = 8'hD2;
        box[128] = 8'hCD; box[129] = 8'h0C; box[130] = 8'h13; box[131] = 8'hEC;
        box[132] = 8'h5F; box[133] = 8'h97; box[134] = 8'h44; box[135] = 8'h17;
        box[136] = 8'hC4; box[137] = 8'hA7; box[138] = 8'h7E; box[139] = 8'h3D;
        box[140] = 8'h64; box[141] = 8'h5D; box[142] = 8'h19; box[143] = 8'h73;
        box[144] = 8'h60; box[145] = 8'h81; box[146] = 8'h4F; box[147] = 8'hDC;
        box[148] = 8'h22; box[149] = 8'h2A; box[150] = 8'h90; box[151] = 8'h88;
        box[152] = 8'h46; box[153] = 8'hEE; box[154] = 8'hB8; box[155] = 8'h14;
        box[156] = 8'hDE;box[157] = 8'h5E; box[158] = 8'h0B; box[159] = 8'hDB;
        box[160] = 8'hE0; box[161] = 8'h32; box[162] = 8'h3A; box[163] = 8'h0A;
        box[164] = 8'h49; box[165] = 8'h06; box[166] = 8'h24; box[167] = 8'h5C;
        box[168] = 8'hC2; box[169] = 8'hD3; box[170] = 8'hAC; box[171] = 8'h62;
        box[172] = 8'h91; box[173] = 8'h95; box[174] = 8'hE4; box[175] = 8'h79;
        box[176] = 8'hE7; box[177] = 8'hC8; box[178] = 8'h37; box[179] = 8'h6D;
        box[180] = 8'h8D; box[181] = 8'hD5; box[182] = 8'h4E; box[183] = 8'hA9;
        box[184] = 8'h6C; box[185] = 8'h56; box[186] = 8'hF4; box[187] = 8'hEA;
        box[188] = 8'h65; box[189] = 8'h7A; box[190] = 8'hAE; box[191] = 8'h08;
        box[192] = 8'hBA; box[193] = 8'h78; box[194] = 8'h25; box[195] = 8'h2E;
        box[196] = 8'h1C; box[197] = 8'hA6; box[198] = 8'hB4; box[199] = 8'hC6;
        box[200] = 8'hE8; box[201] = 8'hDD; box[202] = 8'h74; box[203] = 8'h1F;
        box[204] = 8'h4B; box[205] = 8'hBD; box[206] = 8'h8B; box[207] = 8'h8A;
        box[208] = 8'h70; box[209] = 8'h3E; box[210] = 8'hB5; box[211] = 8'h66;
        box[212] = 8'h48; box[213] = 8'h03; box[214] = 8'hF6; box[215] = 8'h0E;
        box[216] = 8'h61; box[217] = 8'h35; box[218] = 8'h57; box[219] = 8'hB9;
        box[220] = 8'h86; box[221] = 8'hC1; box[222] = 8'h1D; box[223] = 8'h9E;
        box[224] = 8'hE1; box[225] = 8'hF8; box[226] = 8'h98; box[227] = 8'h11;
        box[228] = 8'h69; box[229] = 8'hD9; box[230] = 8'h8E; box[231] = 8'h94;
        box[232] = 8'h9B; box[233] = 8'h1E; box[234] = 8'h87; box[235] = 8'hE9;
        box[236] = 8'hCE; box[237] = 8'h55; box[238] = 8'h28; box[239] = 8'hDF;
        box[240] = 8'h8C; box[241] = 8'hA1; box[242] = 8'h89; box[243] = 8'h0D;
        box[244] = 8'hBF; box[245] = 8'hE6; box[246] = 8'h42; box[247] = 8'h68;
        box[248] = 8'h41; box[249] = 8'h99; box[250] = 8'h2D; box[251] = 8'h0F;
        box[252] = 8'hB0; box[253] = 8'h54; box[254] = 8'hBB; box[255] = 8'h16;
    end
      genvar i;
    // Assign output based on input
    for (i=31;i>=0;i=i-8) begin
        assign out_byte[i:i-7] = box[in_byte[i:i-7]];
    end
endmodule