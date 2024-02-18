if global.gameframe_enabled
    gameframe_update()
else
    window_set_caption(global.gameframe_caption_text)
var focus = (window_has_focus() || (!global.option_unfocus_mute))
audio_master_gain(((focus * global.option_master_volume) * 1))
fmod_set_parameter("focus", focus, 0)
global.Pattern_Index += 0.1
