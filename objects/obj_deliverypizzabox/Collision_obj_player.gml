instance_destroy()
var follower = gml_Script_instance_create(x, y, obj_deliveryfollower)
instance_destroy(obj_clock, false)
with (instance_create_unique(x, y, obj_clock))
{
    objectID = follower.id
    timedgate = 0
}
