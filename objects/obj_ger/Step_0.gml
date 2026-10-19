balaou.x = x;
balaou.y = y - 40;


if (!variable_instance_exists(id, "iniciado")) {
    iniciado = true;
    if (global.etapa >= 1) {
        var _fim = caminho[array_length(caminho) - 1];
        x = _fim.x;
        y = _fim.y;
        estado = "parado";
        sprite_index = spr_gerente_idle;
        image_xscale = escala_base;
    }
}

switch (estado) {
    case "esperando":

        break;

    case "andando":
        image_speed = 2;


        var _perto_do_jogador = abordando && distance_to_object(obj_prota) < 20;

        var _alvo = caminho[indice_caminho];
        var _dist = point_distance(x, y, _alvo.x, _alvo.y);
        var _fim_caminho = false;

        if (_dist <= move_spd) {
            x = _alvo.x;
            y = _alvo.y;
            indice_caminho++;
            _fim_caminho = (indice_caminho >= array_length(caminho));
        }

        if (_perto_do_jogador || _fim_caminho) {
            abordando = false;
            estado = "parado";
            sprite_index = spr_gerente_idle;
            image_index = 0;
            image_xscale = escala_base;
            global.ui_bloqueando_jogo = false;


            if (global.etapa == 0) {
                global.etapa = 1;
                var _rec = instance_create_layer(x, y, "Instances", obj_dialogo);
                with (_rec) {
                    setup_dialogo("gerente_intro");
                }
            }
            exit;
        }


        if (_dist <= move_spd) exit;

        var _dx = _alvo.x - x;
        var _dy = _alvo.y - y;
        var _dir_x = _dx / _dist;
        var _dir_y = _dy / _dist;
        x += _dir_x * move_spd;
        y += _dir_y * move_spd;

        if (_dy > 0.05) {
            sprite_index = spr_gerente_andando_frente;
        } else if (_dy < -0.05) {
            sprite_index = spr_gerente_andando_tras;
        } else {
            sprite_index = spr_gerente_andando_lado;
            image_xscale = (_dx < 0) ? -escala_base : escala_base;
        }
        break;

    case "parado":
        image_speed = 0;
        if (blink_timer > 0) {
            blink_timer--;
        } else if (image_index == 0) {
            image_index = 1;
            blink_timer = 8;
        } else {
            image_index = 0;
            blink_timer = game_get_speed(gamespeed_fps) * 8;
        }

        if (global.missoes_concluidas >= global.missoes_total) {
            var _media_final = (global.coesao_count > 0)
                ? global.coesao_total / global.coesao_count
                : 0;
            if (_media_final >= 90) dialogo_id = "gerente_final";
            else if (_media_final >= 60) dialogo_id = "gerente_final_parcial";
            else dialogo_id = "gerente_final_baixo";
        }
        else if (global.etapa == 2) dialogo_id = "gerente_despedida";
        else if (global.etapa == 1) dialogo_id = "gerente_lembrete";
         else if (global.etapa == 3) dialogo_id = "gerente_lembrete";
		
		else dialogo_id = "gerente_intro";
		
		
		    if (global.final_dialogo_concluido && global.missoes_concluidas >= global.missoes_total && !global.final_campanha) {
            global.final_dialogo_concluido = false;
            global.final_campanha = true;
            global.jogo_vencido = true;
            global.jogo_acabou = true;
            global.timer_ativo = false;
            var _final = instance_create_depth(0, 0, -10000, obj_misaof);
            _final.demitido = false;
            _final.venceu = true;
            _final.fim_campanha = true;
            exit;
        }

        var _perto = distance_to_object(obj_prota) < 11;
        balaou.visible = _perto && !global.ui_bloqueando_jogo;

        if (_perto && !global.ui_bloqueando_jogo && !instance_exists(obj_dialogo)) {
            if (keyboard_check_pressed(ord("E"))) {
                if (global.etapa == 2) global.etapa = 3;
                var _id_dialogo = dialogo_id;
                var _d = instance_create_layer(x, y, "Instances", obj_dialogo);
                with (_d) {
                    setup_dialogo(_id_dialogo);
                }
            }
        }
        break;
}