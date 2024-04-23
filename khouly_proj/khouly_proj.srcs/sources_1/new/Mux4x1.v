module Mux4x1 #(n = 2) (
    input wire [n-1:0] in0,
    input wire [n-1:0] in1,
    input wire [n-1:0] in2,
    input wire [n-1:0] in3,
    input wire [1:0] select,
    output wire [n-1:0] output
);

    assign output = (select == 2'b00) ? in0 :
                                    (select == 2'b01) ? in1 :
                                    (select == 2'b10) ? in2 :
                                    (select == 2'b11) ? in3 :
                                    0;

endmodule