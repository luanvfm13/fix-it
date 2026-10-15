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
                if (!ida_completa) {
					
                    ida_completa = true;
					global.taxi_visto = true;
                    estado = "despedida";

                    var _px = x;
                    var _py = y - 10;
                    with (obj_prota) {
                        x = _px;
                        y = _py;
                        visible = true;
                    }

                    var _d = instance_create_layer(x, y, "Instances", obj_dialogo);
                    with (_d) {
                        setup_dialogo("despedida_taxi");
                    }
                } else {
					
                    instance_destroy();
                }
            }
            exit;
        }

        var _dir = point_direction(x, y, _alvo.x, _alvo.y);
        x += lengthdir_x(move_spd, _dir);
        y += lengthdir_y(move_spd, _dir);


       if (_dir > 225 && _dir <= 315)      sprite_index = spr_carro_fre; 
		else if (_dir > 45 && _dir <= 135)  sprite_index = spr_carro_cos; 
		else if (_dir > 135 && _dir <= 225) sprite_index = spr_carro_esq;
		else                                sprite_index = spr_carro_dir; 
        break;

    case "despedida":

        if (!instance_exists(obj_dialogo) && instance_exists(obj_prota)
            && point_distance(x, y, obj_prota.x, obj_prota.y) > 60) {

            var _ida = caminho;
            var _volta = [];
            for (var i = array_length(_ida) - 1; i >= 0; i--) {
                array_push(_volta, _ida[i]);
            }
            caminho = _volta;
            indice_caminho = 1;
            estado = "andando";
        }
        break;
}