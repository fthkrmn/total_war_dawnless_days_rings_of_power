--////////////////////////////////////////////////////////////////////////////////////////////////--
--
--	
--	
--
--////////////////////////////////////////////////////////////////////////////////////////////////--
--[[

Ringbearer is in Hobbiton
    Elves will safekeep the Ring
        Ringbearer moves to Imladris (Human Imladris Quest)
        Ringbearer moves to Mithlond (Human Lindon Quest)
        Ringbearer moves to Lothlorien (Human Lothlorien Quest)
    Men will safekeep the Ring
        Ringbearer moves with Dunedain Rangers (Human Rangers Quest)
        Ringbearer moves to Luneland
        Ringbearer moves to Breeland
        Ringbearer moves to Dol Amroth (Human Gondor Quest)
    Dwarves will safekeep the Ring
        Ringbearer moves to Erebor (Human Erebor Quest)
    Ringbearer captured and the Ring is taken from him
        A ruffian in Eriador has the Ring
        A chief in Ruhadur has the Ring
        A chief in Lossoth has the Ring
        The Ring is brought to Denethor (Human Gondor Quest)
        The Ring is brought to Saruman (Human Isengard Quest)

    
]]

local RINGS_OF_POWER_TABLE = {
    ["the_one_ring"] = {wielder_name = "none", wielder_cqi = -1},
    ["narya"] = {wielder_name = "none", wielder_cqi = -1},
    ["nenya"] = {wielder_name = "names_name_2147365377", wielder_cqi = -1},
    ["vilya"] = {wielder_name = "none", wielder_cqi = -1},
    ["dwarven_ring_3"] = {wielder_name = "none", wielder_cqi = -1},
    ["dwarven_ring_4"] = {wielder_name = "none", wielder_cqi = -1},
    ["dwarven_ring_5"] = {wielder_name = "none", wielder_cqi = -1},
    ["mannish_ring_1"] = {wielder_name = "none", wielder_cqi = -1},
    ["mannish_ring_2"] = {wielder_name = "none", wielder_cqi = -1},
    ["mannish_ring_3"] = {wielder_name = "none", wielder_cqi = -1},
    ["mannish_ring_4"] = {wielder_name = "none", wielder_cqi = -1},
    ["mannish_ring_5"] = {wielder_name = "none", wielder_cqi = -1},
    ["mannish_ring_6"] = {wielder_name = "none", wielder_cqi = -1},
    ["mannish_ring_7"] = {wielder_name = "none", wielder_cqi = -1},
    ["mannish_ring_8"] = {wielder_name = "none", wielder_cqi = -1},
    ["mannish_ring_9"] = {wielder_name = "none", wielder_cqi = -1},
};

local RING_RECIPIENTS_TABLE = {
    ["rom_fact_erebor"] = {encountered = true, has_ring = false, rejected_ring = false},
    ["rom_fact_ironfist"] = {encountered = false, has_ring = false, rejected_ring = false},
    ["rom_fact_blacklock"] = {encountered = false, has_ring = false, rejected_ring = false},
    ["rom_fact_gondor"] = {encountered = true, has_ring = false, rejected_ring = false},
    ["rom_fact_rohan"] = {encountered = false, has_ring = false, rejected_ring = false},
    ["rom_fact_dale"] = {encountered = true, has_ring = false, rejected_ring = false},
    ["rom_fact_anduin_vale"] = {encountered = true, has_ring = false, rejected_ring = false},
    ["rom_fact_umbar"] = {encountered = false, has_ring = false, rejected_ring = false},
    ["rom_fact_harondor"] = {encountered = true, has_ring = false, rejected_ring = false},
    ["rom_fact_harad"] = {encountered = true, has_ring = false, rejected_ring = false},
    ["rom_fact_khand"] = {encountered = true, has_ring = false, rejected_ring = false},
    ["rom_fact_mahuds"] = {encountered = false, has_ring = false, rejected_ring = false},
    ["rom_fact_rhurim"] = {encountered = true, has_ring = false, rejected_ring = false},
    ["rom_fact_haerrim"] = {encountered = false, has_ring = false, rejected_ring = false},
    ["rom_fact_feredrim"] = {encountered = false, has_ring = false, rejected_ring = false},
    ["rom_fact_wainriders"] = {encountered = true, has_ring = false, rejected_ring = false},
    ["rom_fact_balchoth"] = {encountered = true, has_ring = false, rejected_ring = false},
    ["rom_fact_dunland"] = {encountered = false, has_ring = false, rejected_ring = false},
    ["rom_fact_northern_enedwaith"] = {encountered = false, has_ring = false, rejected_ring = false},
    ["rom_fact_southern_enedwaith"] = {encountered = false, has_ring = false, rejected_ring = false},
};

local GOOD_RULER_TRAITS_LIST = {
    "rom_trait_general_event_anduril",
    "rom_trait_general_event_standard_of_elendil",
    "rom_trait_general_personality_all_austere",
    "rom_trait_general_personality_all_cautious",
    "rom_trait_general_personality_all_iron_willed",
    "rom_trait_general_personality_all_kind_hearted",
    "rom_trait_general_personality_all_stoic",
    "rom_trait_general_personality_all_suspicious",
    "rom_trait_general_personality_all_trustworthy",
    "rom_trait_general_personality_dunedain_far_seeing",
    "rom_trait_general_personality_dunedain_lorebound",
    "rom_trait_general_personality_dunedain_oathkeeper",
    "rom_trait_general_personality_dunedain_patriot",
    "rom_trait_general_personality_dunedain_shadow_wary",
    "rom_trait_general_personality_dwarven_stone_hardened",
    "rom_trait_general_personality_northmen_stalwart",
};

local BAD_RULER_TRAITS_LIST = {
    "rom_trait_general_background_easterling_slave_driver",
    "rom_trait_general_event_cynical",
    "rom_trait_general_personality_all_ambitious",
    "rom_trait_general_personality_all_cowardly",
    "rom_trait_general_personality_all_greedy",
    "rom_trait_general_personality_all_schemer",
    "rom_trait_general_personality_all_opportunist",
    "rom_trait_general_personality_all_trusting",
    "rom_trait_general_personality_all_tyrannical",
    "rom_trait_general_personality_all_vengeful",
    "rom_trait_general_personality_dwarven_gold_hungry",
    "rom_trait_general_personality_dwarven_secretive",
    "rom_trait_general_personality_easterling_oathbreaker",
    "rom_trait_general_personality_easterling_scornful",
    "rom_trait_general_personality_easterling_war_crazed",
    "rom_trait_general_personality_northmen_double_tongued",
    "rom_trait_general_personality_northmen_glory_seeking",
    "rom_trait_general_personality_northmen_vain",
    "rom_trait_general_personality_southron_merciless",
    "rom_trait_general_personality_southron_veiled_tongue",
    "rom_trait_general_personality_southron_warlike",
    "rom_trait_general_personality_southron_zealot",
};

local RING_RECIPIENT_TOOLTIP_STRINGS = {
	["already_rejected_ring"] = "[[col:red]]This faction rejected a Ring of Power before.[[/col]]||They may re-evaluate their stance later, if they face difficult circumstances.",
	["likelihood_high"] = "Likelihood of taking a ring: [[col:green]]High[[/col]]||",
	["likelihood_moderate"] = "Likelihood of taking a ring: [[col:yellow]]Moderate[[/col]]||",
	["likelihood_low"] = "Likelihood of taking a ring: [[col:red]]Low[[/col]]||",
	["culture_positive"] = "[[col:green]] +Cultural affinity [[/col]]",
    ["traits_positive"] = "[[col:green]] +Ruler's traits [[/col]]",
    ["last_stand"] = "[[col:green]] +Losing ground [[/col]]",
    ["civil_war"] = "[[col:green]] +Civil war [[/col]]",
    ["war_free_peoples"] = "[[col:green]] +Common enemies [[/col]]",
    ["culture_negative"] = "[[col:red]] -Cultural aversion [[/col]]",
    ["traits_negative"] = "[[col:red]] -Ruler's traits [[/col]]",
    ["war_mordor"] = "[[col:red]] -War with Sauron [[/col]]",
};

local RING_ACCEPTANCE_CHANCE_BASE_PCT = 20;                      -- Base percentage chance of a faction accepting a ring
local RING_ACCEPTANCE_CHANCE_PER_BAD_RULER_TRAIT_PCT_ADD = 10;   -- Added to accept chance per negative trait faction leader has
local RING_ACCEPTANCE_CHANCE_PER_GOOD_RULER_TRAIT_PCT_ADD = -10; -- Added to accept chance per virtuous trait faction leader has
local RING_ACCEPTANCE_CHANCE_LAST_STAND_PCT_ADD = 60;            -- Added to accept chance if faction is down to one region
local RING_ACCEPTANCE_CHANCE_CIVIL_WAR_PCT_ADD = 20;             -- Added to accept chance if faction suffers from civil war
local RING_ACCEPTANCE_CHANCE_WAR_WITH_FREE_PEOPLES_PCT_ADD = 10; -- Added to accept chance if faction is at war with Free Peoples
local RING_ACCEPTANCE_CHANCE_WAR_WITH_SAURON_PCT_ADD = -200;     -- Added to accept chance if faction is at war with Evil allegiance
local RING_ACCEPTANCE_CHANCE_DIFFICULTY_EASY_PCT_ADD = 20;       -- Added to accept chance at difficulty level
local RING_ACCEPTANCE_CHANCE_DIFFICULTY_NORMAL_PCT_ADD = 10;     -- Added to accept chance at difficulty level
local RING_ACCEPTANCE_CHANCE_DIFFICULTY_HARD_PCT_ADD = 0;        -- Added to accept chance at difficulty level
local RING_ACCEPTANCE_CHANCE_DIFFICULTY_VERY_HARD_PCT_ADD = 0;   -- Added to accept chance at difficulty level
local RING_ACCEPTANCE_CHANCE_DIFFICULTY_LEGENDARY_PCT_ADD = -10; -- Added to accept chance at difficulty level
local RING_ACCEPTANCE_CHANCE_DUNEDAIN_CULTURE_PCT_MOD = -0.9;    -- Added to calculated accept chance if faction is Dunedain
local RING_ACCEPTANCE_CHANCE_NORTHMEN_CULTURE_PCT_MOD = -0.6;    -- Added to calculated accept chance if faction is Northmen
local RING_ACCEPTANCE_CHANCE_WILDMEN_CULTURE_PCT_MOD = 0.2;      -- Added to calculated accept chance if faction is Wildmen
local RING_ACCEPTANCE_CHANCE_SOUTHRON_CULTURE_PCT_MOD = 0;       -- Added to calculated accept chance if faction is Southrons
local RING_ACCEPTANCE_CHANCE_EASTERLING_CULTURE_PCT_MOD = 0.1;   -- Added to calculated accept chance if faction is Easterlings
local RING_ACCEPTANCE_CHANCE_LONGBEARDS_CULTURE_PCT_MOD = -0.8;  -- Added to calculated accept chance if faction is Longbeards
local RING_ACCEPTANCE_CHANCE_OROCARNI_CULTURE_PCT_MOD = 0;       -- Added to calculated accept chance if faction is Orocarni
local REFUSER_REEVALUATE_RING_OFFER_NEW_LEADER = true;           -- A faction to be eligible for new offer after ruler change?
local REFUSER_REEVALUATE_RING_OFFER_LAST_STAND = true;           -- A faction to be eligible for new offer if down to one region?
local REFUSER_REEVALUATE_RING_OFFER_CIVIL_WAR = true;            -- A faction to be eligible for new offer if it is in civil war?
local REFUSER_REEVALUATE_RING_OFFER_TREATY_WITH_SAURON = true;   -- A faction to be eligible for new offer if treated with Mordor?



cm:register_ui_created_callback(
    function()
		-- Creating custom component with this callback, if local faction is Mordor
        if local_faction == "rom_fact_mordor" then
            output("======= DOMINION OF THE DARK LORD: CREATING CUSTOM PANEL");
            local ui_root = cm:ui_root();

            UIComponent(ui_root:CreateComponent("button_dominion", "ui/campaign ui/dominion"));
            local btn_dominion_favour_uic = UIComponent(ui_root:Find("button_dominion"));
            local dominion_panel_uic = find_uicomponent(ui_root, "button_dominion", "dominion_panel");
            local hud_buttons_uic = find_uicomponent(ui_root, "layout", "hud_center_docker", "hud_center", "button_group_management");
            
            -- Make center docker adopt the button, and root adopt the panel
            hud_buttons_uic:Adopt(btn_dominion_favour_uic:Address());
            btn_dominion_favour_uic:Divorce(dominion_panel_uic:Address())
            ui_root:Adopt(dominion_panel_uic:Address());
            output("======= DOMINION OF THE DARK LORD: FINISHED CREATING CUSTOM PANEL");
        end
    end
);


function Add_Dominion_Listeners()
	if cm:get_local_faction() == "rom_fact_mordor" then
        output("#### STARTING DOMINION OF THE DARK LORD LISTENERS ####");

        cm:add_listener(
            "ComponentLClickUp_TEST",
            "ComponentLClickUp",
            true,
            function(context) 
                output("~~~~~~~~~COMPONENT CLICKED: "..context.string)
            end,
            true
        );

        cm:add_listener(
            "RingRecipientSelectionModalRequested",
            "ComponentLClickUp",
            function(context)
                return context.string == "button_gift_ring_dwarven" or context.string == "button_gift_ring_mannish"
            end,
            function(context) 
                UpdateRingRecipientModal(context);
            end,
            true
        );

        cm:add_listener(
            "MordorEncountersFaction",
            "FactionEncountersOtherFaction",
            function(context)
                return (context:faction():name() == MORDOR_KEY) or (context:other_faction():name() == MORDOR_KEY)
            end,
            function(context)
                MordorEncountersFaction(context);
            end,
            true
        );
    end
end


-- Make a faction discovered by Mordor eligible for a Ring of Power
function MordorEncountersFaction(context)
    local faction_name = context:faction():name()
    if RING_RECIPIENTS_TABLE[faction_name] and not RING_RECIPIENTS_TABLE[faction_name].encountered then
        RING_RECIPIENTS_TABLE[faction_name].encountered = true
    end
    faction_name = context:other_faction():name()
    if RING_RECIPIENTS_TABLE[faction_name] and not RING_RECIPIENTS_TABLE[faction_name].encountered then
        RING_RECIPIENTS_TABLE[faction_name].encountered = true
    end
end


-- Handle visibility of faction entries in the ring gifting popup
-- If coming from a Dwarven Ring, show only Dwarven factions, and vice versa
-- Write the tooltips of factions' likelihood of accepting a ring
function UpdateRingRecipientModal(context)
    local faction_select_popup_list = find_uicomponent(cm:ui_root(), "dominion_panel", "faction_selection_popup", "listview", "list_clip", "list_box");
    for i = 0, faction_select_popup_list:ChildCount() - 1 do
        local faction_slot = UIComponent(faction_select_popup_list:Find(i));
        local faction = tostring(faction_slot:Id());
        local faction_icon = UIComponent(faction_slot:Find("icon"));
        local faction_string = UIComponent(faction_slot:Find("dy_faction"));

        faction_slot:PropagateVisibility(false);
    
        if (RING_RECIPIENTS_TABLE[faction] ~= nil) then
            if (cm:model():world():faction_by_key(faction):is_null_interface() == false) then
                if (RING_RECIPIENTS_TABLE[faction].has_ring == false) and (RING_RECIPIENTS_TABLE[faction].encountered) then
                    if context.string == "button_gift_ring_dwarven" then
                        if faction == "rom_fact_erebor" or faction == "rom_fact_ironfist" or faction == "rom_fact_blacklock" then
                            if (RING_RECIPIENTS_TABLE[faction].rejected_ring) then
                                faction_slot:PropagateVisibility(true);
                                faction_slot:SetDisabled(true);
                                faction_icon:ShaderTechniqueSet("set_greyscale_t0", true);
                                faction_icon:ShaderVarsSet(0.9, 0.35, 0, 0, true);
                                faction_string:ShaderTechniqueSet("red_and_alpha_t0", true);
                                faction_string:ShaderVarsSet(0, 0, 0, 0, true);
                                faction_slot:SetTooltipText(RING_RECIPIENT_TOOLTIP_STRINGS["already_rejected_ring"])
                            else
                                faction_slot:PropagateVisibility(true);
                                faction_slot:SetDisabled(false);
                                faction_icon:SetInteractive(true);
                                faction_icon:ShaderTechniqueSet("normal_t0", true);
                                faction_icon:ShaderVarsSet(0, 0, 0, 0, true);
                                faction_string:ShaderTechniqueSet("normal_t0", true);
                                faction_string:ShaderVarsSet(0, 0, 0, 0, true);
                                -- Construct tooltip from strings
                                local tooltip_strings = UpdateRingRecipientSlotTooltip(faction);
                                local tooltip_text = ""

                                -- Always put likelihood first
                                if tooltip_strings["likelihood_high"] then
                                    tooltip_text = tooltip_text .. tooltip_strings["likelihood_high"].."\n"
                                elseif tooltip_strings["likelihood_moderate"] then
                                    tooltip_text = tooltip_text .. tooltip_strings["likelihood_moderate"].."\n"
                                elseif tooltip_strings["likelihood_low"] then
                                    tooltip_text = tooltip_text .. tooltip_strings["likelihood_low"].."\n"
                                end

                                -- Add the rest of the strings, ensuring each is on a new line
                                for k, v in pairs(tooltip_strings) do
                                    if k ~= "likelihood_high" and k ~= "likelihood_moderate" and k ~= "likelihood_low" then
                                        tooltip_text = tooltip_text ..v.."\n"
                                    end
                                end

                                faction_icon:SetTooltipText(tooltip_text)
                            end
                        end

                    elseif context.string == "button_gift_ring_mannish" then
                        if not (faction == "rom_fact_erebor" or faction == "rom_fact_ironfist" or faction == "rom_fact_blacklock") then
                            if (RING_RECIPIENTS_TABLE[faction].rejected_ring) then
                                faction_slot:PropagateVisibility(true);
                                faction_slot:SetDisabled(true);
                                faction_icon:ShaderTechniqueSet("set_greyscale_t0", true);
                                faction_icon:ShaderVarsSet(0.9, 0.35, 0, 0, true);
                                faction_string:ShaderTechniqueSet("red_and_alpha_t0", true);
                                faction_string:ShaderVarsSet(0, 0, 0, 0, true);
                                faction_slot:SetTooltipText(RING_RECIPIENT_TOOLTIP_STRINGS["already_rejected_ring"])
                            else
                                faction_slot:PropagateVisibility(true);
                                faction_slot:SetDisabled(false);
                                faction_icon:SetInteractive(true);
                                faction_icon:ShaderTechniqueSet("normal_t0", true);
                                faction_icon:ShaderVarsSet(0, 0, 0, 0, true);
                                faction_string:ShaderTechniqueSet("normal_t0", true);
                                faction_string:ShaderVarsSet(0, 0, 0, 0, true);
                                -- Construct tooltip from strings
                                local tooltip_strings = UpdateRingRecipientSlotTooltip(faction);
                                local tooltip_text = ""

                                -- Always put likelihood first
                                if tooltip_strings["likelihood_high"] then
                                    tooltip_text = tooltip_text .. tooltip_strings["likelihood_high"].."\n"
                                elseif tooltip_strings["likelihood_moderate"] then
                                    tooltip_text = tooltip_text .. tooltip_strings["likelihood_moderate"].."\n"
                                elseif tooltip_strings["likelihood_low"] then
                                    tooltip_text = tooltip_text .. tooltip_strings["likelihood_low"].."\n"
                                end

                                -- Add the rest of the strings, ensuring each is on a new line
                                for k, v in pairs(tooltip_strings) do
                                    if k ~= "likelihood_high" and k ~= "likelihood_moderate" and k ~= "likelihood_low" then
                                        tooltip_text = tooltip_text ..v.."\n"
                                    end
                                end

                                faction_icon:SetTooltipText(tooltip_text)
                            end
                        end
                    end
                end
            end
        end
    end
    
    faction_select_popup_list:Layout();
end


function UpdateRingRecipientSlotTooltip(faction_key)
    local payload = {};
    local faction_obj = cm:model():world():faction_by_key(faction_key);
    local faction_ruler_obj = faction_obj:faction_leader();

    local difficulty = cm:model():difficulty_level();
    if difficulty == 1 then
        difficulty = RING_ACCEPTANCE_CHANCE_DIFFICULTY_EASY_PCT_ADD
    elseif difficulty == 0 then
        difficulty = RING_ACCEPTANCE_CHANCE_DIFFICULTY_NORMAL_PCT_ADD
    elseif difficulty == -1 then
        difficulty = RING_ACCEPTANCE_CHANCE_DIFFICULTY_HARD_PCT_ADD
    elseif difficulty == -2 then
        difficulty = RING_ACCEPTANCE_CHANCE_DIFFICULTY_VERY_HARD_PCT_ADD
    elseif difficulty == -3 then
        difficulty = RING_ACCEPTANCE_CHANCE_DIFFICULTY_LEGENDARY_PCT_ADD
    end

    local faction_culture = faction_obj:subculture();
    if faction_culture == "rom_sc_dunedain" then
        faction_culture = RING_ACCEPTANCE_CHANCE_DUNEDAIN_CULTURE_PCT_MOD
        payload["culture_negative"] = RING_RECIPIENT_TOOLTIP_STRINGS["culture_negative"]
    elseif faction_culture == "rom_sc_rohirrim" or faction_culture == "rom_sc_middle_men" then
        faction_culture = RING_ACCEPTANCE_CHANCE_NORTHMEN_CULTURE_PCT_MOD
        payload["culture_negative"] = RING_RECIPIENT_TOOLTIP_STRINGS["culture_negative"]
    elseif faction_culture == "rom_sc_wildmen" then
        faction_culture = RING_ACCEPTANCE_CHANCE_WILDMEN_CULTURE_PCT_MOD
        payload["culture_positive"] = RING_RECIPIENT_TOOLTIP_STRINGS["culture_positive"]
    elseif faction_culture == "rom_sc_southrons" then
        faction_culture = RING_ACCEPTANCE_CHANCE_SOUTHRON_CULTURE_PCT_MOD
    elseif faction_culture == "rom_sc_easterlings" then
        faction_culture = RING_ACCEPTANCE_CHANCE_EASTERLING_CULTURE_PCT_MOD
        payload["culture_positive"] = RING_RECIPIENT_TOOLTIP_STRINGS["culture_positive"]
    elseif faction_culture == "rom_sc_dwarves_erebor" then
        faction_culture = RING_ACCEPTANCE_CHANCE_LONGBEARDS_CULTURE_PCT_MOD
        payload["culture_negative"] = RING_RECIPIENT_TOOLTIP_STRINGS["culture_negative"]
    elseif faction_culture == "rom_sc_dwarves_orocarni" then
        faction_culture = RING_ACCEPTANCE_CHANCE_OROCARNI_CULTURE_PCT_MOD
    end

    local faction_num_regions = faction_obj:region_list():num_items();
    local is_losing_ground = 0
    if faction_num_regions < 2 then
        is_losing_ground = RING_ACCEPTANCE_CHANCE_LAST_STAND_PCT_ADD
        payload["last_stand"] = RING_RECIPIENT_TOOLTIP_STRINGS["last_stand"]
    end

    local faction_civil_war_faction_key = faction_key
    local civil_war = 0
    if string.sub(faction_key, 1, 8) == "rom_fact" then
        faction_civil_war_faction_key = "rom_fact_separatist"..string.sub(faction_key, 9)
    end
    if cm:model():world():faction_exists(faction_civil_war_faction_key) then
        if faction_obj:at_war_with(cm:model():world():faction_by_key(faction_civil_war_faction_key)) then
            civil_war = RING_ACCEPTANCE_CHANCE_CIVIL_WAR_PCT_ADD
            payload["civil_war"] = RING_RECIPIENT_TOOLTIP_STRINGS["civil_war"]
        end
    end

    local warring_free_peoples = 0
    local warring_sauron = 0
    if faction_obj:at_war() then
        local faction_list = cm:model():world():faction_list();
        for i = 0, faction_list:num_items() - 1 do
            local current_faction = faction_list:item_at(i):name()
            if is_faction_good(current_faction) then
                if faction_obj:at_war_with(cm:model():world():faction_by_key(current_faction)) then
                    warring_free_peoples = RING_ACCEPTANCE_CHANCE_WAR_WITH_FREE_PEOPLES_PCT_ADD;
                    payload["war_free_peoples"] = RING_RECIPIENT_TOOLTIP_STRINGS["war_free_peoples"]
                    break;
                end
            end
        end
        if (faction_obj:at_war_with(cm:model():world():faction_by_key("rom_fact_mordor")) or faction_obj:at_war_with(cm:model():world():faction_by_key("rom_fact_dol_guldur")) or faction_obj:at_war_with(cm:model():world():faction_by_key("rom_fact_goblins")) or faction_obj:at_war_with(cm:model():world():faction_by_key("rom_fact_gundabad"))) then
            warring_sauron = RING_ACCEPTANCE_CHANCE_WAR_WITH_SAURON_PCT_ADD;
            payload["war_mordor"] = RING_RECIPIENT_TOOLTIP_STRINGS["war_mordor"]
        end
    end

    local num_positive_traits = 0;
    local num_negative_traits = 0;
    for j = 1, #GOOD_RULER_TRAITS_LIST do
        if faction_ruler_obj:has_trait(GOOD_RULER_TRAITS_LIST[j]) then
            num_positive_traits = num_positive_traits + 1
        end
    end

    for k = 1, #BAD_RULER_TRAITS_LIST do
        if faction_ruler_obj:has_trait(BAD_RULER_TRAITS_LIST[k]) then
            num_negative_traits = num_negative_traits + 1
        end
    end

    if num_positive_traits > num_negative_traits then
        payload["traits_positive"] = RING_RECIPIENT_TOOLTIP_STRINGS["traits_positive"]
    elseif num_negative_traits > num_positive_traits then
        payload["traits_negative"] = RING_RECIPIENT_TOOLTIP_STRINGS["traits_negative"]
    end

    local accept_chance = ((RING_ACCEPTANCE_CHANCE_BASE_PCT) + (difficulty) + (is_losing_ground) + (warring_free_peoples) + (warring_sauron) + (num_negative_traits * RING_ACCEPTANCE_CHANCE_PER_BAD_RULER_TRAIT_PCT_ADD) + (num_positive_traits * RING_ACCEPTANCE_CHANCE_PER_GOOD_RULER_TRAIT_PCT_ADD))
    accept_chance = accept_chance + math.floor(accept_chance * faction_culture)
    accept_chance = math.max(accept_chance, 0);
    accept_chance = math.min(accept_chance, 100);

    if accept_chance < 20 then
        payload["likelihood_low"] = RING_RECIPIENT_TOOLTIP_STRINGS["likelihood_low"]
    elseif accept_chance > 80 then
        payload["likelihood_high"] = RING_RECIPIENT_TOOLTIP_STRINGS["likelihood_high"]
    else
        payload["likelihood_moderate"] = RING_RECIPIENT_TOOLTIP_STRINGS["likelihood_moderate"]
    end

    return payload
end
