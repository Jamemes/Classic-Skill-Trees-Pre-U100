function MenuComponentManager:create_skilltree_new_gui(node)
	self:close_skilltree_new_gui()
	
	self._skilltree_gui = SkillTreeGui:new(self._ws, self._fullscreen_ws, node)
	self._old_skilltree = nil
	self._new_skilltree_gui_active = true

	self:enable_skilltree_gui()
end

Hooks:Add("MenuManagerBuildCustomMenus", "Classic_Skilltree_item", function(menu_manager, nodes)
	for _, id in pairs({"main", "lobby"}) do
		if nodes[id] then 
			local position = 1
			for index, item in pairs(nodes[id]._items or {}) do
				if item._parameters.name == "inventory" then
					position = index + 1
			
					break
				end
			end

			local button = deep_clone(MenuHelper.menubutton_to_clone)
			button._parameters.name = "skilltree"
			button._parameters.text_id = "menu_skilltree"
			button._parameters.help_id = "menu_skilltree_help"
			button._parameters.icon = "guis/textures/pd2/shared_skillpoint_symbol"
			button._parameters.icon_visible_callback = "got_skillpoint_to_spend"
			button._parameters.next_node = "skilltree_new"
			button._parameters.font = "fonts/font_large_mf"
			button._parameters.font_size = 27
			
			table.insert(nodes[id]._items, position, button)
		end
	end
end)

function MenuComponentManager:on_skill_unlocked(...)
	if self._skilltree_gui then
		self._skilltree_gui:on_skill_unlocked(...)
	end
end