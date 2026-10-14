dialogo_id = "toten";

var _jogador = instance_find(obj_prota, 0);
if (_jogador != noone && place_meeting(_jogador.x, _jogador.y, id)) {
	spawn_posicao_valida = false;
	var _destino_x = x + 240;
	var _destino_y = y - 32;
	var _totem_x = x;
	var _totem_y = y;

	with (_jogador) {
		var _x_inicial = x;
		var _y_inicial = y;
		var _posicao_encontrada = false;

		for (var _raio = 0; _raio <= max(room_width, room_height) && !_posicao_encontrada; _raio += 16) {
			for (var _angulo = 0; _angulo < 360 && !_posicao_encontrada; _angulo += 30) {
				x = _destino_x + lengthdir_x(_raio, _angulo);
				y = _destino_y + lengthdir_y(_raio, _angulo);

				var _fora_da_sala = (bbox_left < 0 || bbox_top < 0 || bbox_right > room_width || bbox_bottom > room_height);
				if (_fora_da_sala || point_distance(x, y, _totem_x, _totem_y) < 200) continue;

				var _tile_bloqueado = false;
				for (var _px = bbox_left + 1; _px < bbox_right && !_tile_bloqueado; _px += 8) {
					for (var _py = bbox_top + 1; _py < bbox_bottom; _py += 8) {
						var _tile = tilemap_get_at_pixel(tilemap, _px, _py);
						if (tile_get_index(_tile) != 0) {
							_tile_bloqueado = true;
							break;
						}
					}
				}
				if (_tile_bloqueado) continue;

				var _colidiu_npc = false;
				for (var _i = 0; _i < array_length(npc_colisao_objetos) && !_colidiu_npc; _i++) {
					if (place_meeting(x, y, npc_colisao_objetos[_i])) _colidiu_npc = true;
				}
				if (_colidiu_npc || place_meeting(x, y, obj_toten)) continue;

				_posicao_encontrada = true;
				other.spawn_posicao_valida = true;
			}
		}

		if (!_posicao_encontrada) {
			x = _x_inicial;
			y = _y_inicial;
			show_debug_message("Totem: nao foi encontrada uma posicao livre para o protagonista.");
		}
	}

	if (!spawn_posicao_valida) {
		instance_destroy();
		exit;
	}
}

balaou = instance_create_layer(x + 10, y - 40, "Instances", obj_dialog);
balaou.visible = false;

if (!instance_exists(obj_dialogo)) {
	var _fala = instance_create_layer(x, y, "Instances", obj_dialogo);
	with (_fala) setup_dialogo("toten");
}
