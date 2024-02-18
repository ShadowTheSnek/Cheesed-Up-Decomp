pal_swap_init_system(shd_pal_swapper)
global.roommessage = "PIZZA TOWER AT HALLOWEEN"
global.gameframe_caption_text = gml_Script_lang_get_value("caption_halloween")
notification_push((59 << 0), [room])
ds_list_clear(global.saveroom)
ds_list_clear(global.baddieroom)
with (obj_pumpkincounter)
{
    if (counter <= 0)
        create_transformation_tip(gml_Script_lang_get_value("halloween"))
}
instance_destroy(obj_pumpkincounter)
if (obj_player1.state == states.ghost)
    gml_Script_instance_create(0, 0, obj_softlockcrash)
global.collect = 0
