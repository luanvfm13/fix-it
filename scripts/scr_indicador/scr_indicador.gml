/// alvo_da_etapa() <- bota no creation  code, anotação by luan lindo
function alvo_da_etapa() {
    var _e = global.etapa;

    switch (room) {
        case inicio:
            if (_e == 0) return instance_find(inicio_p_gamer, 0);
            if (_e >= 3) return instance_find(inicio_p_restaurante, 0);
            break;

        case gamer:
            if (_e == 1) return instance_find(gamer_p_esc, 0);
            if (_e == 2) return instance_find(obj_ger, 0);
            if (_e >= 3) return instance_find(gamer_p_inicio, 0);
            break;

        case escritorio:
            if (_e == 1) {
                if (!instance_exists(obj_hub)) return instance_find(obj_hubp, 0);

                var _ordem = ["scanner", "lupa", "tablet"];
                for (var i = 0; i < 3; i++) {
                    var _nome = _ordem[i];
                    if (!variable_global_get("tem_" + _nome)) {
                        var _achado = noone;
                        with (obj_hubeq) {
                            if (ferramenta_alvo == _nome) _achado = id;
                        }
                        return _achado;
                    }
                }
            }
            if (_e == 2) return instance_find(esc__p_gamer, 0);
            break;
    }
    return noone;
}