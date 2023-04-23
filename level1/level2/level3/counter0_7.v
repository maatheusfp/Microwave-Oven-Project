module counter0_7 (
    input wire clk,
    input wire numpad_pressed,
    output reg out
);

reg [3:0]count; 
reg is_counting = 0; // Mantém o estado da conta

initial begin // Valor inicial
    out <= 0;
    count <= 0;
end

always @(posedge numpad_pressed) begin // ativo quando um número do teclado é pressionado
    if (count == 3'd0) begin
        is_counting = 1;
    end
end

always @(negedge numpad_pressed) begin // quando o numero do teclado é solto, contagem vai até 7. 
    if (count == 3'd7) begin
        is_counting = 0;
        count = 3'd0;
        out = 0;
    end
end

always @(posedge clk) begin 
    if (is_counting && count < 3'd7) begin
        count <= count + 1;
    end

    if (count == 3'd3) begin
        out <= 1;
    end
end


endmodule