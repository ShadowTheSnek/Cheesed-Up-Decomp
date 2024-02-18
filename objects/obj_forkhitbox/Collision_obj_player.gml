if (!hit)
    return;
if (instance_exists(ID) && ID.object_index == obj_badrat && other.state == states.tumble)
    return;
var s = other.state
if (instance_exists(ID) && ID.object_index == obj_golfdemon && other.flash)
    other.flash = 0
scr_hurtplayer(other)
if (s != other.state)
    gml_Script_instance_create(round(((x + other.x) / 2)), round(((y + other.y) / 2)), obj_parryeffect)
