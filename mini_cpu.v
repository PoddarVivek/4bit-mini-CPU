module mini_cpu (
    input clk,
    input reset,
    input [7:0] instruction,  // [7:4] opcode, [3:0] operand
    output [3:0] reg_a,
    output [3:0] reg_b
);
    reg [3:0] A, B;
    wire [3:0] alu_out;
    wire [3:0] operand = instruction[3:0];
    wire [3:0] opcode = instruction[7:4];

    alu alu1(.a(A), .b(B), .opcode(opcode), .result(alu_out));

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            A <= 4'd0;
            B <= 4'd0;
        end else begin
            case (opcode)
                4'b0000: A <= operand;            // MOV A, operand
                4'b0001: B <= operand;            // MOV B, operand
                4'b0010: A <= alu_out;            // ADD A, B
                4'b0011: A <= alu_out;            // SUB A, B
                4'b0100: A <= alu_out;            // AND A, B
                4'b0101: A <= alu_out;            // OR A, B
                default: A <= A;
            endcase
        end
    end

    assign reg_a = A;
    assign reg_b = B;
endmodule
