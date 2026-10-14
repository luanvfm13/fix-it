if (player == noone || !instance_exists(player)) exit;
if (!player.tem_lupa) exit;

x = player.x + 10;
y = player.y - 6;

if (!player.tem_lupa) exit;

target_problema = noone;                      
var _menor_dist = lupa_range;

with (obj_problema) {
    if (is_solved) continue;

    var _d = point_distance(x, y, other.x, other.y);
    if (_d < _menor_dist) {
        _menor_dist = _d;
        other.target_problema = id;
    }
}


if (!global.ui_bloqueando_jogo && target_problema != noone && keyboard_check_pressed(ord("E"))) {
 

    var _perto_de_porta = (instance_exists(inicio_p_restaurante) && distance_to_object(inicio_p_restaurante) < 11);

    if (!_perto_de_porta && !instance_exists(obj_tablet)) {
        registrar_evidencia(target_problema.problem_id, "lupa");
        if (!evidencia_coletada(target_problema.problem_id, "scanner")) {
            if (instance_exists(obj_men)) {
                obj_men.text = "Use o scanner para registrar a primeira pista.";
                obj_men.tempo = 100;
            }
        } else {
            var _ui = instance_create_layer(x, y, "Instances", obj_tablet);
            _ui.problema_alvo = target_problema;
        }
    }
}