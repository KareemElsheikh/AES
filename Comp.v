module Comp (Round,Less,Eq,Gt);
    input [6:0] Round;
    output Less,Eq,Gt;

    assign Less = Round < 90;
    assign   Eq = Round == 90;
    assign   Gt = Round > 90; 
    
endmodule