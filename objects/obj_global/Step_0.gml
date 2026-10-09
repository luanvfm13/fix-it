if (!global.timer_ativo || global.jogo_acabou) exit;
if (global.ui_bloqueando_jogo) exit;

if (instance_number(obj_problema) == 0) {
    global.jogo_vencido = true;
    global.jogo_acabou = true;
    global.timer_ativo = false;

    var _res = instance_create_depth(0, 0, -10000, obj_misaof);
    _res.demitido = global.foi_demitido;
	_res.venceu = true;
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
    }
}