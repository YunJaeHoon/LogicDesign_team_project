module counter(rst, in_clk, q1, q2);
input in_clk, rst;
output reg[3:0] q1, q2;

reg[4:0] temp;
  
always@(posedge in_clk or negedge rst)
begin
	if(!rst)
	begin
		temp <= 0;
		q1 <= 0;
		q2 <= 0;
	end    
	else
	begin 
		if(temp == 23)
			temp <= 0;
		else
			temp <= temp + 1;
		q1 <= temp / 10;
		q2 <= temp % 10;
	end 
end

endmodule 
