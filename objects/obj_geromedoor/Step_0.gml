if (global.gerome || image_index != 0)
{
    if (!uparrow)
    {
        uparrow = 1
        uparrowID = scr_create_uparrowhitbox()
    }
}
else if uparrow
{
    uparrow = 0
    instance_destroy(uparrowID)
}
var player = instance_place(x, y, obj_player)
if (player && (!global.horse) && (player.state == states.normal || player.state == states.ratmount || player.state == states.mach1 || player.state == states.pogo || player.state == states.mach2 || player.state == states.mach3 || player.state == states.Sjumpprep) && player.key_up && player.grounded && (global.gerome == 1 || image_index == 1))
{
    add_saveroom()
    sound_play_3d("event:/sfx/misc/keyunlock", x, y)
    sound_play("event:/sfx/misc/cheers")
    if global.gerome
    {
        if (!sugary)
        {
            obj_geromefollow.visible = false
            obj_geromefollow.do_end = 1
            with (gml_Script_instance_create((player.x - 30), player.y, obj_geromeanim))
            {
                sprite_index = spr_gerome_opendoor
                image_index = 0
                image_speed = 0.35
            }
        }
        with (player)
        {
            targetRoom = other.targetRoom
            targetDoor = other.targetDoor
            state = states.victory
            image_index = 0
            if global.gameplay
            {
                smoothx = (x - (other.x + 50))
                x = (other.x + 50)
            }
        }
        global.gerome = 0
    }
    image_index = 1
}
if (player && floor(player.image_index) == (player.image_number - 1) && (player.state == states.victory || player.state == states.door))
{
    with (player)
    {
        targetDoor = other.targetDoor
        targetRoom = other.targetRoom
        if (!instance_exists(obj_fadeout))
            gml_Script_instance_create(x, y, obj_fadeout)
    }
}
with (instance_place(x, y, obj_doorX))
    other.targetDoor = door
