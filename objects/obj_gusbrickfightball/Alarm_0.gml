if (!visible)
    return;
alarm[0] = (20 + irandom(8))
repeat (irandom(4) + 1)
    gml_Script_instance_create((x + irandom_range(-60, 60)), (y + irandom_range(-20, 60)), obj_gusbrickcloud)
