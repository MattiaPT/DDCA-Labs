`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2023 12:36:34 PM
// Design Name: 
// Module Name: FMS_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FMS_test();
    
    // INPUTS
    reg left;
    reg right;
    reg [5:0] state_p;
    
    // OUTPUTS
    wire [5:0]	result;
    reg [5:0] state_n;
    
    // TEST CLOCK
    reg clk;  
    
    reg [13:0] testvec [0:4];

    reg [10:0] vec_cnt, err_cnt;
    
    // The test clock generation
    always				// process always triggers
    begin
        clk = 1; #50;		// clk is 1 for 50 ns
        clk = 0; #50;		// clk is 0 for 50 ns
    end					// generate a 100 ns clock
    
    
    initial
    begin
        // TO DO:
        // Read the content of the file testvectors_hex.txt into the
        // array testvec. The file contains values in hexadecimal format
        $readmemb("/home/mattia/Downloads/FSM_testvectors.txt", testvec);
        
        err_cnt = 0; // number of errors
        vec_cnt = 0; // number of vectors
    end
    
    // Tests
    always @ (posedge clk)		// trigger with the test clock
    begin
        // Wait 20 ns, so that we can safely apply the inputs
        #20;
        
        // Assign the signals from the testvec array
        {left,right,state_p,state_n} = testvec[vec_cnt];
        
        // Wait another 60ns after which we will be at 80ns
        #60;
        
        // Check if output is not what we expect to see
        if (result !== state_n)
        begin
            // Display message
            $display("Error at %5d ns: state_p %b left = %h right = %h", $time, state_p,left,right);	// %h displays hex
            $display("       %h (%h expected)",result,state_n);
            err_cnt = err_cnt + 1;																// increment error count
        end
        
        vec_cnt = vec_cnt + 1;																	// next vector
        
        // We use === so that we can also test for X
        if ((testvec[vec_cnt][13:10] === 4'bxxxx))
        begin
            // End of test, no more entries...
            $display ("%d tests completed with %d errors", vec_cnt, err_cnt);
            
            // Wait so that we can see the last result
            #20;
            
            // Terminate simulation
            $finish;
        end
    end

    Ford_Thunderbird UUT (left, right, state_p, result);
endmodule
