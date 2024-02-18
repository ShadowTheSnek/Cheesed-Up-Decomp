if (state == states.taxi)
    return;
if (ds_queue_size(followqueue) < LAG_STEPS)
    return;
with (obj_player)
{
    targetRoom = other.targetRoom
    set_lastroom()
    targetDoor = other.targetDoor
    visible = false
    if (state != states.gotoplayer)
        state = states.taxi
    cutscene = 1
    hsp = 0
    vsp = 0
}
grav = 0
state = states.taxi
hsp = 10
image_xscale = 1
vsp = 0
