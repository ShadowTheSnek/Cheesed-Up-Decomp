if (place_meeting(x, y, obj_player1) && obj_player1.key_up2)
{
    text++
    sound_play_3d("event:/sfx/misc/computerswitch", x, y)
    if (text >= 2)
        text = 0
    self.update_text()
}
