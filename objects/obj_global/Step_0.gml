var _missao_ativa = (room == restaurante || room == Hosp);
if (!_missao_ativa) {
    global.timer_ativo = false;
    global.sala_missao_atual = noone;
    exit;
}

if ((room == restaurante && global.missao_restaurante_feita) || (room == Hosp && global.missao_hospital_feita)) {
    global.timer_ativo = false;
    exit;
}

if (global.sala_missao_atual != room) {
    global.sala_missao_atual = room;
    global.timer_ativo = true;
    global.tempo_restante = 240;
    tempo_step_acumulado = 0;
    global.jogo_acabou = false;
    global.falha_gerada_missao = false;
    global.evento_operacional = "";
    global.relatorios_missao = [];
    global.metricas_missao_antes = {
        eficiencia: global.ind_eficiencia,
        confiabilidade: global.ind_confiabilidade,
        integracao: global.ind_integracao
    };
}

if (!global.timer_ativo || global.jogo_acabou) exit;
if (global.ui_bloqueando_jogo) exit;

if (instance_number(obj_problema) == 0) {
    global.jogo_vencido = true;
    global.jogo_acabou = true;
    global.timer_ativo = false;

    if (!global.foi_demitido) {
        if (room == restaurante && !global.missao_restaurante_feita) {
            global.missao_restaurante_feita = true;
            global.missoes_concluidas += 1;
			global.etapa = 4;
        } else if (room == Hosp && !global.missao_hospital_feita) {
            global.missao_hospital_feita = true;
            global.missoes_concluidas += 1;
        }
    }
	cobrar_scanner();

    var _res = instance_create_depth(0, 0, -10000, obj_misaof);
    _res.demitido = global.foi_demitido;
    _res.venceu = true;
    _res.fim_campanha = false;
    exit;
}

tempo_step_acumulado += 1;
if (tempo_step_acumulado >= game_get_speed(gamespeed_fps)) {
    tempo_step_acumulado = 0;
    global.tempo_restante -= 1;

    if (global.tempo_restante <= 0) {
        global.tempo_restante = 0;
        global.jogo_acabou = true;
        global.timer_ativo = false;
		
		cobrar_scanner();

        var _res2 = instance_create_depth(0, 0, -10000, obj_misaof);
        _res2.demitido = global.foi_demitido;
        _res2.venceu = false;
        _res2.fim_campanha = false;
    }
}