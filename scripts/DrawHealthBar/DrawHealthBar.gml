/// @desc DrawHealthBar(x, y)
/// @arg x x position of bar
/// @arg y y position of bar

for (var i = 1; i <= oPlayerStats.max_hp; i++)
{
	if (i <= oPlayerStats.hp)
	{
		var sprite = sHealthContainer;
	}
	else
	{
		var sprite = sHealthContainerEmpty;
	}
	
	draw_sprite(sprite, 0, argument0 + (i-1) * sprite_get_width(sprite), argument1);
}