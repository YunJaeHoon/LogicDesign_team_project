module clock(rst, clk, h10, h1, m10, m1, s10, s1);

input rst, clk;
output[6:0] h10, h1, m10, m1, s10, s1;

wire[3:0] digit0, digit1, digit2, digit3, digit4, digit5;
wire o_clk, clk1, clk2, clk3, clk4;
  
clk_dll u0(rst, clk, o_clk);
  
cnt10 u1(rst, o_clk, clk1, digit0);
cnt6 u2(rst, clk1, clk2, digit1);
cnt10 u3(rst, clk2, clk3, digit2);
cnt6 u4(rst, clk3, clk4, digit3);
counter u5(rst, clk4, digit5, digit4);
   
seg7 u6(digit0, s1);
seg7 u7(digit1, s10);
seg7 u8(digit2, m1);
seg7 u9(digit3, m10);
seg7 u10(digit4, h1);
seg7 u11(digit5, h10);

endmodule
