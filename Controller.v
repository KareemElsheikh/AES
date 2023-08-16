module Controller (clk,start,endstart,sel1,ldText,sel2,ldKey,ldExpanded,ldTextAfterAddRoundKey,ldTextAfterSubBytes,ldTextAfterShiftRows,sel3,less,gt,equ,done);
    input clk,start,less,gt,equ;
    output reg sel1,ldText,sel2,ldKey,ldExpanded,ldTextAfterAddRoundKey,ldTextAfterSubBytes,ldTextAfterShiftRows,sel3,done,endstart;

    reg [3:0] state;
    parameter s0=4'b0000, s1=4'b0001, s2=4'b0010, s3=4'b0011, s4=4'b0100, s5=4'b0101, s6=4'b0110, s7=4'b0111, s8=4'b1000, s9=4'b1001,s10=4'b1010,s11=4'b1011,s12=4'b1100;
    assign endstart = 1'b0;

    always @(posedge clk) begin
        case (state)
            s0: if (start && !endstart) begin
                state <= s1;
            end
            else begin
                state <= s0;
            end 
            s1: state <= s2;
            s2: state <= s3;
            s3: state <= s4;
            s4: state <= s5;
            s5: state <= s6;
            s6: state <= s7;
            s7: state <= s8;
            s8: state <= s9;
            s9: if (gt) begin
                state <= s12;
            end
            else begin
                state <= s10;
            end
            s10: state <= s11;
            s11: state <= s3;
            s12: state <= s12;
            default: state <= s0;
        endcase
    end


    always @(state) begin
        case (state)
            s0: begin
                ldText=0;ldKey=0;ldExpanded=0;ldTextAfterAddRoundKey=0;ldTextAfterSubBytes=0;ldTextAfterShiftRows=0; 
            end 
            s1: begin
                sel1=0;ldText=1;ldKey=0;ldExpanded=0;ldTextAfterAddRoundKey=0;ldTextAfterSubBytes=0;ldTextAfterShiftRows=0;
            end
            s2: begin
                sel2=1;ldText=0; ldKey=0;ldExpanded=0;ldTextAfterAddRoundKey=0;ldTextAfterSubBytes=0;ldTextAfterShiftRows=0;
            end
            s3: begin
                ldKey=1;ldExpanded=0;ldText=0;ldTextAfterAddRoundKey=0;ldTextAfterSubBytes=0;ldTextAfterShiftRows=0;
            end
            s4: begin
                ldText=0;ldKey=0;ldExpanded=1;ldTextAfterAddRoundKey=0;ldTextAfterSubBytes=0;ldTextAfterShiftRows=0;
            end
            s5: begin
                ldText=0;ldKey=0;ldExpanded=0;ldTextAfterAddRoundKey=1;ldTextAfterSubBytes=0;ldTextAfterShiftRows=0;
            end
            s6: begin
                ldText=0;ldKey=0;ldExpanded=0;ldTextAfterAddRoundKey=0;ldTextAfterSubBytes=1;ldTextAfterShiftRows=0;
            end
            s7: begin
                ldText=0;ldKey=0;ldExpanded=0;ldTextAfterAddRoundKey=0;ldTextAfterSubBytes=0;ldTextAfterShiftRows=1;
            end
            s8: begin
                if(equ) begin
                    sel3 =0;
                end
                else if(less)  begin   
                    sel3=1;
                end
                else if (gt) begin
                  ldKey=0;ldExpanded=0;ldTextAfterAddRoundKey=0;ldTextAfterSubBytes=0;ldTextAfterShiftRows=0;done=1;endstart=1;  
                end
            end
            s9: begin
                sel1=1;ldText=0;ldKey=0;ldExpanded=0;ldTextAfterAddRoundKey=0;ldTextAfterSubBytes=0;ldTextAfterShiftRows=0;
            end
            s10: begin
                ldText=1;ldKey=0;ldExpanded=0;ldTextAfterAddRoundKey=0;ldTextAfterSubBytes=0;ldTextAfterShiftRows=0;
            end
            s11: begin
                sel2=0; ldKey=0;ldExpanded=0;ldTextAfterAddRoundKey=0;ldTextAfterSubBytes=0;ldTextAfterShiftRows=0;
            end
            s12: begin
                ldKey=0;ldExpanded=0;ldTextAfterAddRoundKey=0;ldTextAfterSubBytes=0;ldTextAfterShiftRows=0;done=1;endstart=1;
            end
            default : begin
                ldKey=0;ldExpanded=0;ldTextAfterAddRoundKey=0;ldTextAfterSubBytes=0;ldTextAfterShiftRows=0;
            end
        endcase
    end
    
endmodule