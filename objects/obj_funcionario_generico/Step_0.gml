switch (estado) {
    case "andando":
        if (indice_rota >= array_length(rota)) {
            estado = (dialogo_id != "") ? "falando" : "saindo";
            exit;
        }

        var _alvo = rota[indice_rota];
        var _dist = point_distance(x, y, _alvo.x, _alvo.y);

        if (_dist <= move_spd) {
            x = _alvo.x;
            y = _alvo.y;
            indice_rota++;
            sprite_index = spr_gerente_idle;
            image_index = 0;

            if (espera > 0) {
                espera_restante = espera;
                estado = "esperando";
            } else if (indice_rota >= array_length(rota)) {
                estado = (dialogo_id != "") ? "falando" : "saindo";
            }
            exit;
        }

        var _dx = _alvo.x - x;
        var _dy = _alvo.y - y;
        x += (_dx / _dist) * move_spd;
        y += (_dy / _dist) * move_spd;

        if (_dy > 0.05) {
            sprite_index = spr_gerente_andando_frente;
        } else if (_dy < -0.05) {
            sprite_index = spr_gerente_andando_tras;
        } else {
            sprite_index = spr_gerente_andando_lado;
            image_xscale = (_dx < 0) ? escala_base : -escala_base;
        }
        break;

    case "esperando":
        espera_restante--;
        if (espera_restante <= 0) {
            if (indice_rota >= array_length(rota)) {
                estado = (dialogo_id != "") ? "falando" : "saindo";
            } else {
                estado = "andando";
            }
        }
        break;

    case "falando":
        if (dialogo_id != "") {
            var _d = instance_create_depth(0, 0, -300, obj_dialogo);
            with (_d) { setup_dialogo(other.dialogo_id); }
            dialogo_id = "";            // marca que já abriu
            exit;
        }
        if (!instance_exists(obj_dialogo)) estado = "saindo";
        break;

    case "saindo":
        global.ui_bloqueando_jogo = false;
        instance_destroy();
        break;
}