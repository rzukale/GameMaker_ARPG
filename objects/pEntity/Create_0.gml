/// @description Entity setup
// You can write your code in this editor

z = 0;
flash = 0;
flashShader = shWhiteFlash;
uFlash = shader_get_uniform(flashShader, "flash");
lifted = 0;
thrown = false;
entityDropList = -1;
collisionMap = layer_tilemap_get_id(layer_get_id("Col"));
spd = 0;
