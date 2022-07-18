module blinky #()
(

	input CLK_100,
	output reg LED,

);

	reg [26:0] clkctr;
	wire clk_slow = clkctr[26];

	reg clk;
	always @(posedge CLK_100) begin
		clk <= ~clk;
	end

	always @(posedge clk) begin
		clkctr <= clkctr + 1;
	end

	always @(posedge clk_slow) begin

		if (LED) LED <= 0; else LED <= 1;

	end

endmodule
