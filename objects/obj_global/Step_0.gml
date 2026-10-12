var _missao_ativa = (room == restaurante || room == Hosp);
if (!_missao_ativa) {
    global.timer_ativo = false;
    exit;
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
        } else if (room == Hosp && !global.missao_hospital_feita) {
            global.missao_hospital_feita = true;
            global.missoes_concluidas += 1;
        }
    }

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

        var _res = instance_create_depth(0, 0, -10000, obj_misaof);
        _res.demitido = global.foi_demitido;
        _res.venceu = false;
        _res.fim_campanha = false;
    }
}