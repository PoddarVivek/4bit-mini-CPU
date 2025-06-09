`timescale 1ns/1ps
module mini_cpu_tb;

    reg clk, reset;
    reg [7:0] instruction;
    wire [3:0] reg_a, reg_b;

    mini_cpu uut (
        .clk(clk),
        .reset(reset),
        .instruction(instruction),
        .reg_a(reg_a),
        .reg_b(reg_b)
    );

    always #5 clk = ~clk;

    initial begin
        $display("Start Mini CPU Test");
        clk = 0; reset = 1; instruction = 0;

        #10 reset = 0;

        // MOV A, 5
        instruction = 8'b0000_0101; #10;
        // MOV B, 3
        instruction = 8'b0001_0011; #10;
        // ADD A, B
        instruction = 8'b0010_0000; #10;
        // SUB A, B
        instruction = 8'b0011_0000; #10;
        // AND A, B
        instruction = 8'b0100_0000; #10;
        // OR A, B
        instruction = 8'b0101_0000; #10;

        #20;
        $display("Final A = %d, B = %d", reg_a, reg_b);
        $finish;
    end
endmodule
