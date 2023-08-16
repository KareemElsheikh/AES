module SBox(
    input [127:0] in_byte,
    output reg [127:0] out_byte
);

    // Declare s_box memory array
    reg [7:0] s_box[0:255];

    // Initialize s_box values
    initial begin
        s_box[0] = 8'h63; s_box[1] = 8'h7C; s_box[2] = 8'h77; s_box[3] = 8'h7B;
        s_box[4] = 8'hF2; s_box[5] = 8'h6B; s_box[6] = 8'h6F; s_box[7] = 8'hC5;
        s_box[8] = 8'h30; s_box[9] = 8'h01; s_box[10] = 8'h67; s_box[11] = 8'h2B;
        s_box[ 12] = 8'hFE; s_box[ 13] = 8'hD7; s_box[ 14] = 8'hAB; s_box[ 15] = 8'h76;
        s_box[ 16] = 8'hCA; s_box[ 17] = 8'h82; s_box[ 18] = 8'hC9; s_box[ 19] = 8'h7D;
        s_box[ 20] = 8'hFA; s_box[ 21] = 8'h59; s_box[ 22] = 8'h47; s_box[ 23] = 8'hF0;
        s_box[ 24] = 8'hAD; s_box[ 25] = 8'hD4; s_box[ 26] = 8'hA2; s_box[ 27] = 8'hAF;
        s_box[ 28] = 8'h9C; s_box[ 29] = 8'hA4; s_box[ 30] = 8'h72; s_box[ 31] = 8'hC0;
        s_box[ 32] = 8'hB7; s_box[ 33] = 8'hFD; s_box[ 34] = 8'h93; s_box[ 35] = 8'h26;
        s_box[ 36] = 8'h36; s_box[ 37] = 8'h3F; s_box[ 38] = 8'hF7; s_box[ 39] = 8'hCC;
        s_box[ 40] = 8'h34; s_box[ 41] = 8'hA5; s_box[ 42] = 8'hE5; s_box[ 43] = 8'hF1;
        s_box[ 44] = 8'h71; s_box[ 45] = 8'hD8; s_box[ 46] = 8'h31; s_box[ 47] = 8'h15;
        s_box[ 48] = 8'h04; s_box[ 49] = 8'hC7; s_box[ 50] = 8'h23; s_box[ 51] = 8'hC3;
        s_box[ 52] = 8'h18; s_box[ 53] = 8'h96; s_box[ 54] = 8'h05; s_box[ 55] = 8'h9A;
        s_box[ 56] = 8'h07; s_box[ 57] = 8'h12; s_box[ 58] = 8'h80; s_box[ 59] = 8'hE2;
        s_box[ 60] = 8'hEB; s_box[ 61] = 8'h27; s_box[ 62] = 8'hB2; s_box[ 63] = 8'h75;
        s_box[ 64] = 8'h09; s_box[ 65] = 8'h83; s_box[ 66] = 8'h2C; s_box[ 67] = 8'h1A;
        s_box[ 68] = 8'h1B; s_box[ 69] = 8'h6E; s_box[ 70] = 8'h5A; s_box[ 71] = 8'hA0;
        s_box[ 72] = 8'h52; s_box[ 73] = 8'h3B; s_box[ 74] = 8'hD6; s_box[ 75] = 8'hB3;
        s_box[ 76] = 8'h29; s_box[ 77] = 8'hE3; s_box[ 78] = 8'h2F; s_box[ 79] = 8'h84;
        s_box[ 80] = 8'h53; s_box[ 81] = 8'hD1; s_box[ 82] = 8'h00; s_box[ 83] = 8'hED;
        s_box[ 84] = 8'h20; s_box[ 85] = 8'hFC; s_box[ 86] = 8'hB1; s_box[ 87] = 8'h5B;
        s_box[ 88] = 8'h6A; s_box[ 89] = 8'hCB; s_box[ 90] = 8'hBE; s_box[ 91] = 8'h39;
        s_box[ 92] = 8'h4A; s_box[ 93] = 8'h4C; s_box[ 94] = 8'h58; s_box[ 95] = 8'hCF;
        s_box[ 96] = 8'hD0; s_box[ 97] = 8'hEF; s_box[ 98] = 8'hAA; s_box[ 99] = 8'hFB;
        s_box[100] = 8'h43; s_box[101] = 8'h4D; s_box[102] = 8'h33; s_box[103] = 8'h85;
        s_box[104] = 8'h45; s_box[105] = 8'hF9; s_box[106] = 8'h02; s_box[107] = 8'h7F;
        s_box[108] = 8'h50; s_box[109] = 8'h3C; s_box[110] = 8'h9F; s_box[111] = 8'hA8;
        s_box[112] = 8'h51; s_box[113] = 8'hA3; s_box[114] = 8'h40; s_box[115] = 8'h8F;
        s_box[116] = 8'h92; s_box[117] = 8'h9D; s_box[118] = 8'h38; s_box[119] = 8'hF5;
        s_box[120] = 8'hBC; s_box[121] = 8'hB6; s_box[122] = 8'hDA; s_box[123] = 8'h21;
        s_box[124] = 8'h10; s_box[125] = 8'hFF; s_box[126] = 8'hF3; s_box[127] = 8'hD2;
        s_box[128] = 8'hCD; s_box[129] = 8'h0C; s_box[130] = 8'h13; s_box[131] = 8'hEC;
        s_box[132] = 8'h5F; s_box[133] = 8'h97; s_box[134] = 8'h44; s_box[135] = 8'h17;
        s_box[136] = 8'hC4; s_box[137] = 8'hA7; s_box[138] = 8'h7E; s_box[139] = 8'h3D;
        s_box[140] = 8'h64; s_box[141] = 8'h5D; s_box[142] = 8'h19; s_box[143] = 8'h73;
        s_box[144] = 8'h60; s_box[145] = 8'h81; s_box[146] = 8'h4F; s_box[147] = 8'hDC;
        s_box[148] = 8'h22; s_box[149] = 8'h2A; s_box[150] = 8'h90; s_box[151] = 8'h88;
        s_box[152] = 8'h46; s_box[153] = 8'hEE; s_box[154] = 8'hB8; s_box[155] = 8'h14;
        s_box[156] = 8'hDE;s_box[157] = 8'h5E; s_box[158] = 8'h0B; s_box[159] = 8'hDB;
        s_box[160] = 8'hE0; s_box[161] = 8'h32; s_box[162] = 8'h3A; s_box[163] = 8'h0A;
        s_box[164] = 8'h49; s_box[165] = 8'h06; s_box[166] = 8'h24; s_box[167] = 8'h5C;
        s_box[168] = 8'hC2; s_box[169] = 8'hD3; s_box[170] = 8'hAC; s_box[171] = 8'h62;
        s_box[172] = 8'h91; s_box[173] = 8'h95; s_box[174] = 8'hE4; s_box[175] = 8'h79;
        s_box[176] = 8'hE7; s_box[177] = 8'hC8; s_box[178] = 8'h37; s_box[179] = 8'h6D;
        s_box[180] = 8'h8D; s_box[181] = 8'hD5; s_box[182] = 8'h4E; s_box[183] = 8'hA9;
        s_box[184] = 8'h6C; s_box[185] = 8'h56; s_box[186] = 8'hF4; s_box[187] = 8'hEA;
        s_box[188] = 8'h65; s_box[189] = 8'h7A; s_box[190] = 8'hAE; s_box[191] = 8'h08;
        s_box[192] = 8'hBA; s_box[193] = 8'h78; s_box[194] = 8'h25; s_box[195] = 8'h2E;
        s_box[196] = 8'h1C; s_box[197] = 8'hA6; s_box[198] = 8'hB4; s_box[199] = 8'hC6;
        s_box[200] = 8'hE8; s_box[201] = 8'hDD; s_box[202] = 8'h74; s_box[203] = 8'h1F;
        s_box[204] = 8'h4B; s_box[205] = 8'hBD; s_box[206] = 8'h8B; s_box[207] = 8'h8A;
        s_box[208] = 8'h70; s_box[209] = 8'h3E; s_box[210] = 8'hB5; s_box[211] = 8'h66;
        s_box[212] = 8'h48; s_box[213] = 8'h03; s_box[214] = 8'hF6; s_box[215] = 8'h0E;
        s_box[216] = 8'h61; s_box[217] = 8'h35; s_box[218] = 8'h57; s_box[219] = 8'hB9;
        s_box[220] = 8'h86; s_box[221] = 8'hC1; s_box[222] = 8'h1D; s_box[223] = 8'h9E;
        s_box[224] = 8'hE1; s_box[225] = 8'hF8; s_box[226] = 8'h98; s_box[227] = 8'h11;
        s_box[228] = 8'h69; s_box[229] = 8'hD9; s_box[230] = 8'h8E; s_box[231] = 8'h94;
        s_box[232] = 8'h9B; s_box[233] = 8'h1E; s_box[234] = 8'h87; s_box[235] = 8'hE9;
        s_box[236] = 8'hCE; s_box[237] = 8'h55; s_box[238] = 8'h28; s_box[239] = 8'hDF;
        s_box[240] = 8'h8C; s_box[241] = 8'hA1; s_box[242] = 8'h89; s_box[243] = 8'h0D;
        s_box[244] = 8'hBF; s_box[245] = 8'hE6; s_box[246] = 8'h42; s_box[247] = 8'h68;
        s_box[248] = 8'h41; s_box[249] = 8'h99; s_box[250] = 8'h2D; s_box[251] = 8'h0F;
        s_box[252] = 8'hB0; s_box[253] = 8'h54; s_box[254] = 8'hBB; s_box[255] = 8'h16;
    end


        genvar i;
    // Assign output based on input
    for (i=127;i>=0;i=i-8) begin
        assign out_byte[i:i-7] = s_box[in_byte[i:i-7]];
    end

endmodule

