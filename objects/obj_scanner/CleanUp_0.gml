if (variable_instance_exists(id, "problems_detected")) {
    if (ds_exists(problems_detected, ds_type_list)) {
        ds_list_destroy(problems_detected);
    }
}
if (variable_instance_exists(id, "highlighted_problems")) {
    if (ds_exists(highlighted_problems, ds_type_list)) {
        ds_list_destroy(highlighted_problems);
    }
}
