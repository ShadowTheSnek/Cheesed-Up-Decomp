function scr_switchgustavo() //gml_Script_scr_switchgustavo
{
    with (obj_player1)
    {
        visible = true
        ratmount_movespeed = 8
        gustavodash = 0
        isgustavo = 1
        state = states.ratmount
        jumpAnim = 0
        sprite_index = spr_ratmount_idle
        brick = 1
        fmod_event_instance_release(snd_voiceok)
        self.player_destroy_sounds()
        self.player_init_sounds()
    }
}

function scr_switchpeppino() //gml_Script_scr_switchpeppino
{
    with (obj_player1)
    {
        visible = true
        gustavodash = 0
        ratmount_movespeed = 8
        isgustavo = 0
        state = states.normal
        jumpAnim = 0
        sprite_index = spr_idle
        brick = 0
        self.player_destroy_sounds()
        self.player_init_sounds()
    }
}

