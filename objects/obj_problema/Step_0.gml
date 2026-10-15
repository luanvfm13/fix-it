var _key = string(room) + ":" + string(problem_id) + ":" + string(x) + "," + string(y);

if (!variable_global_exists("problemas_resolvidos")) global.problemas_resolvidos = [];

var _ja = false;
for (var i = 0; i < array_length(global.problemas_resolvidos); i++) {
    if (global.problemas_resolvidos[i] == _key) {
        _ja = true;
        break;
    }
}


if (!variable_instance_exists(id, "checado")) {
    checado = true;
    if (_ja) {
        if (room == restaurante && problem_id == "Caixa" && global.totem_liberado && !instance_exists(obj_toten)) {
            instance_create_layer(x, y, "Instances", obj_toten);
        }
        instance_destroy();
        exit;
    }
}


if (is_solved) {
    if (!_ja) array_push(global.problemas_resolvidos, _key);
    if (room == restaurante && problem_id == "Caixa" && coesao_resolucao >= 80) {
        global.totem_liberado = true;
		instance_create_layer(x, y, "Instances", obj_toten);
    }
    instance_destroy();
}