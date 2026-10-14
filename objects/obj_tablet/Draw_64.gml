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

if (estado == "diagnosticando") {
    if (!instance_exists(problema_alvo)) exit;

    var _dados_diagnostico = get_diagnostico_data(problema_alvo.problem_id);
    var _largura_texto = _tela_w - 20;
    draw_set_color(c_white);
    draw_text_ext(_tela_x + 10, _tela_y + 6, problema_alvo.problem_data.nome, 20, _largura_texto);

    var _y_cursor = _tela_y + 42;
    draw_set_color(c_aqua);
    draw_text(_tela_x + 10, _y_cursor, "Evidencias:");
    _y_cursor += 20;
    draw_set_color(c_white);

    var _pista_scanner = get_evidencia_texto(problema_alvo.problem_id, "scanner");
    var _pista_lupa = get_evidencia_texto(problema_alvo.problem_id, "lupa");
    draw_text_ext(_tela_x + 10, _y_cursor, "- " + _pista_scanner, 14, _largura_texto);
    _y_cursor += string_height_ext("- " + _pista_scanner, 14, _largura_texto) + 3;
    draw_text_ext(_tela_x + 10, _y_cursor, "- " + _pista_lupa, 14, _largura_texto);
    _y_cursor += string_height_ext("- " + _pista_lupa, 14, _largura_texto) + 10;

    draw_set_color(c_yellow);
    draw_text_ext(_tela_x + 10, _y_cursor, _dados_diagnostico.pergunta, 18, _largura_texto);
    _y_cursor += string_height_ext(_dados_diagnostico.pergunta, 18, _largura_texto) + 8;
    for (var i = 0; i < array_length(ordem_diagnosticos); i++) {
        var _texto_diagnostico = _dados_diagnostico.opcoes[ordem_diagnosticos[i]];
        var _prefixo = (i == diagnostico_selecionado) ? "> " : "  ";
        draw_set_color((i == diagnostico_selecionado) ? c_green : c_white);
        draw_text_ext(_tela_x + 10, _y_cursor, _prefixo + _texto_diagnostico, 16, _largura_texto);
        _y_cursor += string_height_ext(_prefixo + _texto_diagnostico, 16, _largura_texto) + 8;
    }

    draw_set_color(c_gray);
    draw_text(_tela_x + 10, _tela_y + _tela_h - 18, "[E/Enter] Confirmar diagnostico   [X] Cancelar");

} else if (estado == "escolhendo") {
    if (!instance_exists(problema_alvo)) exit;

    var _opcoes = problema_alvo.problem_data.opcoes;
    var _nome = problema_alvo.problem_data.nome;
    var _largura_texto = _tela_w - 20;

    draw_set_color(c_white);
    draw_text_ext(_tela_x + 10, _tela_y + 6, _nome, 20, _largura_texto);

    var _y_cursor = _tela_y + 6 + string_height_ext(_nome, 20, _largura_texto) + 16;
    draw_set_color(c_aqua);
    draw_text(_tela_x + 10, _y_cursor, "Pistas combinadas:");
    _y_cursor += 18;
    draw_set_color(c_white);

    var _pista_scanner = get_evidencia_texto(problema_alvo.problem_id, "scanner");
    var _pista_lupa = get_evidencia_texto(problema_alvo.problem_id, "lupa");
    draw_text_ext(_tela_x + 10, _y_cursor, "- " + _pista_scanner, 14, _largura_texto);
    _y_cursor += string_height_ext("- " + _pista_scanner, 14, _largura_texto) + 3;
    draw_text_ext(_tela_x + 10, _y_cursor, "- " + _pista_lupa, 14, _largura_texto);
    _y_cursor += string_height_ext("- " + _pista_lupa, 14, _largura_texto) + 8;

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

} else if (estado == "fluxo") {
    var _etapas_fluxo = ["Entrada", "Processamento", "Validacao", "Saida"];
    var _opcoes_fluxo;
    if (room == Hosp) {
        _opcoes_fluxo = [
            ["Anotacao em papel", "Planilha por ala", "Registro compartilhado"],
            ["Busca manual", "Conferencia por turno", "Rastreamento por lote"],
            ["Sem revisao", "Conferencia diaria", "Validar lote e validade"],
            ["Aviso verbal", "Atualizar quadro", "Alerta por ala"]
        ];
    } else {
        _opcoes_fluxo = [
            ["Registro no caixa", "Fila impressa", "Entrada compartilhada"],
            ["Preparo manual", "Fila de pedidos", "Despacho integrado"],
            ["Sem validacao", "Conferencia manual", "Validacao automatica"],
            ["Copia em papel", "Aviso a cozinha", "Sincronizar estoque"]
        ];
    }

    draw_set_color(c_white);
    draw_text_ext(_tela_x + 10, _tela_y + 8, "Editor de fluxo: conecte as etapas da solucao", 18, _tela_w - 20);
    var _y_fluxo = _tela_y + 48;
    for (var i = 0; i < array_length(_etapas_fluxo); i++) {
        var _cor_etapa = (i == fluxo_etapa) ? c_aqua : c_white;
        var _prefixo_etapa = (i == fluxo_etapa) ? "> " : "  ";
        draw_set_color(_cor_etapa);
        draw_text(_tela_x + 14, _y_fluxo, _prefixo_etapa + _etapas_fluxo[i] + ": " + _opcoes_fluxo[i][fluxo_escolhido[i]]);
        _y_fluxo += 28;
    }

    draw_set_color(c_gray);
    draw_text_ext(_tela_x + 10, _tela_y + _tela_h - 48, "[Esquerda/Direita] alterar   [E/Enter] confirmar etapa", 14, _tela_w - 20);
    draw_text(_tela_x + 10, _tela_y + _tela_h - 24, "[X/Esc] voltar para as solucoes");

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
    draw_text(_tela_x + 10, _y_cursor, resultado.diagnostico_correto
        ? "Diagnostico alinhado as evidencias."
        : "Diagnostico divergente: -20 pontos de coesao.");
    _y_cursor += 20;
    draw_text(_tela_x + 10, _y_cursor, "Investimento: " + string(resultado.custo) + " | Orcamento: " + string(resultado.orcamento));
    _y_cursor += 20;

    var _texto_simulacao;
    if (room == Hosp) {
        _texto_simulacao = "Inventario: busca " + string(resultado.fila_antes) + " -> " + string(resultado.fila_depois)
            + " min; itens localizados " + string(resultado.processados_antes) + " -> " + string(resultado.processados_depois)
            + "; divergencias " + string(resultado.falhas_antes) + " -> " + string(resultado.falhas_depois);
    } else {
        _texto_simulacao = "Simulacao (3 turnos): fila " + string(resultado.fila_antes) + " -> " + string(resultado.fila_depois)
            + "; pedidos processados " + string(resultado.processados_antes) + " -> " + string(resultado.processados_depois)
            + "; retrabalho " + string(resultado.falhas_antes) + " -> " + string(resultado.falhas_depois);
    }
    draw_text_ext(_tela_x + 10, _y_cursor, _texto_simulacao, 14, _largura_texto);
    _y_cursor += 34;

    draw_text(_tela_x + 10, _y_cursor, "Treinamento: " + string(resultado.treinamento) + "% | Resistencia: " + string(resultado.resistencia) + "%");
    _y_cursor += 20;
    if (resultado.pericia_integracao || resultado.pericia_operacao) {
        var _pericias = "Especializacoes: ";
        if (resultado.pericia_integracao) _pericias += "Integracao ";
        if (resultado.pericia_operacao) _pericias += "Operacao";
        draw_text(_tela_x + 10, _y_cursor, _pericias);
        _y_cursor += 20;
    }

    if (resultado.evento != "") {
        draw_set_color(c_yellow);
        draw_text_ext(_tela_x + 10, _y_cursor, resultado.evento, 14, _largura_texto);
        _y_cursor += 28;
    }

    if (resultado.tempo_delta != 0) {
        var _cor_tempo = (resultado.tempo_delta > 0) ? c_lime : c_red;
        var _sinal_tempo = (resultado.tempo_delta > 0) ? "+" : "";
        draw_set_color(_cor_tempo);
        draw_text(_tela_x + 10, _y_cursor, "Tempo: " + _sinal_tempo + string(resultado.tempo_delta) + " s");
        _y_cursor += 24;
    } else {
        _y_cursor += 10;
    }

    draw_set_color(c_white);
    draw_text_ext(_tela_x + 10, _y_cursor, resultado.explicacao, 18, _largura_texto);

    draw_set_color(c_gray);
    draw_text(_tela_x + 10, _tela_y + _tela_h - 18, "[E/Espaço] Continuar");
}

draw_set_color(c_white);