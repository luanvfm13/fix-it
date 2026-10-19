/// salas_ok: rooms em que o cara pode ficar sem pegar na mãozinha e levar pro objtivo
function guia_config(_etapa) {
    switch (_etapa) {
        case 0: return { sala: gamer,    obj: obj_gatilho_gerente, salas_ok: [gamer],           raio: 200, dica: "guia_gamer" };
        case 1: return { sala: gamer,    obj: gamer_p_esc,         salas_ok: [gamer, escritorio], raio: 150, dica: "guia_escritorio" };
        case 2: return { sala: gamer,    obj: obj_ger,             salas_ok: [gamer, escritorio], raio: 200, dica: "guia_gerente" };
        case 3: return { sala: inicio,   obj: inicio_p_restaurante, salas_ok: [inicio, gamer],     raio: 200, dica: "guia_lanchonete" };
    }
    return undefined;
}


function guia_verificar() {
    var _fps = game_get_speed(gamespeed_fps);

       if (room == Menu || room == restaurante || !instance_exists(obj_prota)) {
        global.guia_tempo_fora = 0;
        return;
    }
    if (global.guia_cooldown > 0) { global.guia_cooldown--; return; }
    if (global.ui_bloqueando_jogo || instance_exists(obj_dialogo)) {
        global.guia_tempo_fora = 0;
        return;
    }

    var _c = guia_config(global.etapa);
    if (_c == undefined) { global.guia_tempo_fora = 0; return; }

    var _na_sala_ok = false;
    for (var i = 0; i < array_length(_c.salas_ok); i++) {
        if (_c.salas_ok[i] == room) { _na_sala_ok = true; break; }
    }

    var _fora = false;
    if (!_na_sala_ok) {
        _fora = true;
    } else if (_c.raio > 0 && room == _c.sala) {
        var _alvo = instance_find(_c.obj, 0);
        if (instance_exists(_alvo)) {
            _fora = (point_distance(obj_prota.x, obj_prota.y, _alvo.x, _alvo.y) > _c.raio);
        }
    }

    if (!_fora) { global.guia_tempo_fora = 0; return; }

    global.guia_tempo_fora++;
    if (global.guia_tempo_fora >= _fps * 3) {
        global.guia_tempo_fora = 0;
        global.guia_cooldown = _fps * 20;
        var _d = instance_create_depth(0, 0, -300, obj_dialogo);
        with (_d) setup_dialogo(_c.dica);
    }
}