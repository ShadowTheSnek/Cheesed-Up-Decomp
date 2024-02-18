with (obj_player)
{
    if place_meeting(x, (y + 1), other)
    {
        if ((!(check_solid((other.x + 16), (y + 1)))) && key_down && ((state == states.freefall && grounded && global.gameplay) || state == states.crouch || state == states.ratmountcrouch || (((character == "S" && abs(movespeed) < 8) || character == "M") && (state == states.normal || state == states.mach1))) && place_meeting(x, (y + 1), obj_platform))
        {
            if global.gameplay
                smoothx = (x - (other.x + 16))
            y += 5
            if isgustavo
            {
                state = states.ratmountladder
                if brick
                {
                    with (gml_Script_instance_create(x, y, obj_brickcomeback))
                    {
                        wait = 1
                        create_particle(x, y, (9 << 0))
                    }
                    brick = 0
                }
            }
            else
                state = states.ladder
            x = (other.x + 16)
            y = floor(y)
            if ((y % 2) == 1)
                y -= 1
        }
    }
}
