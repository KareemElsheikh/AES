module CipherKey (
    input [127:0] plaintext,
    input [6:0] Round,
    input clk,
    input ldKey,
    output reg [127:0] key
);
    wire [31:0] outRot;
    wire [31:0] outSBox;
    wire [31:0] Outaddconst; 

    RotFunc rotation(
        .word (plaintext[31:0]),
        .out(outRot)
    );

    aes_box Box1(
        .in_byte(outRot[31:24]),
        .out_byte(outSBox[31:24])
    );

    aes_box Box2(
        .in_byte(outRot[23:16]),
        .out_byte(outSBox[23:16])
    );

    aes_box Box3(
        .in_byte(outRot[15:8]),
        .out_byte(outSBox[15:8])
    );

    aes_box Box4(
        .in_byte(outRot[7:0]),
        .out_byte(outSBox[7:0])
    );
    
    AddConstants add1(Round,clk,ldKey,outSBox,Outaddconst);

    assign key[127:96]  = plaintext[127:96] ^ Outaddconst;
    assign key[95:64]   = key[127:96] ^ plaintext[95:64];
    assign key[63:32]   = key[95:64]  ^ plaintext[63:32];
    assign key[31:0]    = key[63:32]  ^ plaintext[31:0];
endmodule