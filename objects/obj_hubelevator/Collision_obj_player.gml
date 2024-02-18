if (state == states.normal)
{
    with (other)
    {
        if (key_up && grounded && (state == states.normal || state == states.ratmount))
        {
            var i = 0
            while (i < array_length(other.hub_array))
            {
                if (room == other.hub_array[i][1])
                {
                    other.sel = i
                    other.offload_arr = other.hub_array[i][3]
                    break
                }
                else
                {
                    i++
                    continue
                }
            }
            sound_play("event:/modded/sfx/diagopen")
            state = states.actor
            sprite_index = spr_lookdoor
            image_index = 0
            if isgustavo
                sprite_index = spr_ratmountenterdoor
            hsp = 0
            vsp = 50
            if global.gameplay
            {
                smoothx = (x - (other.x + 50))
                x = (other.x + 50)
            }
            other.state = states.revolver
            other.buffer = 5
        }
    }
}
