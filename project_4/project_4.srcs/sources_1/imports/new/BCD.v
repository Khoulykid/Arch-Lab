module BCD (
    input [6:0] SW,
    output reg [3:0] Hundreds,
    output reg [3:0] Tens,
    output reg [3:0] Ones
);
    integer i;
    always @(SW)
        begin
            //initialization
            Hundreds = 4'd0;
            Tens = 4'd0;
            Ones = 4'd0;
            
            for (i = 6; i >= 0 ; i = i-1 )
            begin
                if(Hundreds >= 5 )
                Hundreds = Hundreds + 3;
                if (Tens >= 5 )
                    Tens = Tens + 3;
                if (Ones >= 5)
                    Ones = Ones +3;
                //shift left one
                Hundreds = Hundreds << 1;
                Hundreds [0] = Tens [3];
                Tens = Tens << 1;
                Tens [0] = Ones[3];
                Ones = Ones << 1;
                Ones[0] = SW[i];
        end
    end
    
endmodule