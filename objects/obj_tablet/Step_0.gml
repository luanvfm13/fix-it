switch (estado) {
    case "diagnosticando":
        if (!instance_exists(problema_alvo)) {
            instance_destroy();
            exit;
        }

        if (keyboard_check_pressed(vk_down)) {
            diagnostico_selecionado = (diagnostico_selecionado + 1) mod 3;
        }
        if (keyboard_check_pressed(vk_up)) {
            diagnostico_selecionado = (diagnostico_selecionado - 1 + 3) mod 3;
        }
        if (keyboard_check_pressed(ord("X")) || keyboard_check_pressed(vk_escape)) {
            instance_destroy();
            exit;
        }
        if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("E"))) {
            var _diagnostico = get_diagnostico_data(problema_alvo.problem_id);
            diagnostico_correto = (ordem_diagnosticos[diagnostico_selecionado] == _diagnostico.indice_correto);
            estado = "escolhendo";
        }
        break;

    case "escolhendo":
        if (!instance_exists(problema_alvo)) {
            instance_destroy();
            exit;
        }

        var _opcoes = problema_alvo.problem_data.opcoes;
        var _quantidade_opcoes = array_length(_opcoes);

        if (array_length(ordem_opcoes) != _quantidade_opcoes) {
            ordem_opcoes = criar_ordem_embaralhada(_quantidade_opcoes);
        }

        if (keyboard_check_pressed(vk_down)) {
            opcao_selecionada = (opcao_selecionada + 1) mod _quantidade_opcoes;
        }
        if (keyboard_check_pressed(vk_up)) {
            opcao_selecionada = (opcao_selecionada - 1 + _quantidade_opcoes) mod _quantidade_opcoes;
        }
        if (keyboard_check_pressed(ord("X")) || keyboard_check_pressed(vk_escape)) {
            instance_destroy();
            exit;
        }

        if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("E"))) {
            escolha_pendente = ordem_opcoes[opcao_selecionada];
            fluxo_etapa = 0;
            estado = "fluxo";
        }
        break;

    case "fluxo":
        if (keyboard_check_pressed(ord("X")) || keyboard_check_pressed(vk_escape)) {
            estado = "escolhendo";
            break;
        }

        if (keyboard_check_pressed(vk_left)) {
            fluxo_escolhido[fluxo_etapa] = (fluxo_escolhido[fluxo_etapa] + 2) mod 3;
        }
        if (keyboard_check_pressed(vk_right)) {
            fluxo_escolhido[fluxo_etapa] = (fluxo_escolhido[fluxo_etapa] + 1) mod 3;
        }

        if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("E"))) {
            if (fluxo_etapa < 3) {
                fluxo_etapa++;
            } else {
                resultado = resolve_problem(problema_alvo, escolha_pendente, fluxo_escolhido, diagnostico_correto);
                if (resultado == undefined) {
                    instance_destroy();
                    exit;
                }
                estado = "resultado";
            }
        }
        break;

    case "resultado":
        if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("E"))
         || keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("Z"))) {
            instance_destroy();
        }
        break;
}