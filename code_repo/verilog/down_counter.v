module down_counter(

     input clk,
     input nrst,
     input load,
     input divide_by_2,
  input      [3:0] count_in,
  output reg [3:0] count_out,
  	 output zero
);

  always@(posedge clk or negedge nrst)
 begin
   if(nrst & !load)
      //When reset in high since this is a down counter set all bits to high,
      //so we can start counting down after reset is deasserted
  		count_out <= 8'b1111_1111;
 	else if(load)
      //This is to load the counter with any arbitrary value and count down from that
  		count_out <= count_in;
 	else if(divide_by_2)
      //As specified in the question we can divide the count by 2 by using the right shift operator ">>"
      //when ever this signal is high that count_out will be divided by 2
  		count_out <= count_out >> 1;
   else if (!zero)
  		count_out <= count_out - 1'b1;
 end

         assign zero = count_out == 0 ;
endmodule
