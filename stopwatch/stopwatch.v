module stopwatch(rst, clk, start_stop, m10, m1, s10, s1, s01, s001);

input rst, clk, start_stop;
output[6:0] m10, m1, s10, s1, s01, s001;

wire[3:0] digit0, digit1, digit2, digit3, digit4, digit5;
wire o_clk, clk1, clk2, clk3, clk4;
  
clk_dll u0(rst, clk, start_stop, o_clk);
  
cnt10 u1(rst, o_clk, clk1, digit0);
cnt10 u2(rst, clk1, clk2, digit1);
cnt10 u3(rst, clk2, clk3, digit2);
cnt6 u4(rst, clk3, clk4, digit3);
counter u5(rst, clk4, digit5, digit4);
   
seg7 u6(digit0, s001);
seg7 u7(digit1, s01);
seg7 u8(digit2, s1);
seg7 u9(digit3, s10);
seg7 u10(digit4, m1);
seg7 u11(digit5, m10);

endmodule
