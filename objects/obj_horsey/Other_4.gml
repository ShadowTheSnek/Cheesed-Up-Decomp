var flag = 0
if in_baddieroom()
{
    state = states.finishingblow
    flag = 1
}
else if in_saveroom()
{
    state = states.gameover
    flag = 1
}
if flag
{
    with (obj_raceend)
    {
        other.x = (x + (sprite_width / 2))
        other.y = ((y + sprite_height) - 32)
    }
}
