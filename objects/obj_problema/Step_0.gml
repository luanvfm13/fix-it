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
        instance_destroy();
        exit;
    }
}


if (is_solved) {
    if (!_ja) array_push(global.problemas_resolvidos, _key);
    instance_destroy();
}