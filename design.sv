module register (
  input logic [7:0] data,
  input logic enable,
  input logic clk,
  input logic rst_,
  output logic [7:0] out
);
  
  always_ff @(posedge clk or negedge rst_) begin
    if (!rst_)
      out <= 8'b0;
    else if (enable)
      out <= data;
  end
  
endmodule : register
  
    