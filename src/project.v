`default_nettype none

module tt_um_pwm_generator (
    input  wire [7:0] ui_in,    // Входы: ui_in[7:0] задают Duty Cycle
    output wire [7:0] uo_out,   // Выходы: uo_out[0] - ШИМ сигнал
    input  wire [7:0] uio_in,   // Двунаправленные входы
    output wire [7:0] uio_out,  // Двунаправленные выходы
    output wire [7:0] uio_oe,   // Направление UIO пинов
    input  wire       ena,      // Разрешение работы
    input  wire       clk,      // Тактовый сигнал
    input  wire       rst_n     // Сброс (активный 0)
);

    reg [7:0] counter;

    wire pwm_signal = (counter < ui_in);

    assign uo_out[0]   = pwm_signal;
    assign uo_out[7:1] = 7'b0;

    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            counter <= 8'b0;
        end else if (ena) begin
            counter <= counter + 1'b1;
        end
    end

endmodule
