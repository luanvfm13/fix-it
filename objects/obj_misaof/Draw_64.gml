var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

draw_set_alpha(0.85);
draw_set_color(c_black);
draw_rectangle(0, 0, gui_w, gui_h, false);
draw_set_alpha(1);

draw_set_font(fnt_undertale);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

var _media = (global.coesao_count > 0) ? (global.coesao_total / global.coesao_count) : 0;
var _cat = get_categoria_coesao(_media);
var _largura_bloco = min(gui_w - 64, 520);
var _y = max(24, gui_h / 2 - 180);
var _titulo = "FIM DE JOGO: TEMPO ESGOTADO";
var _cor_titulo = c_red;
var _epilogo = "O cronômetro zerou antes de resolver tudo. A equipe ainda precisa de ajuda; volte ao menu e tente outra estratégia.";

if (demitido) {
    _titulo = "FIM DE JOGO: DEMITIDO";
    _epilogo = "Uma decisão colocou os clientes em risco e a G.A.M.E.R encerrou seu contrato. O relatório ficou; dá para voltar e fazer diferente.";
} else if (venceu) {
    _cor_titulo = c_lime;
    if (!fim_campanha) {
        _titulo = "MISSÃO CONCLUÍDA!";
          _epilogo = "Relatório registrado. Volte à G.A.M.E.R. e fale com o gerente para seguir. Missões concluídas: " + string(global.missoes_concluidas) + "/" + string(global.missoes_total) + ".";
    } else if (_media >= 90) {
        _titulo = "FINAL: INOVAÇÃO CONECTADA";
        _epilogo = "A fila da lanchonete andou e o hospital voltou a rastrear seus insumos. As equipes têm processos que funcionam sem apagar incêndio a cada pedido. Wilson quer saber se isso desbloqueia conquista.";
    } else {
        _titulo = "FINAL: TRABALHO FEITO";
        _epilogo = "A lanchonete e o hospital voltaram a funcionar, embora algumas soluções ainda tenham pontas soltas. Dona já perguntou qual vai ser o próximo chamado.";
    }
}

draw_set_color(_cor_titulo);
draw_text(gui_w / 2, _y, _titulo);
_y += string_height(_titulo) + 20;

draw_set_color(_cat.cor);
draw_text(gui_w / 2, _y, _cat.titulo);
_y += string_height(_cat.titulo) + 8;

draw_set_color(c_white);
draw_text_ext(gui_w / 2, _y, _cat.texto, 18, _largura_bloco);
_y += string_height_ext(_cat.texto, 18, _largura_bloco) + 20;

draw_text(gui_w / 2, _y, "Coesão média: " + string(_media) + "%");
_y += 22;
draw_text(gui_w / 2, _y, "Moedas totais: " + string(global.moedas));
_y += 22;
if (global.scans_ultimo > 0) {
	draw_text(gui_w / 2, _y, "Número de vezes que o scanner foi utlizado: " 
	+ string(global.scans_ultimo) + " (-" + string(global.scans_custo_ultimo) + " moedas)");
	_y += 22;
}
_y += 8

draw_text_ext(gui_w / 2, _y, _epilogo, 18, _largura_bloco);
_y += string_height_ext(_epilogo, 18, _largura_bloco) + 28;

draw_set_color(c_gray);
var _instrucao = "[E / Enter / Espaço] Voltar ao menu";
if (fim_campanha) {
    _instrucao = "Voltando ao menu...";
} else if (venceu && !demitido) {
    _instrucao = "[E / Enter / Espaço] Voltar ao escritório";
}
draw_text(gui_w / 2, _y, _instrucao);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);