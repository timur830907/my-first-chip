`default_nettype none

module tt_um_pwm_generator (
    input  wire [7:0] ui_in,    // Duty cycle input
    output wire [7:0] uo_out,   // PWM output on uo_out[0]
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path
    input  wire       ena,      // always 1 when powered
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    reg [7:0] count;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            count <= 8'b0;
        end else begin
            count <= count + 1'b1;
        end
    end

    // ШИМ на uo_out[0]
    assign uo_out[0] = (count < ui_in);

    // Подвязываем остальное к нулю для precheck и OpenLane
    assign uo_out[7:1] = 7'b0000000;
    assign uio_out     = 8'b00000000;
    assign uio_oe      = 8'b00000000;

    wire _unused = &{ena, uio_in, 1'b0};

endmodule
