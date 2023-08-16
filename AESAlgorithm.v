module AESAlgorithm (originaltext,clk,start,Cipheredtext,Done,endstart);
    input [127:0] originaltext;
    input clk,start;
    output reg [127:0] Cipheredtext;
    output reg Done;
    output reg endstart;

wire [127:0] cipherTemp;
wire [127:0] RoundKey;
wire end_start;
 DataPath DP(clk,sel1,ldText,sel2,ldKey,ldExpanded,ldTextAfterAddRoundKey,ldTextAfterSubBytes,ldTextAfterShiftRows,sel3,equ,less,gt,originaltext,cipherTemp,RoundKey);
 Controller Con(clk,start,end_start,sel1,ldText,sel2,ldKey,ldExpanded,ldTextAfterAddRoundKey,ldTextAfterSubBytes,ldTextAfterShiftRows,sel3,less,gt,equ,done);
 assign Cipheredtext = cipherTemp;
 assign Done = done;
 assign endstart = end_start;
endmodule