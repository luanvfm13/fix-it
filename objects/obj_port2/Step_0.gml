
var abrir = false;

if (instance_exists(obj_prota)) {
    if (point_distance(x, y, obj_prota.x, obj_prota.y) < distancia_ativacao) {
        abrir = true;
    }
}

var alvo;

if (abrir) {
    alvo = xaberto;
} else {
    alvo = xfechado;
}

if (abs(x - alvo) <= velocidade_porta) {
    x = alvo;
} else {
    x += sign(alvo - x) * velocidade_porta;
}
