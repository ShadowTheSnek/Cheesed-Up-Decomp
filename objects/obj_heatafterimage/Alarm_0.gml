x = obj_player1.x
y = obj_player1.y
if (!instance_exists(obj_pizzaface_thunderdark))
{
    visible = false
    is_visible = 0
}
else
{
    visible = obj_player1.visible
    is_visible = 1
}
if (room == rank_room)
    visible = false
if instance_exists(obj_pizzaface_thunderdark)
    alpha = 0.2
Vspeed = random_range(-1, 1)
Hspeed = random_range(-1, 1)
alarm[0] = 10
if (!instance_exists(obj_pizzaface_thunderdark))
    visible = false
