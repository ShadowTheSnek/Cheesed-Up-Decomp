function scr_resetslapbuffer() //gml_Script_scr_resetslapbuffer
{
    input_buffer_slap = 0
    input_buffer_grab = 0
}

function scr_slapbuffercheck() //gml_Script_scr_slapbuffercheck
{
    return (input_buffer_slap > 0 || input_buffer_grab > 0);
}

