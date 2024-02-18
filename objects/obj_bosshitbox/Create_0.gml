collisioned = 0
dmg = 30
parryable = 0
parried = 0
team = 1
function SUPER_player_hurt@gml_Object_obj_bosshitbox_Create_0(argument0, argument1) //gml_Script_SUPER_player_hurt@gml_Object_obj_bosshitbox_Create_0
{
    if ((!collisioned) && argument1.state != (145 << 0))
    {
        if instance_exists(obj_bosscontroller)
            obj_bosscontroller.player_hp -= argument0
        collisioned = 1
        with (argument1)
        {
            var lag = 8
            if (state == states.chainsaw || state == states.hit)
            {
                x = hitX
                y = hitY
            }
            hitLag = lag
            hitX = x
            hitY = y
            xscale = (x != other.x ? sign((other.x - x)) : other.image_xscale)
            hitxscale = (x != other.x ? sign((other.x - x)) : other.image_xscale)
            sprite_index = spr_hurt
            hithsp = 15
            hitstunned = 100
            hitvsp = -8
            state = states.hit
            gml_Script_instance_create(other.x, other.y, obj_parryeffect)
            create_slapstar(x, y)
            create_slapstar(x, y)
            create_baddiegibs(x, y)
            create_baddiegibs(x, y)
            with (obj_camera)
            {
                shake_mag = 3
                shake_mag_acc = (3 / room_speed)
            }
        }
    }
}

function SUPER_parry@gml_Object_obj_bosshitbox_Create_0() //gml_Script_SUPER_parry@gml_Object_obj_bosshitbox_Create_0
{
    if (!parried)
    {
        team = 0
        parried = 1
    }
}

function SUPER_boss_hurt@gml_Object_obj_bosshitbox_Create_0(argument0) //gml_Script_SUPER_boss_hurt@gml_Object_obj_bosshitbox_Create_0
{
    if ((!collisioned) && team != argument0.team)
    {
        with (argument0)
            self.boss_hurt_noplayer(other.dmg)
        collisioned = 1
    }
}

function boss_hurt@gml_Object_obj_bosshitbox_Create_0(argument0) //gml_Script_boss_hurt@gml_Object_obj_bosshitbox_Create_0
{
    self.SUPER_boss_hurt(argument0)
}

function parry@gml_Object_obj_bosshitbox_Create_0() //gml_Script_parry@gml_Object_obj_bosshitbox_Create_0
{
    self.SUPER_parry()
}

function player_hurt@gml_Object_obj_bosshitbox_Create_0(argument0, argument1) //gml_Script_player_hurt@gml_Object_obj_bosshitbox_Create_0
{
    self.SUPER_player_hurt(argument0, argument1)
}

