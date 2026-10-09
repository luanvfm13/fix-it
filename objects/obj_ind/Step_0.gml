if (instance_exists(alvo_instancia)) {
    alvo_x = alvo_instancia.x;
    alvo_y = alvo_instancia.y;
}

if (distancia_esconder > 0 && instance_exists(obj_prota)
    && point_distance(obj_prota.x, obj_prota.y, alvo_x, alvo_y) < distancia_esconder) {
    instance_destroy();
}