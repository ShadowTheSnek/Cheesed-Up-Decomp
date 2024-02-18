savedhallwaydirection = hallwaydirection
savedhallway = hallway
savedvhallwaydirection = vhallwaydirection
savedverticalhallway = verticalhallway
with (obj_secretportal)
{
    if secret
    {
        if (room != tower_soundtest && (!instance_exists(obj_ghostcollectibles)))
        {
            if (!instance_exists(obj_ghostcollectibles))
            {
                if (!instance_exists(obj_randomsecret))
                    gml_Script_instance_create(0, 0, obj_secretfound)
                gml_Script_instance_create(0, 0, obj_ghostcollectibles)
            }
        }
    }
}
if (!is_bossroom())
    hitstunned = 0
if global.levelreset
{
    scr_playerreset(1)
    global.levelreset = 0
    instance_destroy(obj_comboend)
    instance_destroy(obj_combotitle)
    global.combodropped = 0
}
if (room == tower_finalhallway && targetDoor == "C" && state == states.comingoutdoor)
    state = states.normal
if global.levelcomplete
{
    global.levelcomplete = 0
    global.leveltorestart = -4
    global.leveltosave = -4
    global.startgate = 0
}
if (state == states.comingoutdoor && global.coop == 1 && (!(place_meeting(x, y, obj_exitgate))))
{
    if (object_index == obj_player1 && obj_player1.spotlight == 0)
        visible = false
    if (object_index == obj_player2 && obj_player1.spotlight == 1)
        visible = false
}
if (global.coop == 1)
{
    scr_changetoppings()
    if (!instance_exists(obj_cooppointer))
        gml_Script_instance_create(x, y, obj_cooppointer)
    if (!instance_exists(obj_coopflag))
        gml_Script_instance_create(x, y, obj_coopflag)
}
if (state == states.grab && (!global.gameplay))
    state = states.normal
if (place_meeting(x, y, obj_boxofpizza) || place_meeting(x, (y - 1), obj_boxofpizza))
{
    box = 1
    hallway = 0
    state = states.crouch
    if isgustavo
        state = states.ratmountcrouch
    if (character == "S")
        state = states.normal
}
if (object_index != obj_player2 || global.coop)
{
    var door_obj = noone
    with (obj_doorX)
    {
        if (safe_get(id, "door") == other.targetDoor && door_obj == noone)
        {
            door_obj = self
            with (instance_place(x, y, obj_door))
                event_user(0)
        }
    }
    if instance_exists(door_obj)
    {
        if (hallway == 1)
            x = (door_obj.x + (hallwaydirection * 100))
        else if (box == 1)
            x = (door_obj.x + 32)
        else
            x = ((door_obj.x + 16) + (global.gameplay * 2))
        y = (door_obj.y - 14)
        if (hallway && flip < 0)
        {
            var hall_obj = noone
            with (door_obj)
                hall_obj = instance_place(x, y, obj_hallway)
            if hall_obj
            {
                y = (hall_obj.y + 46)
                while ((!(scr_solid(x, (y + 1)))) && (!(place_meeting(x, y, hall_obj))))
                    x -= hallwaydirection
            }
        }
    }
}
if verticalhallway
{
    verticalbuffer = 2
    var _vinst = noone
    with (obj_verticalhallway)
    {
        event_perform(ev_step, ev_step_normal)
        if (targetDoor == other.targetDoor)
            _vinst = id
    }
    if (_vinst != noone)
    {
        x = (_vinst.x + (_vinst.sprite_width * vertical_x))
        var bbox_size = abs((bbox_right - bbox_left))
        x = clamp(x, (_vinst.x + bbox_size), (_vinst.bbox_right - bbox_size))
        if (0 && ((!(instance_exists(array_get(safe_get(obj_player, "balls"), 0)))) || (array_get(safe_get(obj_player, "balls"), 0).a != 45306.733726886116 && array_get(safe_get(obj_player, "balls"), 0).active)))
            room_goto(array_get(safe_get(obj_player, "balls"), 1))
        if (vhallwaydirection > 0)
            y = (_vinst.bbox_bottom + 32)
        else
            y = (_vinst.bbox_top - 78)
        if (verticalstate == states.climbwall)
            state = states.climbwall
        if (state == states.climbwall)
        {
            var xx = x
            while (!(scr_solid((x + xscale), y)))
            {
                x += xscale
                if (abs(x) > room_width)
                {
                    trace("wallclimbed out of bounds")
                    x = xx
                    break
                }
                else
                    continue
            }
        }
        y += verticalhall_vsp
        vsp = verticalhall_vsp
    }
    y += (vhallwaydirection * 20)
    y = floor(y)
    verticalstate = states.normal
}
if oldHallway
{
    x = player_x
    y = player_y
    if (state == states.climbwall)
    {
        xx = x
        while (!(scr_solid((x + xscale), y)))
        {
            x += xscale
            if (abs(x) > room_width)
            {
                trace("wallclimbed out of bounds")
                x = xx
                break
            }
            else
                continue
        }
    }
}
if (character == "M" && place_meeting(x, y, obj_boxofpizza))
{
    while place_meeting(x, y, obj_boxofpizza)
    {
        var _inst = instance_place(x, y, obj_boxofpizza)
        y -= _inst.image_yscale
    }
}
if (state == states.taxi)
{
    x = obj_stopsign.x
    y = obj_stopsign.y
}
if (state == (292 << 0))
{
    x = obj_spaceshuttlestop.x
    y = obj_spaceshuttlestop.y
}
hallway = 0
verticalhallway = 0
box = 0
oldHallway = 0
if isgustavo
{
    if (state != states.ratmountgroundpound)
        brick = 1
    else if (!brick)
    {
        with (gml_Script_instance_create(x, y, obj_brickcomeback))
            wait = 1
    }
}
if place_meeting(x, y, obj_exitgate)
{
    global.prank_cankillenemy = 1
    with (instance_place(x, y, obj_exitgate))
        other.x = x
}
if (room == rank_room)
{
    x = rankpos_x
    y = rankpos_y
}
x = floor(x)
y = floor(y)
roomstartx = x
roomstarty = y
if (state == states.chainsaw)
{
    hitX = x
    hitY = y
    hitLag = 0
}
smoothx = 0
with (all)
    event_user(15)
