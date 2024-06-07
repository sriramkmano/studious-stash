module down_counter(

     input wire logic clk,
     input wire logic nrst,
     input wire logic gload,
     input wire logic divide_by_2,
     
     input wire logic  [7:0] preload_count,
     output logic      [7:0] count_out,
  	 
     output logic            zero
);

 always_ff @(posedge clk or negedge nrst)
  begin
    if(~nrst)
      //When reset in high since this is a down counter set all bits to high,
      //so we can start counting down after reset is deasserted
  		count_out <= 8'hFF;
 	 else if(load)
      //This is to load the counter with any arbitrary value and count down from that
  		count_out <= preload_count;
 	 else if(divide_by_2)
      //when ever this signal is high that count_out will be divided by 2
  		count_out <= count_out >> 1;
     else if (!zero)
  		count_out <= count_out - 1'b1;
  end

         assign zero = count_out == 0 ;

endmodule
