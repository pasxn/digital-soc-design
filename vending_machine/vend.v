`timescale 1ps / 1ps

module vend (
  input   wire                clk,
  input   wire                reset,
  // vend siganals
  input   wire                button_pc,
  input   wire                button_hc,
  input   wire                button_cc,
  input   wire                token_in,
  input   wire                dispense_done,
  output  reg                 vend_busy,
  output  reg                 dispense,
  output  reg [2:0]           coffee_select,
  output  reg [7:0]           change_tokens
);

localparam  WAIT_VEND               = 4'd0;
localparam  TOKEN_ONE               = 4'd1;
localparam  TOKEN_TWO               = 4'd2;
localparam  TOKEN_THREE             = 4'd3;
localparam  PLAIN_COFFEE            = 4'd4;
localparam  PLAIN_COFFEE_CHANGE     = 4'd5;
localparam  HAZELNUT_COFFEE         = 4'd6;
localparam  HAZELNUT_COFFEE_CHANGE  = 4'd7;
localparam  COCONUT_COFFEE          = 4'd8;
localparam  COCONUT_COFFEE_CHANGE   = 4'd9;
localparam  NO_OPERATION            = 4'd10;

reg [7:0]   state             = WAIT_VEND;
reg [7:0]   num_tokens        = 0;

always @(posedge clk) begin
  if (reset) begin
    dispense            <= 0;
    coffee_select       <= 0;
    change_tokens       <= 0;
    vend_busy           <= 0;
    state               <= WAIT_VEND;
  end
  else begin
    case(state)
      WAIT_VEND: begin
        dispense            <= 0;
        coffee_select       <= 0;
        change_tokens       <= 0;
        vend_busy           <= 0;
        if(token_in) begin
          num_tokens  <= num_tokens + 1;
          state       <= TOKEN_ONE;
        end
        else if(button_pc | button_hc | button_cc | dispense_done) begin
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
      PLAIN_COFFEE: begin
        coffee_select <= 2'b01;
        dispense      <= 1;
        if(button_pc | button_hc | button_cc ) begin
          state <= PLAIN_COFFEE;
        end
        else if(token_in) begin
          state <= NO_OPERATION;
        end
        else if(dispense_done) begin
          dispense      <= 0;
          num_tokens    <= num_tokens - 1;
          state         <= PLAIN_COFFEE_CHANGE;
        end
      end
      PLAIN_COFFEE_CHANGE: begin
        if(button_pc | button_hc | button_cc | dispense_done | token_in) begin
          state       <= PLAIN_COFFEE_CHANGE;
        end
        vend_busy     <= 1;
        change_tokens <= num_tokens;
        num_tokens    <= 0;
        state         <= WAIT_VEND;
      end
      HAZELNUT_COFFEE: begin
        coffee_select <= 2'b10;
        dispense      <= 1;
        if(button_pc | button_hc | button_cc ) begin
          state <= HAZELNUT_COFFEE;
        end
        else if(token_in) begin
          state <= NO_OPERATION;
        end
        else if(dispense_done) begin
          dispense      <= 0;
          num_tokens    <= num_tokens - 2;
          state         <= HAZELNUT_COFFEE_CHANGE;
        end
      end
      HAZELNUT_COFFEE_CHANGE: begin
        if(button_pc | button_hc | button_cc | dispense_done | token_in) begin
          state       <= PLAIN_COFFEE_CHANGE;
        end
        vend_busy     <= 1;
        change_tokens <= num_tokens;
        num_tokens    <= 0;
        state         <= WAIT_VEND;
      end
      COCONUT_COFFEE: begin
        coffee_select <= 2'b11;
        dispense      <= 1;
        if(button_pc | button_hc| button_cc ) begin
          state <= COCONUT_COFFEE;
        end
        else if(token_in) begin
          state <= NO_OPERATION;
        end
        else if(dispense_done) begin
          dispense      <= 0;
          num_tokens    <= num_tokens - 3;
          state         <= COCONUT_COFFEE_CHANGE;
        end
      end
      COCONUT_COFFEE_CHANGE: begin
        if(button_pc | button_hc | button_cc | dispense_done | token_in) begin
          state       <= PLAIN_COFFEE_CHANGE;
        end
        vend_busy     <= 1;
        change_tokens <= num_tokens;
        num_tokens    <= 0;
        state         <= WAIT_VEND;
      end
      NO_OPERATION: begin
        if(token_in) begin
          num_tokens <= num_tokens + 1;
          state       <= NO_OPERATION;
        end
        else if(button_pc | button_hc | button_cc | dispense_done) begin
          change_tokens <= num_tokens;
          num_tokens    <= 0;
          state         <= WAIT_VEND;
        end
      end 
    endcase
  end
end

// dump waves
initial begin
  $dumpfile("vend.vcd");
  $dumpvars(1, vend);
end

endmodule

`default_nettype wire
