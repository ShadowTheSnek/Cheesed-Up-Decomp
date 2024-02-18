if (buffer <= 0 && other.state != states.ghost)
{
    buffer = 50
    image_alpha = 0
    with (other)
    {
        if (!in_saveroom(other.id))
        {
            notification_push((39 << 0), [room])
            add_saveroom(other.id)
        }
        sound_play_3d("event:/sfx/pep/gravecorpsestart", x, y)
        vsp = -11
        movespeed = abs(movespeed)
        dir = xscale
        movespeed = 13
        particle_set_scale((5 << 0), xscale, 1)
        create_particle(x, y, (5 << 0))
        sprite_index = spr_player_corpsestart
        image_index = 0
        gravesurfingjumpbuffer = 50
        with (obj_gravecorpse)
        {
            if (playerid == other.id)
                instance_destroy()
        }
        with (gml_Script_instance_create(x, y, obj_gravecorpse))
            playerid = other.id
        state = states.trashroll
        repeat (5)
        {
            with (create_debris(x, y, spr_graveyarddebris2, 0))
                vsp = random_range(-8, -11)
        }
        create_transformation_tip(gml_Script_lang_get_value("gravesurftip"), "gravesurf")
    }
}
