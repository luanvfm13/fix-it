var _pts = rota_atual();
if (_pts == undefined || !instance_exists(obj_prota) || !obj_prota.visible
    || global.ui_bloqueando_jogo || instance_exists(obj_dialogo)) {
    tempo_fora = 0;
    exit;
}

if (aviso_cooldown > 0) aviso_cooldown--;

var _d = 99999;
for (var i = 0; i < array_length(_pts) - 1; i++) {
    _d = min(_d, dist_ponto_segmento(obj_prota.x, obj_prota.y,
        _pts[i].x, _pts[i].y, _pts[i + 1].x, _pts[i + 1].y));
}

if (_d > tolerancia) {
    tempo_fora++;
    if (tempo_fora > 30 && aviso_cooldown <= 0) {
        aviso_cooldown = 300;
        var _msg = rota_aviso();
        if (instance_exists(obj_men)) {
            with (obj_men) {
                text = _msg;
                tempo = 240;
            }
        }
    }
} else {
    tempo_fora = 0;
}