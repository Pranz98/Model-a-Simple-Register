mojavascript:void(0)dule register_test;
  
  logic [7:0] data;
  logic enable;
  logic clk;
  logic rst_;
  logic [7:0] out;
  
  register uut (
    .data(data),
    .enable(enable),
    .clk(clk),
    .rst_(rst_),
    .out(out)
  );
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  initial begin 
    // intialize Signals
    rst_ = 1;
    enable = 0;
    data = 8'h00;
    
    // Apply reset
    #10 rst_ = 0;
    #10 rst_ = 1;
    
    // Test Case 1: Hold reset
    #15;
    
    // Test Case 2 : Disable Enable
    enable = 0;
    data = 8'hAA;
    #10;
    
    // Test Case 3 : Enable enable
    enable = 1;
    data = 8'h55;
    #10;
    
    // Test Case 4 : Disable enable , data change
    
    enable = 0;
    data = 8'hFF;
    #10;
    
    // Test Case 5 ; Enable enable , data change 
    
    enable = 1;
    data = 8'h33;
    #10;
    
    // finish Simulation
    #10 $finish;
    
  end
  
  // Display Result
  
  initial begin
    $monitor ("time=%0t ns enable=%b rst_=%b data=%h out=%h", $time, enable, rst_, data, out);
  end
  
   // VCD dump
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, register_test);
    end
  
endmodule
    
    
    
    
    
    