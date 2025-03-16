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
            end else begin
                NS = B;
            end
        end
        
        B: begin
            if(x == 0) begin
                NS = A;
            end else begin
                NS = C;
            end
        end
        
        C: begin
            if(x == 0) begin
                NS = D;
            end else begin
                NS = C;
            end
        end
        
        D: begin
            if(x == 0) begin
                NS = A;
            end else begin
                NS = B;
            end
        end
        
        default: begin
            NS = A;
        end
    endcase
end

always @(posedge clk, negedge clr) begin
    if(clr == 0)
        CS <= A;
    else
        CS <= NS;
end

always @(posedge clk) begin
    if (CS == D && x == 1)
        out <= 1'b1;
    else 
        out <= 1'b0;
end
endmodule
