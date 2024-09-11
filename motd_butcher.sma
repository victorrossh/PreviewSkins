#include <amxmodx>
#include <amxmisc>

enum _:itemModels
{
	SkinsName[256],
	HTMLName[64]
}

new const g_szButchers[][itemModels] =
{
	{"Black Wolf",              "b_blackwolf"},
	{"Rainbow",                 "b_rainbow"},
	{"Rias",                    "b_rias"},

	{"Boris \r[VIP]",           "b_boris"},
	{"Carbon \r[VIP]",          "b_carbon"},
	{"Lion \r[VIP]",            "b_lion"},
	{"Red Ghost \r[VIP]",       "b_redghost"},
	{"Xiao \r[VIP]",            "b_xiao"},

	{"Blood Khalifa \r[ADM]",   "b_bloodkhalifa"},
	{"Fade \r[ADM]",            "b_fade"},
	{"Hyperbeast \r[ADM]",      "b_hyperbeast"},
	{"Iridescent \r[ADM]",     	"b_iridescent"},
	{"Neo Noir \r[ADM]",        "b_neonoir"},
	{"Zoro \r[ADM]",            "b_zoro"}
}

public plugin_init()
{
	register_plugin("MOTD Butchers", "1.0", "ftl~ && WESPEOOTY");

	register_clcmd("say /pbut", "showPreviewButchers");
}   

public plugin_natives()
{
	register_native("preview_butchers", "display_preview_butchers");
}

public display_preview_butchers(numParams)
{
	new id = get_param(1);
	return showPreviewButchers(id);
}

public showPreviewButchers(id)
{
	new title[128];
	formatex(title, charsmax(title), "\r[FWO] \d- \wPré-visualizar Skins\d");
	new menu = menu_create(title, "showPreviewButchersHandler");

	for(new i = 0; i < sizeof g_szButchers; i++)
	{
		formatex(title, charsmax(title), "Butcher \d- \w%s", g_szButchers[i][SkinsName]);
		menu_additem(menu, title, "");
	}
	menu_setprop(menu, MPROP_EXIT, MEXIT_ALL);
	menu_display(id, menu, 0);
    
	return PLUGIN_HANDLED;
}

public showPreviewButchersHandler(id, menu, item)
{
	if (item == MENU_EXIT)
	{
		menu_destroy(menu);
		return PLUGIN_HANDLED;
	}

	new szSkinName[40];
	copy(szSkinName, charsmax(szSkinName), g_szButchers[item][SkinsName]);
	replace(szSkinName, charsmax(szSkinName), " \r[VIP]", " [VIP]");
	replace(szSkinName, charsmax(szSkinName), " \r[ADM]", " [ADM]");

	new motd[256], title[64];
	formatex(motd, charsmax(motd), "preview/%s.html", g_szButchers[item][HTMLName]);
	formatex(title, charsmax(title), "%s", szSkinName);

	show_motd(id, motd, title);
	
	showPreviewButchers(id);
	return PLUGIN_HANDLED;
}
