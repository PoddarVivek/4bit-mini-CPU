`timescale 1ns/1ps
// Self-checking testbench: runs each instruction for one clock and compares A and B with the expected values.
module mini_cpu_tb;

    reg clk, reset;
    reg [7:0] instruction;
    wire [3:0] reg_a, reg_b;
    integer errors;

    mini_cpu uut (
        .clk(clk),
        .reset(reset),
        .instruction(instruction),
        .reg_a(reg_a),
        .reg_b(reg_b)
    );

    always #5 clk = ~clk;

    // Apply one instruction for one clock period, then compare the registers.
    task run(input [7:0] instr, input [3:0] exp_a, input [3:0] exp_b, input [255:0] name);
        begin
            instruction = instr;
            #10;
            if (reg_a === exp_a && reg_b === exp_b)
                $display("PASS  %0s  A=%0d B=%0d", name, reg_a, reg_b);
            else begin
                $display("FAIL  %0s  A=%0d B=%0d (expected A=%0d B=%0d)", name, reg_a, reg_b, exp_a, exp_b);
                errors = errors + 1;
            end
        end
    endtask

    initial begin
        clk = 0; reset = 1; instruction = 0; errors = 0;
        #10 reset = 0;

        run(8'b0000_0101, 5, 0,  "MOV A, 5");
        run(8'b0001_0011, 5, 3,  "MOV B, 3");
        run(8'b0010_0000, 8, 3,  "ADD A, B  (5 + 3)");
        run(8'b0011_0000, 5, 3,  "SUB A, B  (8 - 3)");
        run(8'b0100_0000, 1, 3,  "AND A, B  (5 & 3)");
        run(8'b0101_0000, 3, 3,  "OR  A, B  (1 | 3)");

        // 4-bit wraparound: 15 + 3 = 18, which wraps to 2.
        run(8'b0000_1111, 15, 3, "MOV A, 15");
        run(8'b0010_0000, 2, 3,  "ADD A, B  (wraps to 2)");

        // An undefined opcode must leave both registers unchanged.
        run(8'b1111_0000, 2, 3,  "undefined opcode");

        if (errors == 0) $display("ALL TESTS PASSED");
        else             $display("%0d TEST(S) FAILED", errors);
        $finish;
    end
endmodule
