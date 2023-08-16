module DataPath (clk,sel1,ldText,sel2,ldKey,ldExpanded,ldTextAfterAddRoundKey,ldTextAfterSubBytes,ldTextAfterShiftRows,sel3,equ,less,gt,TextIn,CipherText,RoundKey);
    input clk,sel1,ldText,sel2,ldKey,ldExpanded,ldTextAfterAddRoundKey,ldTextAfterSubBytes,ldTextAfterShiftRows,sel3;
    input [127:0] TextIn;
    output reg [127:0] CipherText;
    output reg [127:0] RoundKey;
    output less,equ,gt;
    wire [127:0] TextBus,selText,plainText,keyBus,selectedKey,key,expandedkey,keyToRound,TextARound_A,TextARound_B,TextASubBytes_A,TextASubBytes_B,TextAShiftRows_A,TextAShiftRows_B,TextAMixCol;
    wire [6:0] Round;

    Mux M1(TextIn,sel1,TextBus,selText);
    register r1(ldText,clk,selText,plainText);
    Mux M2(keyBus,sel2,plainText,selectedKey);
    register r2(ldKey,clk,selectedKey,key);
    assign keyBus = expandedkey;
    Counter C1(clk,Round);
    CipherKey k1(key,Round,clk,ldKey,expandedkey);
    Comp co1 (Round,less,equ,gt);
    assign RoundKey = expandedkey;
    register r3(ldExpanded,clk,expandedkey,keyToRound);
    AddRoundKey A1(plainText,keyToRound,TextARound_A);
    register r4(ldTextAfterAddRoundKey,clk,TextARound_A,TextARound_B);
    SBox S1(TextARound_B,TextASubBytes_A);
    register r5(ldTextAfterSubBytes,clk,TextASubBytes_A,TextASubBytes_B);
    ShiftRows SR1(TextASubBytes_B,TextAShiftRows_A);
    register r6(ldTextAfterShiftRows,clk,TextAShiftRows_A,TextAShiftRows_B);
    MixColumns MC1(TextAShiftRows_B,TextAMixCol);
    Mux M3(TextAShiftRows_B,sel3,TextAMixCol,TextBus);
    assign CipherText = TextBus;
endmodule