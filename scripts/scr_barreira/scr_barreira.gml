
function barreira_no_ponto() {
    barreira_hit = false;
    with (obj_barreira) {
        if (ativa && place_meeting(x, y, other)) other.barreira_hit = true;
    }

    if (barreira_hit && current_time - barreira_ultimo_aviso > 4000) {
        barreira_ultimo_aviso = current_time;
        if (instance_exists(obj_men)) {
            with (obj_men) {
                text = "Este caminho está bloqueado.";
                tempo = 240;
            }
        }
    }
    return barreira_hit;
}