`include "level2/level3/countermod10.v"
`include "level2/level3/countermod6.v"
// Para teste local
// `include "level3/countermod10.v"
// `include "level3/countermod6.v"

module timer(output wire[3:0] minutes, tens_secs, secs,
             output reg       timer_done,
             input  wire[3:0] digit,
             input  wire      clearn, enable, loadn, CLK);  // 1Hz clock
             // Parado pelo magnetron quando o tempo acaba

    wire tc1;
    wire zero1;

    countermod10 seconds_counter(digit, loadn, clearn, CLK, enable, secs, tc1, zero1);

    wire tc2;
    wire zero2;

    countermod6 tens_secs_counter(secs, loadn, clearn, CLK, enable & zero1, tens_secs, tc2, zero2);

    wire tc3;
    wire zero3;

    countermod10 minutes_counter(tens_secs, loadn, clearn, CLK, enable & zero1 & zero2, minutes, tc3, zero3);

    always @(zero1 or zero2 or zero3) 
    begin
        timer_done = zero1 & zero2 & zero3; 
    end

endmodule