/*
Module Name: BCD to 7-segment Display (bcd_to_7seg.v)
Module Purpose: Converts 4-bit binary value to its 7-segment hexadecimal values
Input needed: 4-bit bcd (BCD value)
Output result: 7-bit seg and 3-bit an (7-segment value and segment to display)
*/

module bcd_to_7seg(
    input  [3:0] bcd,
    output reg [6:0] seg,
    output reg [3:0] an
);

always @(*) 
begin
    an <= 4'b0111;//Segment to display
    case (bcd)
        4'b0000: seg = 7'b1000000;//0
        4'b0001: seg = 7'b1111001;//1
        4'b0010: seg = 7'b0100100;//2
        4'b0011: seg = 7'b0110000;//3
        4'b0100: seg = 7'b0011001;//4
        4'b0101: seg = 7'b0010010;//5
        4'b0110: seg = 7'b0000010;//6
        4'b0111: seg = 7'b1111000;//7
        4'b1000: seg = 7'b0000000;//8
        4'b1001: seg = 7'b0010000;//9
        
        4'b1010: seg = 7'b0001000;//A
        4'b1011: seg = 7'b0000011;//b
        4'b1100: seg = 7'b1000110;//C
        4'b1101: seg = 7'b0100001;//d
        4'b1110: seg = 7'b0000110;//E
        4'b1111: seg = 7'b0001110;//F
        
        default: seg = 7'b1111111;//No Display
    endcase
end

endmodule

/*
Sample Constraint File for Spartan-7 FPGA Boolean


set_property -dict { PACKAGE_PIN V2 IOSTANDARD LVCMOS33 } [get_ports {bcd[0]}]
set_property -dict { PACKAGE_PIN U2 IOSTANDARD LVCMOS33 } [get_ports {bcd[1]}]
set_property -dict { PACKAGE_PIN U1 IOSTANDARD LVCMOS33 } [get_ports {bcd[2]}]
set_property -dict { PACKAGE_PIN T2 IOSTANDARD LVCMOS33 } [get_ports {bcd[3]}]

set_property -dict { PACKAGE_PIN D7 IOSTANDARD LVCMOS33 } [get_ports {seg[0]}]
set_property -dict { PACKAGE_PIN C5 IOSTANDARD LVCMOS33 } [get_ports {seg[1]}]
set_property -dict { PACKAGE_PIN A5 IOSTANDARD LVCMOS33 } [get_ports {seg[2]}]
set_property -dict { PACKAGE_PIN B7 IOSTANDARD LVCMOS33 } [get_ports {seg[3]}]
set_property -dict { PACKAGE_PIN A7 IOSTANDARD LVCMOS33 } [get_ports {seg[4]}]
set_property -dict { PACKAGE_PIN D6 IOSTANDARD LVCMOS33 } [get_ports {seg[5]}]
set_property -dict { PACKAGE_PIN B5 IOSTANDARD LVCMOS33 } [get_ports {seg[6]}]
set_property -dict { PACKAGE_PIN A6 IOSTANDARD LVCMOS33 } [get_ports {seg[7]}]


set_property -dict { PACKAGE_PIN D5 IOSTANDARD LVCMOS33 } [get_ports {an[0]}]
set_property -dict { PACKAGE_PIN C4 IOSTANDARD LVCMOS33 } [get_ports {an[1]}]
set_property -dict { PACKAGE_PIN C7 IOSTANDARD LVCMOS33 } [get_ports {an[2]}]
set_property -dict { PACKAGE_PIN A8 IOSTANDARD LVCMOS33 } [get_ports {an[3]}]
*/
