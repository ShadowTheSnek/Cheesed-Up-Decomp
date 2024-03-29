with (other)
{
    if (state == states.handstandjump || state == states.lungeattack || state == states.punch)
    {
        input_buffer_grab = 0
        input_buffer_slap = 0
        image_index = 0
        sprite_index = spr_shotgunpullout
        sound_play_3d("event:/sfx/pep/shotgunload", x, y)
        sound_play_3d("event:/sfx/misc/breakblock", x, y)
        instance_destroy(other)
        shotgunAnim = 1
        state = states.shotgun
        var tip = gml_Script_lang_get_value("shotguntip")
        if (global.shootbutton != 0)
            tip = string_replace(tip, "[G]", "[S]")
        create_transformation_tip(tip, "shotgun")
        if (room == war_1)
        {
            with (instance_create_unique(0, 0, obj_wartimer))
            {
                minutes = 0
                seconds = 40
            }
            with (obj_escapecollect)
                image_alpha = 1
            with (obj_music)
                warstart = 1
        }
        global.heattime = 60
    }
}
