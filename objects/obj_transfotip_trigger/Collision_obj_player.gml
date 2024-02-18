var player = other.id
if (is_callable(condition) && (!self.condition(player)))
    return;
var tip = create_transformation_tip(text, (save_entry == "noone" ? -4 : save_entry))
if is_callable(tip_func)
{
    with (tip)
        player.player.tip_func(other)
}
if is_callable(output)
    self.output(player)
