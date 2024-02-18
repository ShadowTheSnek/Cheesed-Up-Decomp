function sh_lockcam() //gml_Script_sh_lockcam
{
    with (obj_camera)
        lock = (!lock)
    return string("Camera lock {0}", (obj_camera.lock ? "ON" : "OFF"));
}

function meta_lockcam() //gml_Script_meta_lockcam
{
    return 
    {
        description: ""
    };
}

