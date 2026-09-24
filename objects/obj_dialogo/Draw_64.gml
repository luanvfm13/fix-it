draw_set_font(fnt_undertale);

var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

var caixa_w = gui_w * 0.9;
var caixa_h = 110;
var caixa_x = (gui_w - caixa_w) / 2;
var caixa_y = gui_h - caixa_h - 20;

draw_set_alpha(0.85);
draw_set_color(c_black);
draw_rectangle(caixa_x, caixa_y, caixa_x + caixa_w, caixa_y + caixa_h, false);

draw_set_alpha(1);
draw_set_color(c_white);
draw_line_width(caixa_x, caixa_y, caixa_x + caixa_w, caixa_y, 3);
draw_line_width(caixa_x, caixa_y + caixa_h, caixa_x + caixa_w, caixa_y + caixa_h, 3);
draw_line_width(caixa_x, caixa_y, caixa_x, caixa_y + caixa_h, 3);
draw_line_width(caixa_x + caixa_w, caixa_y, caixa_x + caixa_w, caixa_y + caixa_h, 3);

if (dados_dialogo == undefined) exit;
var fala = dados_dialogo[$ no_atual];
if (fala == undefined) exit;

draw_set_color(c_white);
draw_text_ext(caixa_x + 20, caixa_y + 16, texto_exibido, 22, caixa_w - 40);

var qtd_opcoes = array_length(fala.opcoes);

if (texto_completo) {
    if (qtd_opcoes > 0) {
        var pos_x = caixa_x + 30;
        var pos_y = caixa_y + caixa_h - (qtd_opcoes * 22) - 8;

        for (var i = 0; i < qtd_opcoes; i++) {
            var _y = pos_y + i * 22;

            if (i == opcao_selecionada) {
                draw_set_color(c_red);
                draw_text(pos_x - 15, _y, ">");
                draw_set_color(c_yellow);
            } else {
                draw_set_color(c_white);
            }
            draw_text(pos_x, _y, fala.opcoes[i].texto);
        }
    } else {
        draw_set_color(c_gray);
        draw_text(caixa_x + 20, caixa_y + caixa_h - 20, "[Espaço/Z] Continuar");
    }
}

draw_set_alpha(1);
draw_set_color(c_white);