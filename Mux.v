module Mux (Text_in,sel_in,Cipher_Text,Text_Bus);
    input [127:0] Text_in;
    input sel_in;
    input [127:0] Cipher_Text;
    output reg [127:0] Text_Bus;

    assign Text_Bus = sel_in ? Cipher_Text : Text_in;

endmodule