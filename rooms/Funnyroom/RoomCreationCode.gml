global.gameframe_caption_text = ""
global.experimental = 0
fmod_event_instance_set_paused_all(1)
sound_play("event:/music/w1/dungeondepth")
with (all)
{
    if (object_index != obj_screensizer && object_index != obj_gmlive && object_index != obj_fmod && object_index != obj_softlockcrash && (object_index != obj_shell || 1))
        instance_destroy(id, false)
}
with (gml_Script_instance_create(0, 0, obj_genericfade))
    deccel = 0.01
