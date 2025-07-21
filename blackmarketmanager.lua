function BlackMarketManager:unlock_all_akimbo_weapons()
	return managers.player:has_category_upgrade("player", "unlock_all_akimbo_weapons"), "bm_menu_skill_locked_jowi"
end