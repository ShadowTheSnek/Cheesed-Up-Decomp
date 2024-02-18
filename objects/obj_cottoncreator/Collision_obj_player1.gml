with (other)
{
    if (state != (304 << 0) && state != states.tumble && state != states.door && state != (306 << 0))
    {
        global.combofreeze = 30
        state = (304 << 0)
        if (movespeed > 6)
            movespeed = 6
        create_particle(x, y, (9 << 0))
        sprite_index = spr_cottonidle
        create_transformation_tip(gml_Script_lang_get_value_newline("cottontip"), "cotton")
    }
}
