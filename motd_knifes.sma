#include <amxmodx>
#include <amxmisc>

enum _:itemModels
{
	SkinsName[256],
	HTMLName[64]
}

new const g_szKnifes[][itemModels] =
{
	{"Abstract",                "k_abstract"},
	{"Blue Ghost",              "k_blueghost"},
	{"Color",                   "k_color"},
	{"Gonna Cry",               "k_gonnacry"},
	{"Hyperbeast",              "k_hyperbeast"},
	{"Kitty",                   "k_kitty"},
	{"Linkin Park",             "k_linkinpark"},
	{"Redline",                 "k_redline"},
	{"Snake",                   "k_snake"},
	{"Steel",                   "k_steel"},
	{"Thug Cat",                "k_thugcat"},
	{"Vulcan",                  "k_vulcan"},

	{"Grizzly \r[VIP]",         "k_grizzly"},
	{"Hunter \r[VIP]",          "k_hunter"},
	{"King \r[VIP]",            "k_king"},
	{"Night \r[VIP]",           "k_night"},
	{"Nightraid \r[VIP]",       "k_nightraid"},
	{"Purple \r[VIP]",          "k_purple"},
	{"Red Ghost \r[VIP]",       "k_redghost"},
	{"Sakura \r[VIP]",          "k_sakura"},

	{"Ahegao \r[ADM]",          "k_ahegao"},
	{"Black \r[ADM]",           "k_black"},
	{"Fire Flower \r[ADM]",     "k_fireflower"},
	{"Ice Phoenix \r[ADM]",     "k_icephoenix"},
	{"Iridescent \r[ADM]",     	"k_iridescent"},
	{"Moon \r[ADM]",            "k_moon"},
	{"Neo Noir \r[ADM]",        "k_neonoir"},
	{"Printstream \r[ADM]",     "k_printstream"}
}

public plugin_init()
{
	register_plugin("MOTD Knifes", "1.0", "ftl~ && WESPEOOTY");

	register_clcmd("say /pknife", "showPreviewKnifes");
}   

public plugin_natives()
{
	register_native("preview_knifes", "display_preview_knifes");
}

public display_preview_knifes(numParams)
{
	new id = get_param(1);
	return showPreviewKnifes(id);
}

public showPreviewKnifes(id)
{
	new title[128];
	formatex(title, charsmax(title), "\r[FWO] \d- \wPré-visualizar Skins\d");
	new menu = menu_create(title, "showPreviewKnifesHandler");

	for(new i = 0; i < sizeof g_szKnifes; i++)
	{
		formatex(title, charsmax(title), "Knife \d- \w%s", g_szKnifes[i][SkinsName]);
		menu_additem(menu, title, "");
	}
	menu_setprop(menu, MPROP_EXIT, MEXIT_ALL);
	menu_display(id, menu, 0);
    
	return PLUGIN_HANDLED;
}

public showPreviewKnifesHandler(id, menu, item)
{
	if (item == MENU_EXIT)
	{
		menu_destroy(menu);
		return PLUGIN_HANDLED;
	}

	new szSkinName[40];
	copy(szSkinName, charsmax(szSkinName), g_szKnifes[item][SkinsName]);
	replace(szSkinName, charsmax(szSkinName), " \r[VIP]", " [VIP]");
	replace(szSkinName, charsmax(szSkinName), " \r[ADM]", " [ADM]");

	new motd[256], title[64];
	formatex(motd, charsmax(motd), "preview/%s.html", g_szKnifes[item][HTMLName]);
	formatex(title, charsmax(title), "%s", szSkinName);

	show_motd(id, motd, title);
	
	showPreviewKnifes(id);
	return PLUGIN_HANDLED;
}
