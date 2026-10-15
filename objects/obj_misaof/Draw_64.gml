var _gw = display_get_gui_width();
var _gh = display_get_gui_height();

draw_set_alpha(0.85);
draw_set_color(c_black);
draw_rectangle(0, 0, _gw, _gh, false);
draw_set_alpha(1);

draw_set_font(fnt_undertale);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var _cor_suave = make_color_rgb(143, 167, 170);
var _cor_texto = make_color_rgb(230, 238, 238);

var _media = (global.coesao_count > 0) ? (global.coesao_total / global.coesao_count) : 0;
var _cat = get_categoria_coesao(_media);

var _titulo = "FIM DE JOGO: TEMPO ESGOTADO";
var _cor_titulo = c_red;
var _epilogo = "O cronômetro zerou antes de resolver tudo. A equipe ainda precisa de ajuda; volte ao menu e tente outra estratégia.";
var _gerente = spr_gerente_deslike;

if (demitido) {
    _titulo = "FIM DE JOGO: DEMITIDO";
    _gerente = spr_gerente_demitido;
    if (global.motivo_demissao == "saldo") {
        _epilogo = "O caixa da G.A.M.E.R fechou no vermelho. As varreduras custam moedas e o seu desempenho não cobriu o uso do scanner. Seu contrato foi encerrado.";
    } else {
        _epilogo = "Uma decisão colocou os clientes em risco e a G.A.M.E.R encerrou seu contrato. O relatório ficou; dá para voltar e fazer diferente.";
    }
} else if (venceu) {
    _cor_titulo = c_lime;
    if (!fim_campanha) {
        _titulo = "MISSÃO CONCLUÍDA!";
        _gerente = spr_gerente_joinha;
        _epilogo = "Relatório registrado. Volte à G.A.M.E.R. e fale com o gerente para seguir. Missões concluídas: " + string(global.missoes_concluidas) + "/" + string(global.missoes_total) + ".";
    } else if (_media >= 90) {
        _titulo = "FINAL: INOVAÇÃO CONECTADA";
        _gerente = spr_gerente_palmas;
        _epilogo = "A fila da lanchonete andou e o hospital voltou a rastrear seus insumos. As equipes têm processos que funcionam sem apagar incêndio a cada pedido. Wilson quer saber se isso desbloqueia conquista.";
    } else if (_media >= 60) {
        _titulo = "FINAL: TRABALHO FEITO";
        _gerente = spr_gerente_joinha;
        _epilogo = "A lanchonete e o hospital voltaram a funcionar, embora algumas soluções ainda tenham pontas soltas. Dona já perguntou qual vai ser o próximo chamado.";
    } else {
        _titulo = "FINAL: SEM INTEGRAÇÃO";
        _cor_titulo = c_yellow;
        _gerente = spr_gerente_deslike;
        _epilogo = "As missões foram concluídas, mas as soluções deixaram muitas lacunas. O gerente espera mais integração e menos gambiarra na próxima vez.";
    }
}

var _pad = 28;
var _gap = 12;


var _col_w = min(_gw * 0.34, 300);
var _sw = sprite_get_width(_gerente);
var _sh = sprite_get_height(_gerente);
var _esc = min(_col_w / _sw, (_gh * 0.7) / _sh);
desenhar_sprite_topo(_gerente, _pad + (_col_w - _sw * _esc) / 2, (_gh - _sh * _esc) / 2, _esc);


var _rx = _pad + _col_w + 24;
var _rw = _gw - _rx - _pad;
var _y = _pad;

draw_set_color(_cor_titulo);
draw_text_ext(_rx, _y, _titulo, -1, _rw);
_y += string_height_ext(_titulo, -1, _rw) + _gap;

draw_set_color(_cat.cor);
draw_text_ext(_rx, _y, _cat.titulo, -1, _rw);
_y += string_height_ext(_cat.titulo, -1, _rw) + 4;

draw_set_color(_cor_texto);
draw_text_ext(_rx, _y, _cat.texto, -1, _rw);
_y += string_height_ext(_cat.texto, -1, _rw) + _gap * 2;

var _linhas = [
    "Coesão média: " + string(round(_media)) + "%",
    "Moedas: " + string(global.moedas),
    "Eficiência: " + string(global.metricas_missao_antes.eficiencia) + "% -> " + string(global.ind_eficiencia) + "%",
    "Confiabilidade: " + string(global.metricas_missao_antes.confiabilidade) + "% -> " + string(global.ind_confiabilidade) + "%",
    "Integração: " + string(global.metricas_missao_antes.integracao) + "% -> " + string(global.ind_integracao) + "%",
    "Orçamento: " + string(global.orcamento) + "   Dívida técnica: " + string(global.divida_tecnica)
];
if (global.scans_ultimo > 0) {
    array_push(_linhas, "Varreduras (última missão): " + string(global.scans_ultimo) + " | Custo: " + string(global.scans_custo_ultimo) + " moedas");
}
if (array_length(global.historico_eventos) > 0) {
    array_push(_linhas, "Falhas inesperadas: " + string(array_length(global.historico_eventos)));
}

draw_set_color(_cor_suave);
for (var i = 0; i < array_length(_linhas); i++) {
    draw_text_ext(_rx, _y, _linhas[i], -1, _rw);
    _y += string_height_ext(_linhas[i], -1, _rw);
}
_y += _gap * 2;

draw_set_color(_cor_texto);
draw_text_ext(_rx, _y, _epilogo, -1, _rw);
_y += string_height_ext(_epilogo, -1, _rw) + _gap * 2;

var _instrucao = "[E / Enter / Espaço] Voltar ao menu";
if (fim_campanha) {
    _instrucao = "Voltando ao menu...";
} else if (venceu && !demitido) {
    _instrucao = "[E / Enter / Espaço] Voltar ao escritório";
}
draw_set_color(c_gray);
draw_text_ext(_rx, _y, _instrucao, -1, _rw);

draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);