if (instance_exists(baddieID) && (!baddieID.invincible) && baddieID.hp < 1)
{
    instance_destroy()
    instance_destroy(baddieID)
}
else if (instance_exists(baddieID) && (!baddieID.invincible))
{
    baddieID.hp -= 1
    global.hit += 1
    global.combotime = 60
    gml_Script_instance_create(baddieID.x, baddieID.y, obj_slapstar)
    gml_Script_instance_create(baddieID.x, baddieID.y, obj_baddiegibs)
    baddieID.flash = 1
    baddieID.state = states.staggered
    baddieID.stagger_buffer = baddieID.stagger_max
    gml_Script_instance_create(x, y, obj_bumpeffect)
    gml_Script_instance_create(baddieID.x, baddieID.y, obj_bangeffect)
    baddieID.hsp = (obj_player1.xscale * 5)
    baddieID.stagger_dir = (-baddieID.image_xscale)
}
