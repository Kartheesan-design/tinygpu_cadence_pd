`default_nettype none
`timescale 1ns/1ns

module scheduler #(
    parameter THREADS_PER_BLOCK = 4
) (
    input wire clk,
    input wire reset,
    input wire start,
    
    // Control Signals
    input wire decoded_mem_read_enable,
    input wire decoded_mem_write_enable,
    input wire decoded_ret,

    // Memory Access State
    input wire [2:0] fetcher_state,
    input wire [1:0] lsu_state [THREADS_PER_BLOCK-1:0],

    // Current & Next PC
    output reg [7:0] current_pc,
    input wire [7:0] next_pc [THREADS_PER_BLOCK-1:0],

    // Execution State
    output reg [2:0] core_state,
    output reg done
);
    // State Definitions
    localparam IDLE    = 3'b000, 
               FETCH   = 3'b001,
               DECODE  = 3'b010,
               REQUEST = 3'b011,
               WAIT    = 3'b100,
               EXECUTE = 3'b101,
               UPDATE  = 3'b110,
               DONE    = 3'b111;
    
    // Temporary helper for the WAIT state logic
    logic any_lsu_waiting;

    always @(posedge clk) begin 
        if (reset) begin
            current_pc <= 0;
            core_state <= IDLE;
            done <= 0;
        end else begin 
            case (core_state)
                IDLE: begin
                    done <= 0;
                    if (start) begin 
                        core_state <= FETCH;
                    end
                end

                FETCH: begin 
                    // Move on once fetcher_state = FETCHED (assuming 3'b010 is the FETCHED state)
                    if (fetcher_state == 3'b010) begin 
                        core_state <= DECODE;
                    end
                end

                DECODE: begin
                    core_state <= REQUEST;
                end

                REQUEST: begin 
                    core_state <= WAIT;
                end

                WAIT: begin
                    // Combinatorial check within the clocked block
                    any_lsu_waiting = 1'b0;
                    for (int i = 0; i < THREADS_PER_BLOCK; i++) begin
                        if (lsu_state[i] == 2'b01 || lsu_state[i] == 2'b10) begin
                            any_lsu_waiting = 1'b1;
                        end
                    end

                    if (!any_lsu_waiting) begin
                        core_state <= EXECUTE;
                    end
                end

                EXECUTE: begin
                    core_state <= UPDATE;
                end

                UPDATE: begin 
                    if (decoded_ret) begin 
                        done <= 1;
                        core_state <= DONE;
                    end else begin 
                        current_pc <= next_pc[0]; // Simplified: assume all threads are in sync
                        core_state <= FETCH;
                    end
                end

                DONE: begin 
                    if (!start) core_state <= IDLE; // Return to IDLE once start is de-asserted
                end

                default: core_state <= IDLE;
            endcase
        end
    end
endmodule
