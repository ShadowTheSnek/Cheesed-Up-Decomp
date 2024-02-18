if sugary
{
    fmod_event_instance_stop(sugaryrank, 1)
    fmod_event_instance_release(sugaryrank)
}
alarm[1] = 1
textures_offload(["hubgroup"])
