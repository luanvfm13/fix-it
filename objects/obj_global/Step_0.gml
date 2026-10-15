if (keyboard_check_pressed(vk_escape)
    && (room == restaurante || room == Hosp || room == inicio || room == gamer || room == escritorio)
    && !instance_exists(obj_pausa)
    && !instance_exists(obj_dialogo)
    && !instance_exists(obj_tablet)
    && !instance_exists(obj_hub)
    && !instance_exists(obj_painel)
    && !instance_exists(obj_misaof)
    && (obj_uber.ida_completa)
    && (!instance_exists(obj_fade) || obj_fade.estado == "parado")) {
    instance_create_depth(0, 0, -1000, obj_pausa);
}



guia_verificar();

var _missao_ativa = (room == restaurante || room == Hosp);
if (!_missao_ativa) {
    if (global.sala_missao_atual != noone) {
        missao_salvar_estado();
        global.sala_missao_atual = noone;
    }
    global.timer_ativo = false;
    exit;
}

if ((room == restaurante && global.missao_restaurante_feita) || (room == Hosp && global.missao_hospital_feita)) {
    global.timer_ativo = false;
    exit;
}

if (global.sala_missao_atual != room) {
    global.sala_missao_atual = room;
    global.timer_ativo = true;
    global.tempo_restante = (room == restaurante) ? global.tempo_restaurante : global.tempo_hospital;
    tempo_step_acumulado = 0;
    global.jogo_acabou = false;

    var _primeira = (room == restaurante) ? !global.missao_restaurante_iniciada : !global.missao_hospital_iniciada;
    if (_primeira) {
        if (room == restaurante) global.missao_restaurante_iniciada = true;
        else global.missao_hospital_iniciada = true;
        global.falha_gerada_missao = false;
        global.evento_operacional = "";
    }

    if (global.falha_pendente && global.falha_room == room) {
        var _falha = instance_create_layer(global.falha_x, global.falha_y, "Instances", obj_problema);
        with (_falha) setup_problem("falha_conexao");
    }
}

if (!global.timer_ativo || global.jogo_acabou) exit;
if (global.ui_bloqueando_jogo) exit;

if (instance_number(obj_problema) == 0) {
    global.jogo_vencido = true;
    global.jogo_acabou = true;
    global.timer_ativo = false;

    cobrar_scanner(room);

    if (!global.foi_demitido) {
        if (room == restaurante) {
            global.missao_restaurante_feita = true;
            global.missoes_concluidas += 1;
            global.etapa = 4;
        } else {
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

        cobrar_scanner(room);

        var _res2 = instance_create_depth(0, 0, -10000, obj_misaof);
        _res2.demitido = global.foi_demitido;
        _res2.venceu = false;
        _res2.fim_campanha = false;
    }
}


