module Mul2 (in_byte,out_byte);
    input [7:0] in_byte;
    output  reg [7:0] out_byte;

    // Declare Mul2 memory Mul2_Tableay
    reg [7:0] Mul2_Table [0:255];

initial begin
      Mul2_Table[0] = 8'h00; Mul2_Table[1] = 8'h02; Mul2_Table[2] = 8'h04; Mul2_Table[3] = 8'h06;
  Mul2_Table[4] = 8'h08; Mul2_Table[5] = 8'h0a; Mul2_Table[6] = 8'h0c; Mul2_Table[7] = 8'h0e;
  Mul2_Table[8] = 8'h10; Mul2_Table[9] = 8'h12; Mul2_Table[10] = 8'h14; Mul2_Table[11] = 8'h16;
  Mul2_Table[12] = 8'h18; Mul2_Table[13] = 8'h1a; Mul2_Table[14] = 8'h1c; Mul2_Table[15] = 8'h1e;
  Mul2_Table[16] = 8'h20; Mul2_Table[17] = 8'h22; Mul2_Table[18] = 8'h24; Mul2_Table[19] = 8'h26;
  Mul2_Table[20] = 8'h28; Mul2_Table[21] = 8'h2a; Mul2_Table[22] = 8'h2c; Mul2_Table[23] = 8'h2e;
  Mul2_Table[24] = 8'h30; Mul2_Table[25] = 8'h32; Mul2_Table[26] = 8'h34; Mul2_Table[27] = 8'h36;
  Mul2_Table[28] = 8'h38; Mul2_Table[29] = 8'h3a; Mul2_Table[30] = 8'h3c; Mul2_Table[31] = 8'h3e;
  Mul2_Table[32] = 8'h40; Mul2_Table[33] = 8'h42; Mul2_Table[34] = 8'h44; Mul2_Table[35] = 8'h46;
  Mul2_Table[36] = 8'h48; Mul2_Table[37] = 8'h4a; Mul2_Table[38] = 8'h4c; Mul2_Table[39] = 8'h4e;
  Mul2_Table[40] = 8'h50; Mul2_Table[41] = 8'h52; Mul2_Table[42] = 8'h54; Mul2_Table[43] = 8'h56;
  Mul2_Table[44] = 8'h58; Mul2_Table[45] = 8'h5a; Mul2_Table[46] = 8'h5c; Mul2_Table[47] = 8'h5e;
  Mul2_Table[48] = 8'h60; Mul2_Table[49] = 8'h62; Mul2_Table[50] = 8'h64; Mul2_Table[51] = 8'h66;
  Mul2_Table[52] = 8'h68; Mul2_Table[53] = 8'h6a; Mul2_Table[54] = 8'h6c; Mul2_Table[55] = 8'h6e;
  Mul2_Table[56] = 8'h70; Mul2_Table[57] = 8'h72; Mul2_Table[58] = 8'h74; Mul2_Table[59] = 8'h76;
  Mul2_Table[60] = 8'h78; Mul2_Table[61] = 8'h7a; Mul2_Table[62] = 8'h7c; Mul2_Table[63] = 8'h7e;
  Mul2_Table[64] = 8'h80; Mul2_Table[65] = 8'h82; Mul2_Table[66] = 8'h84; Mul2_Table[67] = 8'h86;
  Mul2_Table[68] = 8'h88; Mul2_Table[69] = 8'h8a; Mul2_Table[70] = 8'h8c; Mul2_Table[71] = 8'h8e;
  Mul2_Table[72] = 8'h90; Mul2_Table[73] = 8'h92; Mul2_Table[74] = 8'h94; Mul2_Table[75] = 8'h96;
  Mul2_Table[76] = 8'h98; Mul2_Table[77] = 8'h9a; Mul2_Table[78] = 8'h9c; Mul2_Table[79] = 8'h9e;
  Mul2_Table[80] = 8'ha0; Mul2_Table[81] = 8'ha2; Mul2_Table[82] = 8'ha4; Mul2_Table[83] = 8'ha6;
  Mul2_Table[84] = 8'ha8; Mul2_Table[85] = 8'haa; Mul2_Table[86] = 8'hac; Mul2_Table[87] = 8'hae;
  Mul2_Table[88] = 8'hb0; Mul2_Table[89] = 8'hb2; Mul2_Table[90] = 8'hb4; Mul2_Table[91] = 8'hb6;
  Mul2_Table[92] = 8'hb8; Mul2_Table[93] = 8'hba; Mul2_Table[94] = 8'hbc; Mul2_Table[95] = 8'hbe;
  Mul2_Table[96] = 8'hc0; Mul2_Table[97] = 8'hc2; Mul2_Table[98] = 8'hc4; Mul2_Table[99] = 8'hc6;
  Mul2_Table[100] = 8'hc8; Mul2_Table[101] = 8'hca; Mul2_Table[102] = 8'hcc; Mul2_Table[103] = 8'hce;
  Mul2_Table[104] = 8'hd0; Mul2_Table[105] = 8'hd2; Mul2_Table[106] = 8'hd4; Mul2_Table[107] = 8'hd6;
  Mul2_Table[108] = 8'hd8; Mul2_Table[109] = 8'hda; Mul2_Table[110] = 8'hdc; Mul2_Table[111] = 8'hde;
  Mul2_Table[112] = 8'he0; Mul2_Table[113] = 8'he2; Mul2_Table[114] = 8'he4; Mul2_Table[115] = 8'he6;
  Mul2_Table[116] = 8'he8; Mul2_Table[117] = 8'hea; Mul2_Table[118] = 8'hec; Mul2_Table[119] = 8'hee;
  Mul2_Table[120] = 8'hf0; Mul2_Table[121] = 8'hf2; Mul2_Table[122] = 8'hf4; Mul2_Table[123] = 8'hf6;
  Mul2_Table[124] = 8'hf8; Mul2_Table[125] = 8'hfa; Mul2_Table[126] = 8'hfc; Mul2_Table[127] = 8'hfe;
  Mul2_Table[128] = 8'h1b; Mul2_Table[129] = 8'h19; Mul2_Table[130] = 8'h1f; Mul2_Table[131] = 8'h1d;
  Mul2_Table[132] = 8'h13; Mul2_Table[133] = 8'h11; Mul2_Table[134] = 8'h17; Mul2_Table[135] = 8'h15;
  Mul2_Table[136] = 8'h0b; Mul2_Table[137] = 8'h09; Mul2_Table[138] = 8'h0f; Mul2_Table[139] = 8'h0d;
  Mul2_Table[140] = 8'h03; Mul2_Table[141] = 8'h01; Mul2_Table[142] = 8'h07; Mul2_Table[143] = 8'h05;
  Mul2_Table[144] = 8'h3b; Mul2_Table[145] = 8'h39; Mul2_Table[146] = 8'h3f; Mul2_Table[147] = 8'h3d;
  Mul2_Table[148] = 8'h33; Mul2_Table[149] = 8'h31; Mul2_Table[150] = 8'h37; Mul2_Table[151] = 8'h35;
  Mul2_Table[152] = 8'h2b; Mul2_Table[153] = 8'h29; Mul2_Table[154] = 8'h2f; Mul2_Table[155] = 8'h2d;
  Mul2_Table[156] = 8'h23; Mul2_Table[157] = 8'h21; Mul2_Table[158] = 8'h27; Mul2_Table[159] = 8'h25;
  Mul2_Table[160] = 8'h5b; Mul2_Table[161] = 8'h59; Mul2_Table[162] = 8'h5f; Mul2_Table[163] = 8'h5d;
  Mul2_Table[164] = 8'h53; Mul2_Table[165] = 8'h51; Mul2_Table[166] = 8'h57; Mul2_Table[167] = 8'h55;
  Mul2_Table[168] = 8'h4b; Mul2_Table[169] = 8'h49; Mul2_Table[170] = 8'h4f; Mul2_Table[171] = 8'h4d;
  Mul2_Table[172] = 8'h43; Mul2_Table[173] = 8'h41; Mul2_Table[174] = 8'h47; Mul2_Table[175] = 8'h45;
  Mul2_Table[176] = 8'h7b; Mul2_Table[177] = 8'h79; Mul2_Table[178] = 8'h7f; Mul2_Table[179] = 8'h7d;
  Mul2_Table[180] = 8'h73; Mul2_Table[181] = 8'h71; Mul2_Table[182] = 8'h77; Mul2_Table[183] = 8'h75;
  Mul2_Table[184] = 8'h6b; Mul2_Table[185] = 8'h69; Mul2_Table[186] = 8'h6f;  Mul2_Table[187] = 8'h6d; Mul2_Table[188] = 8'h63; Mul2_Table[189] = 8'h61; Mul2_Table[190] = 8'h67;
  Mul2_Table[191] = 8'h65; Mul2_Table[192] = 8'h9b; Mul2_Table[193] = 8'h99; Mul2_Table[194] = 8'h9f;
  Mul2_Table[195] = 8'hd9; Mul2_Table[196] = 8'h93; Mul2_Table[197] = 8'h91; Mul2_Table[198] = 8'h97;
  Mul2_Table[199] = 8'h95; Mul2_Table[200] = 8'h8b; Mul2_Table[201] = 8'h89; Mul2_Table[202] = 8'h8f;
  Mul2_Table[203] = 8'h8d; Mul2_Table[204] = 8'h83; Mul2_Table[205] = 8'h81; Mul2_Table[206] = 8'h87;
  Mul2_Table[207] = 8'h85; Mul2_Table[208] = 8'hbb; Mul2_Table[209] = 8'hb9; Mul2_Table[210] = 8'hbf;
  Mul2_Table[211] = 8'hbd; Mul2_Table[212] = 8'hb3; Mul2_Table[213] = 8'hb1; Mul2_Table[214] = 8'hb7;
  Mul2_Table[215] = 8'hb5; Mul2_Table[216] = 8'hab; Mul2_Table[217] = 8'ha9; Mul2_Table[218] = 8'haf;
  Mul2_Table[219] = 8'had; Mul2_Table[220] = 8'ha3; Mul2_Table[221] = 8'ha1; Mul2_Table[222] = 8'ha7;
  Mul2_Table[223] = 8'ha5; Mul2_Table[224] = 8'hdb; Mul2_Table[225] = 8'hd9; Mul2_Table[226] = 8'hdf;
  Mul2_Table[227] = 8'hdd; Mul2_Table[228] = 8'hd3; Mul2_Table[229] = 8'hd1; Mul2_Table[230] = 8'hd7;
  Mul2_Table[231] = 8'hd5; Mul2_Table[232] = 8'hcb; Mul2_Table[233] = 8'hc9; Mul2_Table[234] = 8'hcf;
  Mul2_Table[235] = 8'hcd; Mul2_Table[236] = 8'hc3; Mul2_Table[237] = 8'hc1; Mul2_Table[238] = 8'hc7;
  Mul2_Table[239] = 8'hc5; Mul2_Table[240] = 8'hfb; Mul2_Table[241] = 8'hf9; Mul2_Table[242] = 8'hff;
  Mul2_Table[243] = 8'hfd; Mul2_Table[244] = 8'hf3; Mul2_Table[245] = 8'hf1; Mul2_Table[246] = 8'hf7;
  Mul2_Table[247] = 8'hf5; Mul2_Table[248] = 8'heb; Mul2_Table[249] = 8'he9; Mul2_Table[250] = 8'hef;
  Mul2_Table[251] = 8'hed; Mul2_Table[252] = 8'he3; Mul2_Table[253] = 8'he1; Mul2_Table[254] = 8'he7;
  Mul2_Table[255] = 8'he5;
    end 

    assign out_byte = Mul2_Table[in_byte];
endmodule