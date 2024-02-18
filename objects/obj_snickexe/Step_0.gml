if deactivate
{
    if hitboxcreate
    {
        with (obj_forkhitbox)
        {
            if (ID == other.id)
                instance_destroy()
        }
    }
    x = (room_width / 2)
    y = -100
    hitboxcreate = 0
    visible = false
    return;
}
if (!knocked)
{
    var target = instance_nearest(x, y, obj_player)
    if target
    {
        var spd = maxspeed
        if bbox_in_camera(view_camera[0], 50)
            spd *= 1.25
        x = Approach(x, target.x, spd)
        y = Approach(y, target.y, spd)
        if (x != target.x)
            image_xscale = (-(sign((x - target.x))))
        if (target.state == states.parry && distance_to_object(target) < 50 && alarm[0] == -1)
        {
            alarm[0] = 10
            knocked = 1
            var dir = point_direction(x, y, target.x, target.y)
            hspeed = (-(lengthdir_x(16, dir)))
            vspeed = (-(lengthdir_y(16, dir)))
        }
    }
}
else
{
    image_angle -= (((hspeed + vspeed) / 2) * 4)
    with (instance_place(x, y, obj_baddie))
    {
        if (object_index != obj_pizzaballOLD)
            instance_destroy()
    }
}
if (global.snickrematch && object_index == obj_snickexe)
{
    sprite_index = spr_snick_rexe
    with (obj_player1)
    {
        if (character == "S")
            other.sprite_index = spr_snick_exi
    }
    maxspeed = 2.75
    if (room == dungeon_10 || room == dungeon_9 || room == snick_challengeend)
        maxspeed = 3.25
}
var killable = (obj_player1.instakillmove || obj_player1.state == states.handstandjump || obj_player.state == states.punch || obj_player1.state == states.climbwall || obj_player1.state == states.mach2)
if ((!hitboxcreate) && (!killable))
{
    hitboxcreate = 1
    with (gml_Script_instance_create(x, y, obj_forkhitbox))
    {
        sprite_index = other.sprite_index
        ID = other.id
    }
}
if ((place_meeting(x, y, obj_player1) && killable) || obj_player1.state == states.keyget || obj_player1.state == states.victory || obj_player1.state == states.frozen || place_meeting(x, y, obj_playerexplosion) || place_meeting(x, y, obj_dynamiteexplosion) || (safe_get(obj_pizzagoblinbomb, "state") == (4 << 0) && (!deactivate)))
    self.reset_pos()
if (--after <= 0)
{
    after = 5
    create_red_afterimage(x, y, sprite_index, image_index, image_xscale)
}
