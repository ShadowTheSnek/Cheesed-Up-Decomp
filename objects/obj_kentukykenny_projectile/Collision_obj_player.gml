with (other)
{
    if (character == "V")
        scr_hurtplayer(object_index)
    else if scr_transformationcheck()
    {
        if (state != states.firemouth && state != states.parry && hurted == 0)
        {
            sound_play_3d("event:/sfx/firemouth/start", x, y)
            create_transformation_tip(gml_Script_lang_get_value("firemouthtip"), "firemouth")
            firemouthflames = 0
            is_firing = 0
            hsp = 0
            movespeed = 0
            state = states.firemouth
            image_index = 0
            sprite_index = spr_firemouthintro
            state = states.firemouth
            bombpeptimer = 3
            instance_destroy(other)
        }
    }
}
