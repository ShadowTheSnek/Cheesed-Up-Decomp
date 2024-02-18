scr_initenemy()
image_speed = 0
color_index = 0
color = 
{
    light: 10790143,
    dark: 5987276
}

invtime = 0
grounded = 0
flash = 0
state = states.idle
substate = states.normal
hsp = 0
vsp = 0
thrown = 0
stunned = 0
movespeed = 0
grav = 0.5
grav2 = 0.5
xscale = 1
touching = 0
contentsurf = -4
contentspr = -4
hp = 999
stunfallspr = sprite_index
destroyable = 0
dashpadbuffer = 0
function anon@432@gml_Object_obj_sucroseiceblock_Create_0() //gml_Script_anon@432@gml_Object_obj_sucroseiceblock_Create_0
{
    if (state != states.hit)
    {
        with (obj_player1)
        {
            tauntstoredmovespeed = movespeed
            tauntstoredsprite = sprite_index
            tauntstoredstate = state
            tauntstoredhsp = hsp
            tauntstoredvsp = vsp
            hitLag = 5
            hitX = x
            hitY = y
            state = states.chainsaw
        }
        hithsp = hsp
        hitvsp = vsp
        hitLag = 5
        hitX = x
        hitY = y
        state = states.hit
    }
}

