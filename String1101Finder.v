module String1101Finder(
    input x,
    input clk,
    input clr,
    output reg out
);

reg [1:0] CS, NS;
parameter A = 2'b00, B = 2'b01, C = 2'b10, D = 2'b11;

always @(CS, x) begin
    case(CS)
        A: begin
            if(x == 0) begin
                NS = A;
                out = 1'b0;
            end else begin
                NS = B;
                out = 1'b0;
            end
        end
        
        B: begin
            if(x == 0) begin
                NS = A;
                out = 1'b0;
            end else begin
                NS = C;
                out = 1'b0;
            end
        end
        
        C: begin
            if(x == 0) begin
                NS = D;
                out = 1'b0;
            end else begin
                NS = C;
                out = 1'b0;
            end
        end
        
        D: begin
            if(x == 0) begin
                NS = A;
                out = 1'b0;
            end else begin
                NS = B;
                out = 1'b1;
            end
        end
        
        default: begin
            NS = A;
            out = 1'b0;
        end
    endcase
end

always @(posedge clk or negedge clr) begin
    if(clr == 0)
        CS <= A;
    else
        CS <= NS;
end

endmodule
