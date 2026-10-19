ativa = (global.etapa >= etapa_min && global.etapa <= etapa_max);
if (aviso_cd > 0) aviso_cd--;
if (!ativa || !instance_exists(obj_prota)) exit;

if (distance_to_object(obj_prota) < 40 && aviso_cd <= 0 && !global.ui_bloqueando_jogo) {
    aviso_cd = 300;
    if (instance_exists(obj_men)) {
        with (obj_men) {
            text = "Este caminho está bloqueado. Siga a rota marcada.";
            tempo = 240;
        }
    }
}