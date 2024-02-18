fadealpha = 0
fadein = 0
start = 0
step = 0
info = 
{
    bginfo: [spr_entrycard_bg, (2 << 0), (4 << 0), (8 << 0), 0, 0],
    titleinfo: [spr_entrycard_title, (0 << 0), (5 << 0), (6 << 0), 672, 160],
    song: "event:/modded/sugary/entrywaytitle"
}

bgX = 0
bgY = 0
titleX = 0
titleY = 0
group_arr = -4
title_music = -4
offload_arr = -4
loading = 0
depth = -600
with (obj_gusbrickchase)
    fmod_event_instance_stop(snd, 1)
with (obj_gusbrickfightball)
    alarm[1] = -1
