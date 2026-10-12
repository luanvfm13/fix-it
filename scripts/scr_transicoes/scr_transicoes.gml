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

function reset_jogo() {
    global.moedas = 0;
    global.coesao_total = 0;
    global.coesao_count = 0;
    global.ui_bloqueando_jogo = false;
    global.tempo_restante = 240;
    global.timer_ativo = false;
    global.jogo_acabou = false;
    global.jogo_vencido = false;
    global.tem_scanner = false;
    global.tem_lupa = false;
    global.tem_tablet = false;
    global.bronca_pendente = "";
    global.foi_demitido = false;
    global.taxi_visto = false;
    global.spawn_alvo = "";
	global.etapa = 0;
	global.problemas_resolvidos = [];
    with (obj_global) {
        tempo_step_acumulado = 0;
    }
}