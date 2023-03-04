///@desc Initialize GPU settings

//Disable application surface because we'll draw this manually
application_surface_draw_enable(false);
//Disable surface depth because we don't need it in 2D (reduces VRAM usage)
surface_depth_disable(true);

//Set font and color for text
draw_set_font(fnt_main);
draw_set_color(c_black);

//Initialize variable for lighting surface
surf_light = -1;
//Surface mode (0 = new, 16-bit, 1 = old, 8-bit)
surf_mode = 0;

//Ambient light color
light_ambient_color = #000000;
//Number of lights in demo
light_num = 100;