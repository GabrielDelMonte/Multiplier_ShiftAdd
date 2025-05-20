module Counter (
	input Load, Clk,
	output K
);

	reg [2:0]count = 0;

	always @(posedge Clk, posedge Load) begin
		if (Load)
			count <= 3'b000;
		else
			count <= count + 1;
	end

	assign K = (count == 3'b110 & ~Load);

endmodule
