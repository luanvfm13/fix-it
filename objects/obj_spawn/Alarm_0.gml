var _alvo = variable_global_exists("spawn_alvo") ? global.spawn_alvo : "";

if (_alvo == spawn_id && instance_exists(obj_prota)) {
    with (obj_prota) {
        x = other.x;
        y = other.y;
    }
    global.spawn_alvo = "";
}