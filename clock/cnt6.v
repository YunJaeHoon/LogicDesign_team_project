module cnt6(rst, in_clk, out_clk, q);
input in_clk, rst;
output reg out_clk;
output reg[3:0] q;

reg[3:0] temp, temp2;
  
always@(posedge in_clk or negedge rst)
begin
	if(!rst)
	begin
		temp <= 0;
		q <= 0;    
	end    
	else
	begin 
		if(temp == 5)
			temp <= 0;
		else
			temp <= temp + 1;
		q <= temp;
	end 
end

always@(posedge in_clk or negedge rst)
begin
	if(!rst)
	begin
		temp2 <= 0;
		out_clk <= 0;    
	end    
	else
	begin
		temp2 <= temp2 + 1;
		if(temp2 == 2)
			temp2 <= 0;
		else if(temp2 == 0)
			out_clk <= ~out_clk;
	end 
end

endmodule 
