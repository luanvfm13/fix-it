
var cor_fundo    = make_color_rgb(10, 20, 24);
var cor_painel   = make_color_rgb(16, 32, 37);
var cor_borda    = make_color_rgb(44, 88, 96);
var cor_texto    = make_color_rgb(230, 238, 238);
var cor_suave    = make_color_rgb(140, 165, 168);
var cor_destaque = make_color_rgb(242, 201, 76);
var cor_bom      = make_color_rgb(123, 196, 127);
var cor_ruim     = make_color_rgb(224, 122, 95);
var _pal = { fundo: cor_fundo, destaque: cor_destaque, borda: cor_borda, suave: cor_suave };


var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();
var escala = min((gui_w * 0.9) / sprite_get_width(spr_tablet), (gui_h * 0.9) / sprite_get_height(spr_tablet));
var tablet_w = sprite_get_width(spr_tablet) * escala;
var tablet_h = sprite_get_height(spr_tablet) * escala;
var tablet_x = (gui_w - tablet_w) / 2;
var tablet_y = (gui_h - tablet_h) / 2;
draw_sprite_ext(spr_tablet, 0, tablet_x, tablet_y, escala, escala, 0, c_white, 1);

var tela_x = tablet_x + tablet_w * 0.08;
var tela_y = tablet_y + tablet_h * 0.10;
var tela_w = tablet_w * 0.84;
var tela_h = tablet_h * 0.80;

draw_set_font(fnt_undertale);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_set_alpha(0.96);
draw_set_color(cor_fundo);
draw_rectangle(tela_x, tela_y, tela_x + tela_w, tela_y + tela_h, false);
draw_set_alpha(1);


var _txt = function(_x, _y, _s, _w, _cor) {
    draw_set_color(_cor);
    draw_text_ext(_x, _y, _s, -1, _w);
    return string_height_ext(_s, -1, _w);
};

var _opcao = function(_x, _y, _s, _w, _sel, _p) {
    var _h = string_height_ext(_s, -1, _w - 24) + 12;
    if (_sel) {
        draw_set_color(_p.destaque);
        draw_rectangle(_x, _y, _x + _w, _y + _h, false);
        draw_set_color(_p.fundo);
    } else {
        draw_set_color(_p.borda);
        draw_rectangle(_x, _y, _x + _w, _y + _h, true);
        draw_set_color(_p.suave);
    }
    draw_text_ext(_x + 12, _y + 6, _s, -1, _w - 24);
    return _h;
};

var _pad = 14;
var _lh = 27;
var _gap = 8;
var _cx = tela_x + _pad;
var _cw = tela_w - _pad * 2;
var _rodape_y = tela_y + tela_h - _lh - 4;


var _idx = 0;
var _titulo = "DIAGNOSTICO";
switch (estado) {
    case "diagnosticando": _idx = 0; _titulo = "DIAGNOSTICO"; break;
    case "escolhendo":     _idx = 1; _titulo = "SOLUCAO";      break;
    case "fluxo":          _idx = 2; _titulo = "AUTOMACAO";    break;
    case "resultado":      _idx = 3; _titulo = "RESULTADO";    break;
}

var _y = tela_y + _pad;
draw_set_color(cor_texto);
draw_text(_cx, _y, "LANCHONETE  |  ETAPA " + string(_idx + 1) + "/4  " + _titulo);

var _seg = global.tempo_restante mod 60;
var _tempo = string(global.tempo_restante div 60) + ":" + ((_seg < 10) ? "0" : "") + string(_seg);
draw_set_halign(fa_right);
draw_set_color(global.tempo_restante <= 30 ? cor_ruim : cor_destaque);
draw_text(_cx + _cw, _y, _tempo);
draw_set_halign(fa_left);
_y += _lh;


var _sw = (_cw - 3 * 6) / 4;
for (var _i = 0; _i < 4; _i++) {
    draw_set_color((_i < _idx) ? cor_bom : ((_i == _idx) ? cor_destaque : cor_borda));
    draw_rectangle(_cx + _i * (_sw + 6), _y, _cx + _i * (_sw + 6) + _sw, _y + 6, false);
}
_y += 6 + _gap;


var _media = (global.coesao_count > 0) ? round(global.coesao_total / global.coesao_count) : 0;
draw_set_color(cor_suave);
draw_text(_cx, _y,
    "EFIC " + string(global.ind_eficiencia) + "%   CONF " + string(global.ind_confiabilidade)
    + "%   INTEG " + string(global.ind_integracao) + "%   |   ORC " + string(global.orcamento)
    + "   DIV " + string(global.divida_tecnica) + "   COESAO " + string(_media) + "%");
_y += _lh + 4;

draw_set_color(cor_borda);
draw_line(_cx, _y, _cx + _cw, _y);
_y += _gap;


var _by = _y;
var _bfim = _rodape_y - _gap;
var _lw = _cw * 0.34;
var _rx = _cx + _lw + 16;
var _rw = _cx + _cw - _rx;


draw_set_color(cor_painel);
draw_rectangle(_cx, _by, _cx + _lw, _bfim, false);
draw_set_color(cor_borda);
draw_rectangle(_cx, _by, _cx + _lw, _bfim, true);

var _lx = _cx + 8;
var _lpw = _lw - 16;
var _ly = _by + 8;

if (snap_id != "") {
    _ly += _txt(_lx, _ly, snap_nome, _lpw, cor_texto) + _gap;

    var _ferr = ["scanner", "lupa"];
    var _nomes_f = ["SCANNER", "LUPA"];
    for (var _j = 0; _j < 2; _j++) {
        var _ok = evidencia_coletada(snap_id, _ferr[_j]);
        draw_set_color(_ok ? cor_bom : cor_suave);
        draw_text(_lx, _ly, _nomes_f[_j] + (_ok ? "  OK" : "  PENDENTE"));
        _ly += _lh;

        if (_ok && estado == "diagnosticando") {
            _ly += _txt(_lx, _ly, get_evidencia_texto(snap_id, _ferr[_j]), _lpw, cor_suave) + _gap;
        }
    }


    if (estado == "escolhendo" && instance_exists(problema_alvo) && array_length(ordem_opcoes) > 0) {
        var _opt_atual = problema_alvo.problem_data.opcoes[ordem_opcoes[opcao_selecionada]];
        _ly += _gap;
        draw_set_color(cor_destaque);
        draw_text(_lx, _ly, "EFEITO PREVISTO");
        _ly += _lh;
        _txt(_lx, _ly, _opt_atual.explicacao, _lpw, cor_texto);
    }


    if (estado == "resultado" && resultado != undefined) {
        _ly += _gap;
        draw_set_color(cor_destaque);
        draw_text(_lx, _ly, "EFEITO");
        _ly += _lh;
        _txt(_lx, _ly, resultado.explicacao, _lpw, cor_texto);
    }
} else {
    _txt(_lx, _ly, "SEM PROBLEMA SELECIONADO", _lpw, cor_suave);
}


var _ry = _by + 8;

if (estado == "diagnosticando" && snap_id != "") {
    var _dg = get_diagnostico_data(snap_id);
    _ry += _txt(_rx, _ry, _dg.pergunta, _rw, cor_texto) + _gap + 4;
    for (var _k = 0; _k < array_length(ordem_diagnosticos); _k++) {
        var _txt_dg = string(_k + 1) + ". " + _dg.opcoes[ordem_diagnosticos[_k]];
        _ry += _opcao(_rx, _ry, _txt_dg, _rw, (_k == diagnostico_selecionado), _pal) + _gap;
    }

} else if (estado == "escolhendo" && instance_exists(problema_alvo) && array_length(ordem_opcoes) > 0) {
    var _opts = problema_alvo.problem_data.opcoes;
    for (var _k = 0; _k < array_length(ordem_opcoes); _k++) {
        var _txt_op = string(_k + 1) + ". " + _opts[ordem_opcoes[_k]].texto;
        _ry += _opcao(_rx, _ry, _txt_op, _rw, (_k == opcao_selecionada), _pal) + _gap;
    }

} else if (estado == "fluxo") {
    var _etapas = ["ENTRADA", "PROCESSAMENTO", "VALIDACAO", "SAIDA"];
    var _ops = [
        ["Registro no caixa", "Fila impressa", "Entrada compartilhada"],
        ["Preparo manual", "Fila de pedidos", "Despacho integrado"],
        ["Sem validacao", "Conferencia manual", "Validacao automatica"],
        ["Copia em papel", "Aviso a cozinha", "Sincronizar estoque"]
    ];
    for (var _e = 0; _e < 4; _e++) {
        var _sel = (_e == fluxo_etapa);
        var _status = (_e < fluxo_etapa) ? "OK" : (_sel ? "EDITANDO" : "PENDENTE");
        var _valor = _ops[_e][fluxo_escolhido[_e]];
        var _hb = _lh + string_height_ext(_valor, -1, _rw - 24) + 12;
        draw_set_color(_sel ? cor_destaque : cor_borda);
        draw_rectangle(_rx, _ry, _rx + _rw, _ry + _hb, true);
        draw_set_color(_sel ? cor_destaque : cor_suave);
        draw_text(_rx + 12, _ry + 6, _etapas[_e] + "  [" + _status + "]");
        _txt(_rx + 12, _ry + 6 + _lh, _sel ? ("< " + _valor + " >") : _valor, _rw - 24, _sel ? cor_texto : cor_suave);
        _ry += _hb + _gap;
    }

} else if (estado == "resultado" && resultado != undefined) {
    var _cc = (resultado.coesao >= 100) ? cor_bom : ((resultado.coesao >= 50) ? cor_destaque : cor_ruim);
    draw_set_color(_cc);
    draw_text(_rx, _ry, "COESAO  " + string(resultado.coesao) + "%");
    _ry += _lh;

    _ry += _txt(_rx, _ry, resultado.solucao, _rw, cor_texto) + _gap;

    var _metricas = [
        { rot: "Fila final",          a: resultado.fila_antes,           d: resultado.fila_depois,           suf: "",  menor: true  },
        { rot: "Pedidos processados", a: resultado.processados_antes,    d: resultado.processados_depois,    suf: "",  menor: false },
        { rot: "Retrabalho",          a: resultado.falhas_antes,         d: resultado.falhas_depois,         suf: "",  menor: true  },
        { rot: "Eficiencia",          a: resultado.eficiencia_antes,     d: resultado.eficiencia_depois,     suf: "%", menor: false },
        { rot: "Confiabilidade",      a: resultado.confiabilidade_antes, d: resultado.confiabilidade_depois, suf: "%", menor: false },
        { rot: "Integracao",          a: resultado.integracao_antes,     d: resultado.integracao_depois,     suf: "%", menor: false }
    ];
    for (var _m = 0; _m < array_length(_metricas); _m++) {
        var _mt = _metricas[_m];
        var _cm = cor_suave;
        if (_mt.d != _mt.a) {
            var _melhor = _mt.menor ? (_mt.d < _mt.a) : (_mt.d > _mt.a);
            _cm = _melhor ? cor_bom : cor_ruim;
        }
        draw_set_color(cor_suave);
        draw_text(_rx, _ry, _mt.rot);
        draw_set_halign(fa_right);
        draw_set_color(_cm);
        draw_text(_rx + _rw, _ry, string(_mt.a) + _mt.suf + " -> " + string(_mt.d) + _mt.suf);
        draw_set_halign(fa_left);
        _ry += _lh;
    }

    _ry += _gap;
    draw_set_color(cor_destaque);
    draw_text(_rx, _ry, "CUSTO " + string(resultado.custo) + "   ORCAMENTO " + string(resultado.orcamento));
}


var _rodape = "";
switch (estado) {
    case "diagnosticando": _rodape = "SETA: ESCOLHER   E: CONFIRMAR   X: FECHAR"; break;
    case "escolhendo":     _rodape = "SETA: ESCOLHER   E: PROJETAR   X: VOLTAR"; break;
    case "fluxo":          _rodape = "ESQ/DIR: ALTERAR   E: CONFIRMAR   X: VOLTAR"; break;
    case "resultado":      _rodape = "E / ENTER / ESPACO: FECHAR"; break;
}
draw_set_color(cor_suave);
draw_text(_cx, _rodape_y, _rodape);

draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);