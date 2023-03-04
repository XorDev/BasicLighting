///@desc Draw lights

//Make sure the light surface exists!
if !surface_exists(surf_light)
{
	//Match the width and height of the application surface
	var _w,_h,_format;
	_w = surface_get_width(application_surface);
	_h = surface_get_height(application_surface);
	//Pick format depending on mode
	_format = surf_mode ? surface_rgba8unorm : surface_rgba16float
	//Create surface
	surf_light = surface_create(_w,_h, _format);
}

//Draw lights to light surface
surface_set_target(surf_light);
//Start with ambient light color
draw_clear(light_ambient_color);

//Apply view coordinates
camera_apply(view_camera[0]);
//Use additive blending for lights
gpu_set_blendmode(bm_add);
//Loop through all lights
for(var i = 0; i<light_num; i++)
{
	var _t,_x,_y,_s,_c;
	_t = 0;//get_timer() / 1000000;					//Time in seconds for movement
	_x = 0.5 + 0.5 * cos(i+_t*.5);					//Light x-position (0 to 1)
	_y = 0.5 + 0.5 * sin(i*i+_t*.7);				//Light y-position (0 to 1)
	_s = 3.0 + 2.0 * cos(i*i*i);				//Light scale
	_c = make_color_hsv(i*158%255, 255, 255);//Light color
	
	//Draw light sprite
	draw_sprite_ext(spr_light,0,_x*room_width,_y*room_height,_s,_s,0,_c,1);
}
//Finish
surface_reset_target();

//Finally, blend it with the application surface
surface_set_target(surf_light);
gpu_set_blendmode_ext(bm_dest_color,bm_zero);
draw_surface(application_surface,0,0);
gpu_set_blendmode(bm_normal);
surface_reset_target();

//Draw blended result
draw_surface(surf_light,0,0);

//Draw demo text
draw_text(32,32,surf_mode ? "Old, 8-bit" : "New, 16-bit");