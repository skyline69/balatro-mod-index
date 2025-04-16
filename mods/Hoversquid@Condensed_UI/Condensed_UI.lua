-- Class
Condensed_UI = Object:extend()

function Condensed_UI:init(args)
  local def = {n=G.UIT.ROOT, config={align = "cm",colour=G.C.CLEAR}, nodes={
      {n=G.UIT.R, config={align="cm",maxw=2.075,colour=G.C.CLEAR},nodes={
          self:gen_blind_sprite('Small', G.GAME.round_resets.blind_states.Small),
          self:gen_blind_sprite("Big", G.GAME.round_resets.blind_states.Big),
          self:gen_blind_sprite("Boss", G.GAME.round_resets.blind_states.Boss),
      }}
  }}
  self.uibox=UIBox{definition=def,config={major = G.HUD:get_UIE_by_ID('blind_tracker'),align = 'cm',debug=true,colour=G.C.CLEAR,offset={x=0,y=0.05}}}
    -- offset={x=-6.5, y=5}}
end

function Condensed_UI:set_orbitals(type)
  G.GAME.orbital_choices = G.GAME.orbital_choices or {}
  G.GAME.orbital_choices[G.GAME.round_resets.ante] = G.GAME.orbital_choices[G.GAME.round_resets.ante] or {}
  if not G.GAME.orbital_choices[G.GAME.round_resets.ante][type] then 
      local _poker_hands = {}
      for k, v in pairs(G.GAME.hands) do
          if v.visible then _poker_hands[#_poker_hands+1] = k end
      end
      sayTable(G.GAME.orbital_choices[G.GAME.round_resets.ante], "set_orbitals: START")
      G.GAME.orbital_choices[G.GAME.round_resets.ante][type] = pseudorandom_element(_poker_hands, pseudoseed('orbital'))
      sayTable(G.GAME.orbital_choices[G.GAME.round_resets.ante], "set_orbitals: SET")
  end
end

function printTable(o, indent)
  if type(o) == 'table' then
     local s = '{ '
     for k,v in pairs(o) do
      if type(k) ~= 'number' then k = '"'..k..'"' end
      s = s .. '['..k..'] = ' .. printTable(v) .. ','
      if indent == true then
        s = s.."\n"
      end
     end
     return s .. '} '
  else
     return tostring(o)
  end
end

function sayTable(table, label, indent)
if label ~= nil then
  tableLabel = "--------------"..label.."--------------"
  labelSize = string.len(tableLabel)
  trailingLabel = ""
  for i = 0, labelSize do
      trailingLabel = trailingLabel .. "-"
  end

  print("\n"..tableLabel.."\n\n"..printTable(table, indent).."\n"..trailingLabel)
  else
      print(printTable(table, indent))
  end
end

function Condensed_UI:gen_blind_sprite(type, state, tags)
  local sprite, offset
  offset =  {x=2,y=-2}
  tags = tags or true
  local tag_type = G.GAME.round_resets.blind_tags[type]
  -- local tag_type = 'tag_orbital'
  if tag_type == 'tag_orbital' then self:set_orbitals(type) end
  if type ~= "Boss" and tags == true then
    -- sayTable(G.GAME.round_resets.blind_tags[type], "BLIND TAG FOR TYPE: " .. type .. ":")
    local _tag = Tag(tag_type, nil, type)
    -- local _tag = Tag('tag_orbital', nil, type)
    local _, _tag_sprite = _tag:generate_UI(0.625,offset)
    sprite = _tag_sprite
  else -- generate Boss Blind sprite and hover UI
    sayTable(G.GAME.round_resets.blind_choices[type], "BLIND TYPE:")
    sprite = self:generate_boss_sprite(G.P_BLINDS[G.GAME.round_resets.blind_choices[type]], offset)
  end

  local sprite_node
  if state == "Defeated" or state == "Skipped" or state == "Current" then
      -- sprite_node = {n=G.UIT.C, config={align = "cm"},nodes={}}
      return nil
  else
      print("TRACKER - " .. type .. " STATE: " .. state)
      local uiDef = UIBox{definition=
          {n=G.UIT.ROOT, config={align = "cm",colour=G.C.CLEAR}, nodes={
          {n=G.UIT.O, config={maxh=0.5,minw=2,object = sprite,align="cm"}}
        }}, config={align="cm"}
      }
      sprite_node = {n=G.UIT.C, config={align = "cm"},nodes={
      {n=G.UIT.O, config={id='tracker_'..type,align = "cm", object=uiDef}
      }}}
  end
  return sprite_node
  -- table.insert(node.nodes, sprite_node)
end

function Condensed_UI:generate_boss_sprite(blind_config, offset)

  local sprite = AnimatedSprite(0,0, 0.575, 0.575, G.ANIMATION_ATLAS['blind_chips'], blind_config.pos)
  sprite:define_draw_steps({
  {shader = 'dissolve', shadow_height = 0.05},
  {shader = 'dissolve'}
  })

  -- WIP: leverage card uibox to make localized boss info tag
  -- sprite.float = true
  -- sprite.states.hover.can = true
  -- sprite.states.drag.can = false
  -- sprite.states.collide.can = true
  -- sprite.config = {tag = self, force_focus = true}
  -- sprite.hover = function(_self)
  --   if not G.CONTROLLER.dragging.target or G.CONTROLLER.using_touch then
  --       if not _self.hovering and _self.states.visible then
  --           _self.hovering = true
  --           if _self == sprite then
  --               _self.hover_tilt = 3
  --               _self:juice_up(0.05, 0.02)
  --               play_sound('paper1', math.random()*0.1 + 0.55, 0.42)
  --               play_sound('tarot2', math.random()*0.1 + 0.55, 0.09)
  --           end

            -- needs to pass in localized boss info
            -- get_bossui_table(sprite)
            -- self:get_uibox_table(sprite)
            -- _self.config.h_popup =  G.UIDEF.card_h_popup(_self)
            -- _self.config.h_popup_config ={align = 'cl', offset = {x=-0.1+offset.x,y=0+offset.y},parent = _self}
            -- Node.hover(_self)
            -- if _self.children.alert then 
            --     _self.children.alert:remove()
            --     _self.children.alert = nil--------------------------------------------
            --     if self.key and G.P_TAGS[self.key] then G.P_TAGS[self.key].alerted = true end
            --     G:save_progress()
            -- end
    --     end
    -- end
  -- end
  -- sprite.stop_hover = function(_self) _self.hovering = false; Node.stop_hover(_self); _self.hover_tilt = 0 end
  return sprite
end

function get_bossui_table(tag_sprite)
  
  sayTable(self.config.boss_name, "BOSS NAME")
  -- local name_to_check, loc_vars = self.name, {}
  -- tag_sprite.ability_UIBox_table = generate_card_ui(G.P_BLINDS[G.GAME.round_resets.blind_choices[type], nil, loc_vars, 'Boss', nil, (self.hide_ability))
  return tag_sprite
end


function Condensed_UI:update_tracker(next)
    G.HUD_blind_tracker.uibox:remove()
    G.HUD_blind_tracker = Condensed_UI{}
    G.HUD_blind_tracker.uibox:recalculate()
end