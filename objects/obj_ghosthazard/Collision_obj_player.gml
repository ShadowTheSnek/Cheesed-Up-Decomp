with (other)
{
    if (character == "V")
        scr_hurtplayer(id)
    else if ((!isgustavo) && state != states.ghost && state != states.ghostpossess && state != (291 << 0) && state != states.actor && state != states.parry && state != states.gotoplayer)
    {
        scr_losepoints()
        create_transformation_tip(gml_Script_lang_get_value("ghosttip"), "ghost")
        fmod_event_one_shot("event:/sfx/pep/ghostintro")
        grav /= 2
        state = states.ghost
        movespeed = hsp
        ghostdash = 0
        ghostpepper = 0
        ghosttimer = 0
        sprite_index = spr_ghostidle
        var xscale = (global.gameplay ? xscale : image_xscale)
        with (gml_Script_instance_create(x, y, obj_sausageman_dead))
        {
            hsp = (xscale * 3)
            image_xscale = (-xscale)
            sprite_index = other.spr_dead
            spr_palette = other.spr_palette
            paletteselect = other.paletteselect
            oldpalettetexture = global.palettetexture
        }
        other.debris = 0
    }
}
