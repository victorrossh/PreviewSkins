#include <amxmodx>
#include <amxmisc>

enum _:itemModels
{
	SkinsName[256],
	HTMLName[64]
}

new const g_szPlayersT[][itemModels] =
{
	{"Gato de Botas",				"t_gatodebotas"},
	{"Joker",						"t_joker"},
	{"Noiado",						"t_noiado"},
	{"Oldman",						"t_oldman"},
	{"Pedrator",					"t_pedrator"},
	{"Puma",						"t_puma"},
	{"Arlequina Girl",				"t_arlequina"},
	{"Mina Girl",					"t_mina"},
	{"Perfect Girl",				"t_perfect"},
	{"Glowpiece Girl \r[VIP]",		"t_glowpiece"},
	{"Sexy Girl \r[VIP]",			"t_sexy"}
}

public plugin_init()
{
	register_plugin("MOTD Players TR", "1.0", "ftl~ && WESPEOOTY");

	register_clcmd("say /pmodels_tr", "showPreviewPlayersTR");
}   

public plugin_natives()
{
	register_native("preview_players_tr", "display_preview_players_tr");
}

public display_preview_players_tr(numParams)
{
	new id = get_param(1);
	return showPreviewPlayersTR(id);
}

public showPreviewPlayersTR(id)
{
	new title[128];
	formatex(title, charsmax(title), "\r[FWO] \d- \wPré-visualizar Models \r(TR)\d");
	new menu = menu_create(title, "showPreviewPlayersTRHandler");

	for(new i = 0; i < sizeof g_szPlayersT; i++)
	{
		formatex(title, charsmax(title), "Model \d- \w%s", g_szPlayersT[i][SkinsName]);
		menu_additem(menu, title, "");
	}
	menu_setprop(menu, MPROP_EXIT, MEXIT_ALL);
	menu_display(id, menu, 0);
    
	return PLUGIN_HANDLED;
}

public showPreviewPlayersTRHandler(id, menu, item)
{
	if (item == MENU_EXIT)
	{
		menu_destroy(menu);
		return PLUGIN_HANDLED;
	}

	new szSkinName[40];
	copy(szSkinName, charsmax(szSkinName), g_szPlayersT[item][SkinsName]);
	replace(szSkinName, charsmax(szSkinName), " \r[VIP]", " [VIP]");
	replace(szSkinName, charsmax(szSkinName), " \r[ADM]", " [ADM]");

	new motd[256], title[64];
	formatex(motd, charsmax(motd), "preview/%s.html", g_szPlayersT[item][HTMLName]);
	formatex(title, charsmax(title), "%s", szSkinName);

	show_motd(id, motd, title);
	
	showPreviewPlayersTR(id);
	return PLUGIN_HANDLED;
}
