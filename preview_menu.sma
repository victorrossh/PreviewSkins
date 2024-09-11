#include <amxmodx>
#include <cstrike>
#include <preview>

public plugin_init( )
{
	register_plugin("Menu", "1.0", "ftl");
	register_clcmd("say /preview", "showPreviewMenu"); 
}

public plugin_natives()
{   
	register_library("preview")
	register_native("preview_menu", "display_preview");
	register_native("preview_submenu_players", "display_preview_submenu_players");
}

public display_preview(numParams)
{
	new id = get_param(1);
	return showPreviewMenu(id);
}

public display_preview_submenu_players(numParams)
{
	new id = get_param(1);
	return submenu_players(id);
}

public showPreviewMenu(id)
{
	new title[128];
	formatex(title, charsmax(title), "\r[FWO] \d- \wPreview Skins");
	new menu = menu_create(title, "previewHandler");

	menu_additem(menu, "Skins \d- \wButchers", "1");
	menu_additem(menu, "Skins \d- \wKnifes", "2");
	menu_additem(menu, "Models \d- \wPlayers", "3");

	menu_setprop(menu, MPROP_EXIT, MEXIT_ALL);
	menu_display(id, menu, 0);

	return PLUGIN_HANDLED;
}

public previewHandler(id, menu, item)
{
	if( item == MENU_EXIT )
	{
		menu_destroy(menu);
		return PLUGIN_HANDLED;
	}
 
	switch(item)
	{
		case 0:
		{
			preview_butchers(id);
		}
		case 1:
		{
			preview_knifes(id);
		}
		case 2:
		{
			submenu_players(id);
		}
		case MENU_EXIT:
		{
		   	menu_destroy(menu);
			return PLUGIN_HANDLED;
		}
	}
	return PLUGIN_HANDLED;
}

public submenu_players(id)
{
	new title[128];
	formatex(title, charsmax(title), "\r[FWO] \d- \wPreview Models");
	new menu = menu_create(title, "submenuHandler");

	menu_additem(menu, "Models \d- \wPlayers \y(CT)", "1");
	menu_additem(menu, "Models \d- \wPlayers \r(TR)", "2");

	menu_setprop(menu, MPROP_EXIT, MEXIT_ALL);
	menu_display(id, menu, 0);

	return PLUGIN_HANDLED;
}

public submenuHandler(id, menu, item)
{
	if( item == MENU_EXIT )
	{
		menu_destroy(menu);
		return PLUGIN_HANDLED;
	}
 
	switch(item)
	{
		case 0:
		{
			preview_players_ct(id);
		}
		case 1:
		{
			preview_players_tr(id);
		}
		case MENU_EXIT:
		{
		   	menu_destroy(menu);
			return PLUGIN_HANDLED;
		}
	}
	return PLUGIN_HANDLED;
}
