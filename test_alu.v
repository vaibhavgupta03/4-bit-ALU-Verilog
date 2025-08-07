`timescale 1ns/1ns

module tb_alu;

reg [3:0] a, b;
reg [2:0] sel;
reg [2:0] step;
wire [3:0] result;
wire carry, zero;

alu uut (
    .a(a), .b(b), .sel(sel),
    .result(result),
    .carry(carry),
    .zero(zero)
);

initial begin
    $dumpfile("alu.vcd");
    $dumpvars(1, tb_alu);  // Only top-level signals for cleaner view

    $display("A    B    SEL | RESULT CARRY ZERO");
    $monitor("%b %b %b | %b     %b     %b", a, b, sel, result, carry, zero);

    step = 3'd0;

    a = 4'b0101; b = 4'b0011; sel = 3'b000; #5; step = step + 1; #5;
    a = 4'b0101; b = 4'b0011; sel = 3'b001; #5; step = step + 1; #5;
    a = 4'b0101; b = 4'b0011; sel = 3'b010; #5; step = step + 1; #5;
    a = 4'b0101; b = 4'b0011; sel = 3'b011; #5; step = step + 1; #5;
    a = 4'b0101; b = 4'b0011; sel = 3'b100; #5; step = step + 1; #5;
    a = 4'b0101; b = 4'b0000; sel = 3'b101; #5; step = step + 1; #5;
    a = 4'b0011; b = 4'b0000; sel = 3'b110; #5; step = step + 1; #5;
    a = 4'b1100; b = 4'b0000; sel = 3'b111; #5; step = step + 1; #5;

    $finish;
end

endmodule
