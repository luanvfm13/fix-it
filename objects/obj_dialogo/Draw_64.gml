draw_set_font(fnt_undertale);

var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

var caixa_w = gui_w * 0.9;
var caixa_h = 110;
var caixa_x = (gui_w - caixa_w) / 2;
var caixa_y = gui_h - caixa_h - 20;

draw_set_color(c_black);
draw_set_alpha(1);
draw_rectangle(caixa_x, caixa_y, caixa_x + caixa_w, caixa_y + caixa_h, false);

draw_set_color(c_white);
draw_line_width(caixa_x, caixa_y, caixa_x + caixa_w, caixa_y, 3);
draw_line_width(caixa_x, caixa_y + caixa_h, caixa_x + caixa_w, caixa_y + caixa_h, 3);
draw_line_width(caixa_x, caixa_y, caixa_x, caixa_y + caixa_h, 3);
draw_line_width(caixa_x + caixa_w, caixa_y, caixa_x + caixa_w, caixa_y + caixa_h, 3);

var fala = dados_dialogo[$ no_atual];

if (array_length(fala.opcoes) > 0) {
    draw_set_color(c_white);
    draw_text(caixa_x + 20, caixa_y + 20, texto_exibido);
    
    if (texto_completo) {
        var pos_x = caixa_x + 30;
        var pos_y = caixa_y + 55;
        
        for (var i = 0; i < array_length(fala.opcoes); i++) {
            var offset_x = i * (caixa_w / 2);
            
            if (i == opcao_selecionada) {
                draw_set_color(c_yellow);
                draw_text(pos_x + offset_x, pos_y, fala.opcoes[i].texto);
                
                draw_set_color(c_red);
                draw_text(pos_x + offset_x - 15, pos_y, ">");
            } else {
                draw_set_color(c_white);
                draw_text(pos_x + offset_x, pos_y, fala.opcoes[i].texto);
            }
        }
    }
} 

else {
    draw_set_color(c_white);
    draw_text_ext(caixa_x + 20, caixa_y + 20, texto_exibido, 22, caixa_w - 40);
}