function sh_giveshotgun() //gml_Script_sh_giveshotgun
{
    if (!WC_debug)
        return "You do not have permission to use this command";
    if (!instance_exists(obj_player))
        return (safe_get(obj_pause, "pause") ? "Can't do this while paused" : "The player is not in the room");
    with (obj_player)
    {
        if shotgunAnim
        {
            shotgunAnim = 0
            return "Removed shotgun";
        }
        else
        {
            image_index = 0
            sprite_index = spr_shotgunpullout
            sound_play_3d("event:/sfx/pep/shotgunload", x, y)
            shotgunAnim = 1
            state = states.shotgun
        }
    }
}

function meta_giveshotgun() //gml_Script_meta_giveshotgun
{
    return 
    {
        description: "gives or takes a shotgun from the player"
    };
}

function sh_impulse(argument0) //gml_Script_sh_impulse
{
    if (argument0[1] == "101")
        return sh_giveshotgun();
}

function meta_impulse() //gml_Script_meta_impulse
{
    return 
    {
        hidden: 1
    };
}

