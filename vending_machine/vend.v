`timescale 1ps / 1ps

module vend (
  input   wire                clk,
  input   wire                reset,
  // vend
  input   wire                button_pc,
  input   wire                button_hc,
  input   wire                button_cc,
  input   wire                token_in,
  input   wire                dispense_done,
  output  reg                 coffee_select_done,
  output  reg [2:0]           coffee_select
);

localparam  WAIT_VEND         = 3'd0;
localparam  TOKEN_ONE         = 3'd1;
localparam  TOKEN_TWO         = 3'd2;
localparam  TOKEN_THREE       = 3'd3;
localparam  PLAIN_COFFEE      = 3'd4;
localparam  HAZELNUT_COFFEE   = 3'd5;
localparam  COCONUT_COFFEE    = 3'd6;
localparam  DECODE_VAR        = 3'd7;

reg [7:0]   state             = WAIT_VEND;
reg [7:0]   num_tokens        = 0;

always @(posedge clk) begin
  if (reset) begin
    coffee_select_done  <= 0;
    coffee_select       <= 0
    state               <= WAIT_VEND;
  end
  else begin
    case(state)
      WAIT_VEND: begin
        coffee_select_done  <= 0;
        coffee_select       <= 0
        if(token_in) begin
          num_tokens  <= num_tokens + 1;
          state       <= TOKEN_ONE;
        end
        else if(button_pc | button_hc| button_cc | dispense_done) begin
          state   <= WAIT_VEND;
        end
      end
      TOKEN_ONE: begin
        if(token_in) begin
          num_tokens <= num_tokens + 1;
          state      <= TOKEN_TWO;
        end
        else if(button_pc) begin
          state <= PLAIN_COFFEE;
        end
        else if(button_hc | button_cc | dispense_done) begin
          state <= TOKEN_ONE;
        end
      end   
      TOKEN_TWO: begin
        if(token_in) begin
          num_tokens <= num_tokens + 1;
          state      <= TOKEN_THREE;
        end
        else if(button_pc) begin
          state <= PLAIN_COFFEE;
        end
        else if(button_hc) begin
          state <= HAZELNUT_COFFEE;
        end        
        else if(button_cc | dispense_done) begin
          state <= TOKEN_TWO;
        end
      end
      TOKEN_THREE: begin
        if(token_in) begin
          num_tokens <= num_tokens + 1;
          state      <= TOKEN_THREE;
        end
        else if(button_pc) begin
          state <= PLAIN_COFFEE;
        end
        else if(button_hc) begin
          state <= HAZELNUT_COFFEE;
        end
        else if(button_cc) begin
          state <= COCONUT_COFFEE;
        end             
        else if(dispense_done) begin
          state <= TOKEN_THREE;
        end
      end                  
      defualt: begin
        state <= WAIT_VEND;
      end
    endcase
  end
end

// Dump waves
`ifdef DEBUG
  initial begin
    $dumpfile("vend.vcd");
  end
`endif

endmodule

`default_nettype wire
