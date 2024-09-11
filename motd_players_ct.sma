#include <amxmodx>
#include <amxmisc>

enum _:itemModels
{
	SkinsName[256],
	HTMLName[64]
}

new const g_szPlayersCT[][itemModels] =
{
	{"Anonymous",					"ct_anonymous"},
	{"Death",						"ct_death"},
	{"Noiado",						"ct_noiado"},
	{"Oldman",						"ct_oldman"},
	{"Pedrator",					"ct_pedrator"},
	{"Puma",						"ct_puma"},
	{"Miku Girl",					"ct_miku"},
	{"Mina Girl",					"ct_mina"},
	{"Perfect Girl",				"ct_perfect"},
	{"Glowpiece Girl \r[VIP]",		"ct_glowpiece"},
	{"Sexy Girl \r[VIP]",			"ct_sexy"}
}

public plugin_init()
{
	register_plugin("MOTD Players CT", "1.0", "ftl~ && WESPEOOTY");

	register_clcmd("say /pmodels_ct", "showPreviewPlayersCT");
}   

public plugin_natives()
{
	register_native("preview_players_ct", "display_preview_players_ct");
}

public display_preview_players_ct(numParams)
{
	new id = get_param(1);
	return showPreviewPlayersCT(id);
}

public showPreviewPlayersCT(id)
{
	new title[128];
	formatex(title, charsmax(title), "\r[FWO] \d- \wPré-visualizar Models \y(CT)\d");
	new menu = menu_create(title, "showPreviewPlayersCTHandler");

	for(new i = 0; i < sizeof g_szPlayersCT; i++)
	{
		formatex(title, charsmax(title), "Model \d- \w%s", g_szPlayersCT[i][SkinsName]);
		menu_additem(menu, title, "");
	}
	menu_setprop(menu, MPROP_EXIT, MEXIT_ALL);
	menu_display(id, menu, 0);
    
	return PLUGIN_HANDLED;
}

public showPreviewPlayersCTHandler(id, menu, item)
{
	if (item == MENU_EXIT)
	{
		menu_destroy(menu);
		return PLUGIN_HANDLED;
	}

	new szSkinName[40];
	copy(szSkinName, charsmax(szSkinName), g_szPlayersCT[item][SkinsName]);
	replace(szSkinName, charsmax(szSkinName), " \r[VIP]", " [VIP]");
	replace(szSkinName, charsmax(szSkinName), " \r[ADM]", " [ADM]");

	new motd[256], title[64];
	formatex(motd, charsmax(motd), "preview/%s.html", g_szPlayersCT[item][HTMLName]);
	formatex(title, charsmax(title), "%s", szSkinName);

	show_motd(id, motd, title);
	
	showPreviewPlayersCT(id);
	return PLUGIN_HANDLED;
}
