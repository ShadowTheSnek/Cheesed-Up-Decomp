with (gml_Script_instance_create(0, 0, obj_pizzahead_whitefade))
{
    persistent = 1
    whitefade = 1.3
    deccel = 0.005
}
fmod_event_instance_set_parameter(snd, "state", 4, 1)
sound_play("event:/sfx/pizzahead/finaleexplosion")
scr_room_goto(boss_pizzafacehub)
