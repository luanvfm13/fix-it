var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

var _margem = 0.9; 
var _escala_w = (gui_w * _margem) / sprite_get_width(spr_tablet);
var _escala_h = (gui_h * _margem) / sprite_get_height(spr_tablet);
var _escala = min(_escala_w, _escala_h);

var _tab_w = sprite_get_width(spr_tablet) * _escala;
var _tab_h = sprite_get_height(spr_tablet) * _escala;
var _tab_x = (gui_w - _tab_w) / 2;
var _tab_y = (gui_h - _tab_h) / 2;

draw_sprite_ext(spr_tablet, 0, _tab_x, _tab_y, _escala, _escala, 0, c_white, 1);

//  ====-
var _tela_margem_x = 0.08;
var _tela_margem_y_topo = 0.10;
var _tela_margem_y_baixo = 0.10;

var _tela_x = _tab_x + _tab_w * _tela_margem_x;
var _tela_y = _tab_y + _tab_h * _tela_margem_y_topo;
var _tela_w = _tab_w * (1 - _tela_margem_x * 2);
var _tela_h = _tab_h * (1 - _tela_margem_y_topo - _tela_margem_y_baixo);
// =====-

draw_set_font(fnt_undertale);

if (estado == "escolhendo") {
    if (!instance_exists(problema_alvo)) exit;

    var _opcoes = problema_alvo.problem_data.opcoes;
    var _nome = problema_alvo.problem_data.nome;
    var _largura_texto = _tela_w - 20;

    draw_set_color(c_white);
    draw_text_ext(_tela_x + 10, _tela_y + 6, _nome, 20, _largura_texto);


    var _y_cursor = _tela_y + 6 + string_height_ext(_nome, 20, _largura_texto) + 16;

    for (var i = 0; i < array_length(ordem_opcoes); i++) {
		var _opcao = _opcoes[ordem_opcoes[i]]
        var _cor = (i == opcao_selecionada) ? c_green : c_white;
        draw_set_color(_cor);
		
        var _prefixo = (i == opcao_selecionada) ? "> " : "   ";
        var _texto_opcao = _prefixo + _opcao.texto;

        draw_text_ext(_tela_x + 10, _y_cursor, _texto_opcao, 20, _largura_texto);
       
        _y_cursor += string_height_ext(_texto_opcao, 20, _largura_texto) + 12;
    }

    draw_set_color(c_gray);
    draw_text(_tela_x + 10, _tela_y + _tela_h - 18, "[X] Cancelar");

} else if (estado == "resultado") {
    if (resultado == undefined) exit;

    var _largura_texto = _tela_w - 20;
    var _cor_coesao = c_red;
    if (resultado.coesao >= 100) _cor_coesao = c_lime;
    else if (resultado.coesao >= 50) _cor_coesao = c_yellow;
    else if (resultado.coesao >= 10) _cor_coesao = c_orange;

    draw_set_color(c_white);
    draw_text_ext(_tela_x + 10, _tela_y + 6, resultado.nome_problema, 20, _largura_texto);
    var _y_cursor = _tela_y + 6 + string_height_ext(resultado.nome_problema, 20, _largura_texto) + 16;

    draw_set_color(_cor_coesao);
    draw_text(_tela_x + 10, _y_cursor, "Coesão desta escolha: " + string(resultado.coesao) + "%");
    _y_cursor += 24;

    draw_set_color(c_white);
    draw_text(_tela_x + 10, _y_cursor, "Moedas ganhas: +" + string(resultado.moedas_ganhas));
    _y_cursor += 20;
    draw_text(_tela_x + 10, _y_cursor, "Total de moedas: " + string(global.moedas));
    _y_cursor += 30;

    draw_text_ext(_tela_x + 10, _y_cursor, resultado.explicacao, 18, _largura_texto);

    draw_set_color(c_gray);
    draw_text(_tela_x + 10, _tela_y + _tela_h - 18, "[E/Espaço] Continuar");
}

draw_set_color(c_white);