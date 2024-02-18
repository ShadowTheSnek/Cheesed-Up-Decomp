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
        x = Approach(x, target.x, maxspeed)
        y = Approach(y, target.y, maxspeed)
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
if (!hitboxcreate)
{
    hitboxcreate = 1
    with (gml_Script_instance_create(x, y, obj_forkhitbox))
    {
        sprite_index = other.sprite_index
        ID = other.id
    }
}
if ((obj_player1.state == states.keyget || obj_player1.state == states.victory || obj_player1.state == states.frozen || safe_get(obj_pizzagoblinbomb, "state") == (4 << 0)) && (!deactivate))
    self.reset_pos()
if (room == ruin_11 || room == ruin_4 || room == medieval_pizzamart || room == ruin_pizzamart || room == dungeon_pizzamart)
{
    x = (room_width / 2)
    y = -100
}
else if ((!(point_in_rectangle(x, y, (camera_get_view_x(view_camera[0]) - 50), (camera_get_view_y(view_camera[0]) - 50), ((camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])) + 50), ((camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])) + 50)))) && cantp <= 0)
{
    target = instance_nearest(x, y, obj_player1)
    if target
    {
        y = target.y
        x = clamp((target.x + (700 * (-target.xscale))), camera_get_view_x(view_camera[0]), (camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])))
    }
    create_particle(x, y, (9 << 0))
    cantp = (room_speed * 3)
}
if (cantp > 0)
{
    cantp -= 1
    if (room == dungeon_10 || room == dungeon_9 || room == snick_challengeend)
        cantp -= 4
}
else
    cantp = 0
if (--after <= 0)
{
    after = 5
    create_red_afterimage(x, y, sprite_index, image_index, image_xscale)
}
