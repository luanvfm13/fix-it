
if (keyboard_check_pressed(vk_escape)
    && (room == restaurante || room == inicio || room == gamer || room == escritorio)
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




var _missao_ativa = (room == restaurante);
if (!_missao_ativa) {
    if (global.sala_missao_atual != noone) {
        missao_salvar_estado();
        global.sala_missao_atual = noone;
    }
    global.timer_ativo = false;
    exit;
}

if (room == restaurante && global.missao_restaurante_feita) {
    global.timer_ativo = false;
    exit;
}

if (global.sala_missao_atual != room) {
    global.sala_missao_atual = room;
    global.timer_ativo = true;
    global.tempo_restante = global.tempo_restaurante;
    tempo_step_acumulado = 0;
    global.jogo_acabou = false;

    var _primeira = !global.missao_restaurante_iniciada;
    if (_primeira) {
        global.missao_restaurante_iniciada = true;
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

    if (global.foi_demitido) {
        global.fim_pendente = (global.motivo_demissao == "saldo") ? "fim_demitido_saldo" : "fim_demitido_risco";
    } else {
        global.missao_restaurante_feita = true;
        global.missoes_concluidas += 1;
        global.etapa = 4;
    }

    if (instance_exists(obj_men)) {
        with (obj_men) {
            text = (global.foi_demitido)
                ? "Volte à G.A.M.E.R. e fale com o gerente."
                : "Missão concluída. Volte à G.A.M.E.R. e fale com o gerente.";
            tempo = 300;
        }
    }
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

        global.fim_pendente = global.foi_demitido
            ? ((global.motivo_demissao == "saldo") ? "fim_demitido_saldo" : "fim_demitido_risco")
            : "fim_tempo";

        if (instance_exists(obj_men)) {
            with (obj_men) {
                text = "Volte à G.A.M.E.R. e fale com o gerente.";
                tempo = 300;
            }
        }
    }
}