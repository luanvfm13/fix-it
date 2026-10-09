balaou.x = x;
balaou.y = y - 40;

switch (estado) {
    case "esperando":
        if (timer_espera > 0) {
            timer_espera--;
            exit;
        }
        estado = "andando";
        break;

    case "andando":
        var _alvo = caminho[indice_caminho];
        var _dist = point_distance(x, y, _alvo.x, _alvo.y);

        if (_dist <= move_spd) {
            x = _alvo.x;
            y = _alvo.y;
            indice_caminho++;

            if (indice_caminho >= array_length(caminho)) {
                estado = "parado";
                sprite_index = spr_gerente_idle;
                image_index = 0;
                image_xscale = escala_base;
                global.ui_bloqueando_jogo = false;
            }
            exit;
        }

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
            image_xscale = (_dx < 0) ? escala_base : -escala_base;
        }
        break;

    case "parado":
        if (blink_timer > 0) {
            blink_timer--;
        } else if (image_index == 0) {
            image_index = 1;
            blink_timer = 8;
        } else {
            image_index = 0;
           blink_timer = game_get_speed(gamespeed_fps) * 2;
        }

        var _perto = distance_to_object(obj_prota) < 11;
        balaou.visible = _perto && !global.ui_bloqueando_jogo;

        if (_perto && !global.ui_bloqueando_jogo && !instance_exists(obj_dialogo)) {
            if (keyboard_check_pressed(ord("E"))) {
                var _id_dialogo = dialogo_id;
                var _d = instance_create_layer(x, y, "Instances", obj_dialogo);
                with (_d) {
                    setup_dialogo(_id_dialogo);
                }
            }
        }
        break;
}