if (sprite_index != spr_mortspawn)
{
    with (other)
    {
        if (state != states.mort && state != states.mortjump && state != states.mortattack && state != states.morthook && state != states.ridecow)
        {
            repeat (6)
                create_debris(x, y, spr_feather)
            mort = 1
            instance_create_unique(x, y, obj_mortfollow)
            movespeed = hsp
            state = states.mort
            sound_play_3d("event:/sfx/mort/mortpickup", x, y)
            create_transformation_tip(gml_Script_lang_get_value("morttip"), "morttip")
            instance_destroy(other)
        }
    }
}
