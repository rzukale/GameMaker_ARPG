/// @description Draw textbox
// You can write your code in this editor

NineSliceBoxStretched(sTextBoxBG, x1, y1, x2, y2, background);

draw_set_font(fText);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_black);

var _print = string_copy(message, 1, textProgress);

if ((responses[0] != -1) && textProgress >= string_length(message))
{
	for (var i = 0; i < array_length_1d(responses); i++)
	{
		_print += "\n";
		if (i == responseSelected)
			_print += "> ";
		_print += responses[i];
		if (i == responseSelected)
			_print += " <";
	}
}

draw_text((x1 + x2) / 2, y1 + 8, _print); // text shadow
draw_set_color(c_white);
draw_text((x1 + x2) / 2, y1 + 7, _print); // proper text
