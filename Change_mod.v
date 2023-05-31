`timescale 1ns/1ps

module change_mode(
  input wire reset,
  input change_mode_signal,
  output [2:0] mode
);

reg [2:0] current_mode;

always @ (change_mode_signal or posedge reset) begin
  if(reset)
    current_mode <= 3'b000;
  else begin
    case(current_mode)
      3'b000:
        if(change_mode_signal) begin
          current_mode <= 3'b001;
        end
      3'b001:
        if(change_mode_signal) begin
          current_mode <= 3'b010;
        end
      3'b010:
        if(change_mode_signal) begin
          current_mode <= 3'b000;
        end
      endcase
    end
  end

  assign mode = current_mode;
  endmodule

`timescale 1ns/1ps
module tb_change_mode();
  reg reset;
  reg change_mode_signal;
  wire [2:0] mode;

  change_mode dut (
    .reset(reset),
    .change_mode_signal(change_mode_signal),
    .mode(mode)
  );

  initial begin
    reset = 1'b1;
    change_mode_signal = 1'b0;

    #10 reset = 1'b0;
    
    #5 change_mode_signal = 1'b1;
    #5 change_mode_signal = 1'b0;

    #5 change_mode_signal = 1'b1;
    #5 change_mode_signal = 1'b0;

    #5 change_mode_signal = 1'b1;
    #5 change_mode_signal = 1'b0;

    #10 $finish;
  end

  always @(mode) begin
    $display("Mode: %b", mode);
  end
  endmodule
