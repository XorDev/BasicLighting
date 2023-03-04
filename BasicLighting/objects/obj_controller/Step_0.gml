///@desc Toggle surface mode for demo

//If you press anything, the mode will toggle
if (mouse_check_button_pressed(mb_any) || keyboard_check_pressed(vk_anykey))
{
	//Toggle mode
	surf_mode = !surf_mode;
	
	//Force the surface to regenerate
	surface_free(surf_light)
}