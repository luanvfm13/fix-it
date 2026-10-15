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
var cor_fundo = make_color_rgb(7, 15, 19);
var cor_painel = make_color_rgb(12, 24, 28);
var cor_borda = make_color_rgb(36, 96, 102);
var cor_texto = make_color_rgb(224, 236, 235);
var cor_suave = make_color_rgb(139, 164, 164);

draw_set_alpha(0.94);
draw_set_color(cor_fundo);
draw_rectangle(tela_x, tela_y, tela_x + tela_w, tela_y + tela_h, true);
draw_set_alpha(1);
draw_set_color(cor_borda);
draw_rectangle(tela_x, tela_y, tela_x + tela_w, tela_y + tela_h, false);
draw_set_font(fnt_undertale);

var nome_missao = (room == Hosp) ? "HOSPITAL" : "LANCHONETE";
var texto_tempo = string(global.tempo_restante div 60) + ":";
var segundos = global.tempo_restante mod 60;
if (segundos < 10) texto_tempo += "0";
texto_tempo += string(segundos);

var etapa_tela = 0;
var titulo_estado = "DIAGNOSTICO";
switch (estado) {
    case "diagnosticando":
        etapa_tela = 0;
        titulo_estado = "INVESTIGACAO E DIAGNOSTICO";
        break;
    case "escolhendo":
        etapa_tela = 1;
        titulo_estado = "ESCOLHA DA SOLUCAO";
        break;
    case "fluxo":
        etapa_tela = 2;
        titulo_estado = "PROJETO DA AUTOMACAO";
        break;
    case "resultado":
        etapa_tela = 3;
        titulo_estado = "RESULTADO DA SIMULACAO";
        break;
}

draw_set_color(c_aqua);
draw_text(tela_x + 14, tela_y + 8, "FIX-IT  /  PAINEL DE DIAGNOSTICO");
draw_set_color(cor_texto);
draw_text(tela_x + 14, tela_y + 29, nome_missao + "  -  " + titulo_estado);
draw_set_color(global.tempo_restante <= 30 ? c_red : c_yellow);
draw_text(tela_x + tela_w - 94, tela_y + 10, texto_tempo);

var largura_etapa = (tela_w - 28 - 18) / 4;
var nomes_etapas = ["DIAGNOSTICO", "SOLUCAO", "AUTOMACAO", "RESULTADOS"];
for (var i = 0; i < array_length(nomes_etapas); i++) {
    var etapa_x = tela_x + 14 + i * (largura_etapa + 6);
    var cor_etapa = (i < etapa_tela) ? c_lime : ((i == etapa_tela) ? c_aqua : cor_suave);
    draw_set_alpha((i == etapa_tela) ? 0.24 : 0.10);
    draw_set_color(cor_etapa);
    draw_rectangle(etapa_x, tela_y + 54, etapa_x + largura_etapa, tela_y + 78, true);
    draw_set_alpha(1);
    draw_set_color(cor_etapa);
    draw_rectangle(etapa_x, tela_y + 54, etapa_x + largura_etapa, tela_y + 78, false);
    draw_text(etapa_x + 8, tela_y + 59, nomes_etapas[i]);
}

var media_coesao = (global.coesao_count > 0)
    ? round(global.coesao_total / global.coesao_count)
    : 0;
var largura_indicador = (tela_w - 40) / 3;
var y_indicadores = tela_y + 88;
var nomes_indicadores = ["EFICIENCIA", "CONFIABILIDADE", "INTEGRACAO"];
var valores_indicadores = [global.ind_eficiencia, global.ind_confiabilidade, global.ind_integracao];

for (var i = 0; i < array_length(nomes_indicadores); i++) {
    var indicador_x = tela_x + 14 + i * (largura_indicador + 6);
    draw_set_color(cor_suave);
    draw_text(indicador_x, y_indicadores, nomes_indicadores[i]);
    draw_set_color(cor_texto);
    draw_text(indicador_x + largura_indicador - 42, y_indicadores, string(valores_indicadores[i]) + "%");
    draw_set_alpha(0.28);
    draw_set_color(cor_borda);
    draw_rectangle(indicador_x, y_indicadores + 19, indicador_x + largura_indicador - 10, y_indicadores + 25, true);
    draw_set_alpha(1);
    draw_set_color((valores_indicadores[i] >= 60) ? c_lime : c_aqua);
    draw_rectangle(indicador_x, y_indicadores + 19,
        indicador_x + (largura_indicador - 10) * clamp(valores_indicadores[i] / 100, 0, 1),
        y_indicadores + 25, true);
}

var y_resumo = tela_y + 119;
draw_set_color(cor_texto);
draw_text(tela_x + 14, y_resumo, "ORCAMENTO  " + string(global.orcamento));
draw_text(tela_x + 190, y_resumo, "DIVIDA  " + string(global.divida_tecnica));
draw_text(tela_x + 330, y_resumo, "COESAO MEDIA  " + string(media_coesao) + "%");
draw_set_color(cor_borda);
draw_line(tela_x + 12, tela_y + 145, tela_x + tela_w - 12, tela_y + 145);

var corpo_x = tela_x + 14;
var corpo_y = tela_y + 157;
var corpo_fim_y = tela_y + tela_h - 34;
var coluna_evidencias_w = tela_w * 0.29;
var coluna_conteudo_x = corpo_x + coluna_evidencias_w + 14;
var coluna_conteudo_w = tela_w - coluna_evidencias_w - 42;

draw_set_alpha(0.34);
draw_set_color(cor_painel);
draw_rectangle(corpo_x, corpo_y, corpo_x + coluna_evidencias_w, corpo_fim_y, true);
draw_set_alpha(1);
draw_set_color(cor_borda);
draw_rectangle(corpo_x, corpo_y, corpo_x + coluna_evidencias_w, corpo_fim_y, false);
draw_set_color(cor_borda);
draw_line(coluna_conteudo_x - 8, corpo_y, coluna_conteudo_x - 8, corpo_fim_y);

if (instance_exists(problema_alvo)) {
    draw_set_color(c_aqua);
    draw_text(corpo_x + 10, corpo_y + 9, "INVESTIGACAO");
    draw_set_color(cor_texto);
    draw_text_ext(corpo_x + 10, corpo_y + 32, problema_alvo.problem_data.nome, 16, coluna_evidencias_w - 20);

    var y_evidencia = corpo_y + 78;
    var ferramentas = ["scanner", "lupa"];
    var nomes_ferramentas = ["SCANNER", "LUPA"];
    for (var i = 0; i < array_length(ferramentas); i++) {
        var descoberta = evidencia_coletada(problema_alvo.problem_id, ferramentas[i]);
        draw_set_color(descoberta ? c_lime : cor_suave);
        draw_text(corpo_x + 10, y_evidencia, nomes_ferramentas[i] + (descoberta ? "  /  REGISTRADA" : "  /  NAO INVESTIGADA"));
        y_evidencia += 19;

        if (descoberta) {
            var texto_evidencia = get_evidencia_texto(problema_alvo.problem_id, ferramentas[i]);
            draw_set_color(cor_texto);
            draw_text_ext(corpo_x + 10, y_evidencia, texto_evidencia, 14, coluna_evidencias_w - 20);
            y_evidencia += string_height_ext(texto_evidencia, 14, coluna_evidencias_w - 20) + 14;
        } else {
            y_evidencia += 8;
        }
    }
} else {
    draw_set_color(cor_suave);
    draw_text(corpo_x + 10, corpo_y + 10, "SEM PROBLEMA SELECIONADO");
}

if (estado == "diagnosticando" && instance_exists(problema_alvo)) {
    var diagnostico = get_diagnostico_data(problema_alvo.problem_id);
    draw_set_color(cor_texto);
    draw_text_ext(coluna_conteudo_x, corpo_y + 9, diagnostico.pergunta, 18, coluna_conteudo_w);

    var y_opcao = corpo_y + 47;
    for (var i = 0; i < array_length(ordem_diagnosticos); i++) {
        var texto_opcao = diagnostico.opcoes[ordem_diagnosticos[i]];
        var altura_opcao = max(38, string_height_ext(texto_opcao, 16, coluna_conteudo_w - 32) + 14);
        var selecionada = (i == diagnostico_selecionado);

        if (selecionada) {
            draw_set_alpha(0.20);
            draw_set_color(c_aqua);
            draw_rectangle(coluna_conteudo_x, y_opcao, coluna_conteudo_x + coluna_conteudo_w, y_opcao + altura_opcao, true);
            draw_set_alpha(1);
        }
        draw_set_color(selecionada ? c_aqua : cor_borda);
        draw_rectangle(coluna_conteudo_x, y_opcao, coluna_conteudo_x + coluna_conteudo_w, y_opcao + altura_opcao, false);
        draw_set_color(selecionada ? cor_texto : cor_suave);
        draw_text_ext(coluna_conteudo_x + 12, y_opcao + 8,
            string(i + 1) + ". " + texto_opcao, 16, coluna_conteudo_w - 24);
        y_opcao += altura_opcao + 8;
    }
    draw_set_color(cor_suave);
    draw_text(coluna_conteudo_x, corpo_fim_y - 24, "SELECIONE UMA HIPOTESE; CONFIRME COM E");

} else if (estado == "escolhendo" && instance_exists(problema_alvo)) {
    var opcoes_solucao = problema_alvo.problem_data.opcoes;
    draw_set_color(cor_texto);
    draw_text(coluna_conteudo_x, corpo_y + 9, "SOLUCOES DISPONIVEIS");

    var y_solucao = corpo_y + 36;
    var altura_linha_solucao = min(54, max(38, (corpo_fim_y - corpo_y - 130) / array_length(ordem_opcoes)));
    for (var i = 0; i < array_length(ordem_opcoes); i++) {
        var opcao = opcoes_solucao[ordem_opcoes[i]];
        var selecionada = (i == opcao_selecionada);
        if (selecionada) {
            draw_set_alpha(0.20);
            draw_set_color(c_aqua);
            draw_rectangle(coluna_conteudo_x, y_solucao, coluna_conteudo_x + coluna_conteudo_w, y_solucao + altura_linha_solucao, true);
            draw_set_alpha(1);
        }
        draw_set_color(selecionada ? c_aqua : cor_borda);
        draw_rectangle(coluna_conteudo_x, y_solucao, coluna_conteudo_x + coluna_conteudo_w, y_solucao + altura_linha_solucao, false);
        draw_set_color(selecionada ? cor_texto : cor_suave);
        draw_text_ext(coluna_conteudo_x + 10, y_solucao + 5,
            string(i + 1) + ". " + opcao.texto, 14, coluna_conteudo_w - 20);
        y_solucao += altura_linha_solucao + 5;
    }

    var opcao_selecionada_real = opcoes_solucao[ordem_opcoes[opcao_selecionada]];
    draw_set_color(c_yellow);
    draw_text(coluna_conteudo_x, corpo_fim_y - 70, "EFEITO PREVISTO");
    draw_set_color(cor_texto);
    draw_text_ext(coluna_conteudo_x, corpo_fim_y - 48, opcao_selecionada_real.explicacao, 14, coluna_conteudo_w);
    draw_set_color(cor_suave);
    draw_text(coluna_conteudo_x, corpo_fim_y - 20, "E/ENTER: PROJETAR FLUXO   X: VOLTAR AO DIAGNOSTICO");

} else if (estado == "fluxo") {
    var etapas_fluxo = ["ENTRADA", "PROCESSAMENTO", "VALIDACAO", "SAIDA"];
    var opcoes_fluxo;
    if (room == Hosp) {
        opcoes_fluxo = [
            ["Anotacao em papel", "Planilha por ala", "Registro compartilhado"],
            ["Busca manual", "Conferencia por turno", "Rastreamento por lote"],
            ["Sem revisao", "Conferencia diaria", "Validar lote e validade"],
            ["Aviso verbal", "Atualizar quadro", "Alerta por ala"]
        ];
    } else {
        opcoes_fluxo = [
            ["Registro no caixa", "Fila impressa", "Entrada compartilhada"],
            ["Preparo manual", "Fila de pedidos", "Despacho integrado"],
            ["Sem validacao", "Conferencia manual", "Validacao automatica"],
            ["Copia em papel", "Aviso a cozinha", "Sincronizar estoque"]
        ];
    }

    draw_set_color(cor_texto);
    draw_text(coluna_conteudo_x, corpo_y + 9, "CONFIGURE CADA ETAPA DO PROCESSO");
    var largura_bloco = (coluna_conteudo_w - 36) / 4;
    var x_bloco = coluna_conteudo_x;
    for (var i = 0; i < array_length(etapas_fluxo); i++) {
        var bloco_atual = (i == fluxo_etapa);
        var bloco_concluido = (i < fluxo_etapa);
        var cor_bloco = bloco_atual ? c_aqua : (bloco_concluido ? c_lime : cor_borda);
        var texto_escolha = opcoes_fluxo[i][fluxo_escolhido[i]];

        draw_set_alpha(bloco_atual ? 0.20 : 0.10);
        draw_set_color(cor_bloco);
        draw_rectangle(x_bloco, corpo_y + 52, x_bloco + largura_bloco, corpo_y + 194, true);
        draw_set_alpha(1);
        draw_set_color(cor_bloco);
        draw_rectangle(x_bloco, corpo_y + 52, x_bloco + largura_bloco, corpo_y + 194, false);
        draw_text_ext(x_bloco + 8, corpo_y + 62, etapas_fluxo[i], 14, largura_bloco - 16);
        draw_set_color(cor_texto);
        draw_text_ext(x_bloco + 8, corpo_y + 94, texto_escolha, 14, largura_bloco - 16);
        draw_set_color(bloco_concluido ? c_lime : cor_suave);
        draw_text(x_bloco + 8, corpo_y + 169, bloco_concluido ? "CONCLUIDA" : (bloco_atual ? "EDITANDO" : "PENDENTE"));

        if (i < array_length(etapas_fluxo) - 1) {
            draw_set_color(cor_borda);
            draw_line(x_bloco + largura_bloco, corpo_y + 123, x_bloco + largura_bloco + 10, corpo_y + 123);
        }
        x_bloco += largura_bloco + 12;
    }
    draw_set_color(cor_suave);
    draw_text(coluna_conteudo_x, corpo_fim_y - 24, "ESQUERDA/DIREITA: ALTERAR   E/ENTER: CONFIRMAR ETAPA   X: VOLTAR");

} else if (estado == "resultado" && resultado != undefined) {
    draw_set_color(cor_texto);
    draw_text(coluna_conteudo_x, corpo_y + 8, resultado.nome_problema);
    var cor_coesao = c_red;
    if (resultado.coesao >= 100) cor_coesao = c_lime;
    else if (resultado.coesao >= 50) cor_coesao = c_yellow;
    else if (resultado.coesao >= 10) cor_coesao = c_orange;
    draw_set_color(cor_coesao);
    draw_text(coluna_conteudo_x, corpo_y + 30, "COESAO  " + string(resultado.coesao) + "%");
    draw_set_color(cor_suave);
    draw_text(coluna_conteudo_x, corpo_y + 46, "SOLUCAO APLICADA");
    draw_set_color(cor_texto);
    draw_text_ext(coluna_conteudo_x, corpo_y + 64, resultado.solucao, 14, coluna_conteudo_w);

    var titulo_medida = (room == Hosp) ? "INVENTARIO" : "OPERACAO";
    var antes_1 = (room == Hosp) ? "Busca (min)" : "Fila final";
    var antes_2 = (room == Hosp) ? "Itens localizados" : "Pedidos processados";
    var antes_3 = (room == Hosp) ? "Divergencias" : "Retrabalho";
    draw_set_color(c_aqua);
    draw_text(coluna_conteudo_x, corpo_y + 96, titulo_medida + "  /  ANTES -> DEPOIS");

    var cor_fila = (resultado.fila_depois < resultado.fila_antes)
        ? c_lime
        : ((resultado.fila_depois > resultado.fila_antes) ? c_red : cor_suave);
    draw_set_color(cor_texto);
    draw_text(coluna_conteudo_x, corpo_y + 118, antes_1 + ":");
    draw_set_color(cor_fila);
    draw_text(coluna_conteudo_x + 150, corpo_y + 118,
        string(resultado.fila_antes) + " -> " + string(resultado.fila_depois));

    var cor_processados = (resultado.processados_depois > resultado.processados_antes)
        ? c_lime
        : ((resultado.processados_depois < resultado.processados_antes) ? c_red : cor_suave);
    draw_set_color(cor_texto);
    draw_text(coluna_conteudo_x, corpo_y + 139, antes_2 + ":");
    draw_set_color(cor_processados);
    draw_text(coluna_conteudo_x + 150, corpo_y + 139,
        string(resultado.processados_antes) + " -> " + string(resultado.processados_depois));

    var cor_falhas = (resultado.falhas_depois < resultado.falhas_antes)
        ? c_lime
        : ((resultado.falhas_depois > resultado.falhas_antes) ? c_red : cor_suave);
    draw_set_color(cor_texto);
    draw_text(coluna_conteudo_x, corpo_y + 160, antes_3 + ":");
    draw_set_color(cor_falhas);
    draw_text(coluna_conteudo_x + 150, corpo_y + 160,
        string(resultado.falhas_antes) + " -> " + string(resultado.falhas_depois));

    draw_set_color(c_aqua);
    draw_text(coluna_conteudo_x, corpo_y + 190, "INDICADORES  /  ANTES -> DEPOIS");
    draw_set_color(cor_texto);
    var cor_eficiencia = (resultado.eficiencia_depois > resultado.eficiencia_antes)
        ? c_lime
        : ((resultado.eficiencia_depois < resultado.eficiencia_antes) ? c_red : cor_suave);
    draw_text(coluna_conteudo_x, corpo_y + 212, "Eficiencia");
    draw_set_color(cor_eficiencia);
    draw_text(coluna_conteudo_x + 150, corpo_y + 212,
        string(resultado.eficiencia_antes) + "% -> " + string(resultado.eficiencia_depois) + "%");

    var cor_confiabilidade = (resultado.confiabilidade_depois > resultado.confiabilidade_antes)
        ? c_lime
        : ((resultado.confiabilidade_depois < resultado.confiabilidade_antes) ? c_red : cor_suave);
    draw_set_color(cor_texto);
    draw_text(coluna_conteudo_x, corpo_y + 233, "Confiabilidade");
    draw_set_color(cor_confiabilidade);
    draw_text(coluna_conteudo_x + 150, corpo_y + 233,
        string(resultado.confiabilidade_antes) + "% -> " + string(resultado.confiabilidade_depois) + "%");

    var cor_integracao = (resultado.integracao_depois > resultado.integracao_antes)
        ? c_lime
        : ((resultado.integracao_depois < resultado.integracao_antes) ? c_red : cor_suave);
    draw_set_color(cor_texto);
    draw_text(coluna_conteudo_x, corpo_y + 254, "Integracao");
    draw_set_color(cor_integracao);
    draw_text(coluna_conteudo_x + 150, corpo_y + 254,
        string(resultado.integracao_antes) + "% -> " + string(resultado.integracao_depois) + "%");

    draw_set_color(c_yellow);
    draw_text(coluna_conteudo_x, corpo_y + 282,
        "CUSTO " + string(resultado.custo) + "  /  ORCAMENTO RESTANTE " + string(resultado.orcamento));
    draw_set_color(cor_texto);
    draw_text_ext(coluna_conteudo_x, corpo_y + 306, resultado.explicacao, 14, coluna_conteudo_w);
}

draw_set_color(cor_suave);
if (estado == "diagnosticando") {
    draw_text(tela_x + 14, tela_y + tela_h - 22, "SETA: ESCOLHER   E/ENTER: CONFIRMAR HIPOTESE   X: FECHAR");
} else if (estado == "escolhendo") {
    draw_text(tela_x + 14, tela_y + tela_h - 22, "SETA: ESCOLHER   E/ENTER: CONTINUAR   X: FECHAR");
} else if (estado == "resultado") {
    draw_text(tela_x + 14, tela_y + tela_h - 22, "E/ENTER/ESPACO: FECHAR RELATORIO");
}

draw_set_alpha(1);
draw_set_color(c_white);