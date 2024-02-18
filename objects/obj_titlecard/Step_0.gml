if (!fadein)
{
    fadealpha = Approach(fadealpha, 1, 0.1)
    if (fadealpha >= 1)
    {
        fadein = 1
        start = 1
        music = 0
        alarm[0] = 180
        if (title_music == "event:/music/secretworldtitle")
            alarm[0] = 240
    }
}
else
{
    fadealpha = Approach(fadealpha, 0, 0.1)
    if (fadealpha <= 0 && (!music) && title_music != -4)
    {
        music = 1
        if (global.jukebox == -4)
            sound_play(title_music)
    }
}
