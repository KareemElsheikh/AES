module register (LdText,clk,Text_Bus,P_Text);
    input LdText;
    input clk;
    input [127:0] Text_Bus;
    output reg [127:0] P_Text;
    reg [127:0] temp;
    always @(posedge clk) 
    begin
        if (LdText) begin
            P_Text <= Text_Bus;
            temp   <= Text_Bus; 
        end
        else begin
            P_Text <= temp;
        end
    end
endmodule