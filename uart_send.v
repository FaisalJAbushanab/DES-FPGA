module uart_send #(parameter BAUD_RATE = 115200,
                   parameter CLOCK_SPEED_MHZ = 50)
                  (input [63:0] data_byte, 
                  input start_send, 
                  input clk, reset,
                  output tx,
                  output ready);

        parameter integer CYCLES_WAIT = CLOCK_SPEED_MHZ * 1e6 / BAUD_RATE;

        parameter IDLE = 0;
        parameter START_BIT = 1;
        parameter END_BIT = 2;
        parameter DATA_BIT = 3;

        reg [2:0] state = IDLE;
        reg [15:0] cycle_count = 0;
        reg [3:0] bit_index = 0;
        reg [7:0] data;
		  reg [3:0] i = 0;
		  reg [7:0] myData [0:7];

        assign tx = state == IDLE ? 1 :
                    state == START_BIT ? 0 :
                    state == END_BIT ? 1 :
                    data[bit_index];

        assign ready = state == IDLE;

        always @(posedge clk) begin
				if(~reset) i <= 0;
				// this block is responsible for maniging counter and data
            if(state != IDLE) begin
						myData[7] <= data_byte[7:0];   myData[6] <= data_byte[15:8];  myData[5] <= data_byte[23:16]; myData[4] <= data_byte[31:24];
						myData[3] <= data_byte[39:32]; myData[2] <= data_byte[47:40]; myData[1] <= data_byte[55:48]; myData[0] <= data_byte[63:56];
                data <= myData[i];
                if(cycle_count == CYCLES_WAIT) cycle_count <= 0;
                else cycle_count <= cycle_count + 1;
				end
				// firstly the module would be in the idle state until start signal is high
            if(state == IDLE && start_send && (i <= 7)) begin
                state <= START_BIT; // change state to start bit
                cycle_count <= 0; // reset the counter
				// when in start bit state and the counter finish
            end else if(state == START_BIT && cycle_count == CYCLES_WAIT) begin
                state <= DATA_BIT;// change the state to data 
                bit_index <= 0; // set the bit index to 0
					 
				// when in the data bit and the cycle counter finishes 
            end else if(state == DATA_BIT && cycle_count == CYCLES_WAIT) begin
                if(bit_index == 7) state <= END_BIT; // if you reached the last bit move to the end bit state
                else bit_index <= bit_index + 1; // other wise increment the bit index and stay for another 16 cycles
				// if in end bit state and the counter finishes 
            end else if(state == END_BIT && cycle_count == CYCLES_WAIT) begin
					 i <= i + 1;
                state <= IDLE; // move to the idle state
            end
        end

endmodule


//module uart_send #(
//    parameter BAUD_RATE = 115200,
//    parameter CLOCK_SPEED_MHZ = 50
//) (
//    input [63:0] data_byte,
//    input start_send,
//    input clk,
//    output tx,
//    output ready
//);
//
//    parameter integer CYCLES_WAIT = CLOCK_SPEED_MHZ * 1e6 / BAUD_RATE;
//
//    parameter IDLE = 0;
//    parameter START_BIT = 1;
//    parameter END_BIT = 2;
//    parameter DATA_BIT = 3;
//
//    reg [2:0] state = IDLE;
//    reg [15:0] cycle_count = 0;
//    reg [6:0] bit_index = 0;
//	 reg [3:0] cBit = 0;
//    reg [7:0] data [7:0];
//    reg [63:0] remaining_data = 0;
//
//    assign tx = state == IDLE ? 1 :
//                state == START_BIT ? 0 :
//                state == END_BIT ? 1 :
//                data[bit_index][cBit];
//
//    assign ready = state == IDLE && remaining_data == 0;
//
//    always @(posedge clk) begin
//        if (state != IDLE) begin
//            if (cycle_count == CYCLES_WAIT) begin
//                cycle_count <= 0;
//					 if (cBit == 7) begin
//						if (bit_index == 7) begin
//                    bit_index <= 0;
//						end
//						else begin
//                    bit_index <= bit_index + 1;
//                end
//					 remaining_data <= remaining_data >> 8;
//					 cBit <= 0;
//					end else begin
//					cBit <= cBit +1;
//					end
//            end
//            else begin
//                cycle_count <= cycle_count + 1;
//            end
//        end
//
//        if (state != IDLE && cycle_count == CYCLES_WAIT) begin
//            data[bit_index] <= remaining_data[7:0];
//        end
//
//        if (state == IDLE && start_send) begin
//            state <= START_BIT;
//            cycle_count <= 0;
//            remaining_data <= data_byte;
//        end
//        else if (state == START_BIT && cycle_count == CYCLES_WAIT) begin
//            state <= DATA_BIT;
//        end
//        else if (state == DATA_BIT && cycle_count == CYCLES_WAIT) begin
//            if (bit_index == 7) begin
//                if (remaining_data != 0)
//                    state <= START_BIT;
//                else
//                    state <= END_BIT;
//            end
//        end
//        else if (state == END_BIT && cycle_count == CYCLES_WAIT) begin
//            state <= IDLE;
//        end
//    end
//
//endmodule
