module alu(
    input [3:0] a,
    input [3:0] b,
    input [2:0] sel,
    output reg [3:0] result,
    output reg carry,
    output reg zero
);

always @(*) begin
    carry = 0;
    case (sel)
        3'b000: result = a + b;                // Addition
        3'b001: result = a - b;                // Subtraction
        3'b010: result = a & b;                // AND
        3'b011: result = a | b;                // OR
        3'b100: result = a ^ b;                // XOR
        3'b101: result = ~a;                   // NOT A
        3'b110: result = a << 1;               // Shift left A
        3'b111: result = a >> 1;               // Shift right A
        default: result = 4'b0000;
    endcase
    carry = (sel == 3'b000 && (a + b) > 4'b1111) ? 1 : 0;
    zero = (result == 4'b0000) ? 1 : 0;
end

endmodule