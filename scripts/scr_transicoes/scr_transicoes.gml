function fade_to_room(_room) {
    if (!instance_exists(obj_fade)) {
        room_goto(_room); 
        return;
    }

    with (obj_fade) {
        if (estado != "parado") exit; 
        sala_destino = _room;
        estado = "saindo";
    }

    global.ui_bloqueando_jogo = true;
}


function missao_salvar_estado() {
    if (global.sala_missao_atual == restaurante) {
        global.tempo_restaurante = global.tempo_restante;
        global.scans_restaurante += global.scans_usados;
    }
    global.scans_usados = 0;
}

function cobrar_scanner(_missao) {
    missao_salvar_estado();
    var _n = global.scans_restaurante;
    var _custo = _n * global.scan_custo_moedas;

    global.moedas -= _custo;
    global.scans_ultimo = _n;
    global.scans_custo_ultimo = _custo;
    global.scans_total += _n;
    global.moedas_gastas_scanner += _custo;

    global.scans_restaurante = 0;

    if (global.moedas < 0) {
        global.foi_demitido = true;
        global.motivo_demissao = "saldo";
    }
}

function reset_jogo() {
	global.fim_pendente = "";
    global.moedas = 3;
    global.coesao_total = 0;
    global.coesao_count = 0;
    global.orcamento = 80;
    global.divida_tecnica = 0;
    global.ind_eficiencia = 35;
    global.ind_confiabilidade = 40;
    global.ind_integracao = 20;
    global.pericia_integracao = false;
    global.pericia_operacao = false;

    global.falha_gerada_missao = false;
    global.falha_pendente = false;
    global.falha_room = noone;
    global.falha_x = 0;
    global.falha_y = 0;
	
    global.sala_missao_atual = noone;
    global.evento_operacional = "";
    global.relatorios_missao = [];
    global.historico_eventos = [];
    global.metricas_antes_definidas = false;
    global.metricas_missao_antes = {
        eficiencia: global.ind_eficiencia,
        confiabilidade: global.ind_confiabilidade,
        integracao: global.ind_integracao
    };
    global.ui_bloqueando_jogo = false;

    global.tempo_restaurante = 90;
    global.tempo_restante = 90;
    global.timer_ativo = false;
    global.jogo_acabou = false;
    global.jogo_vencido = false;

    global.missoes_total = 1;
    global.missoes_concluidas = 0;
    global.missao_restaurante_feita = false;
    global.missao_restaurante_iniciada = false;
    global.final_dialogo_concluido = false;
    global.final_campanha = false;

    global.tem_scanner = false;
    global.tem_lupa = false;
    global.tem_tablet = false;
    global.bronca_pendente = "";
    global.foi_demitido = false;
    global.motivo_demissao = "";
    global.taxi_visto = false;
    global.spawn_alvo = "";
    global.etapa = 0;
    global.problemas_resolvidos = [];
    global.evidencias_coletadas = [];

    global.scans_restaurante = 0;
    global.scans_usados = 0;
    global.scans_ultimo = 0;
    global.scans_custo_ultimo = 0;
    global.scans_total = 0;
    global.scan_custo_moedas = 2;
    global.moedas_gastas_scanner = 0;

    global.tempo_flash_t = 0;
    global.tempo_flash_txt = "";
    global.tempo_flash_cor = c_red;

    global.totem_liberado = false;
    global.totem_falou = false;

    global.guia_tempo_fora = 0;
    global.guia_cooldown = 0;

    with (obj_global) {
        tempo_step_acumulado = 0;
    }
}