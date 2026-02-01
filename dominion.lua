--////////////////////////////////////////////////////////////////////////////////////////////////--
--
--	
--	
--
--////////////////////////////////////////////////////////////////////////////////////////////////--


local RING_OFFER_DILEMMA_PREPEND = "rom_dilemma_rings_of_power_offer_";
local RING_RETURN_DILEMMA_PREPEND = "rom_dilemma_rings_of_power_return_";
local MANNISH_RING_OF_POWER_ANCILLARY_KEY = "rom_ancillary_mannish_ring_of_power";
local DWARVEN_RING_OF_POWER_ANCILLARY_KEY = "rom_ancillary_dwarven_ring_of_power";
local LAST_SELECTED_RING = "";

local RINGS_OF_POWER_TABLE = {
    ["the_one_ring"] = {bearer_name = "unknown", bearer_cqi = -1, turns_held = 0, bearer_faction = "unknown"},
    ["narya"] = {bearer_name = "unknown", bearer_cqi = -1, turns_held = 0, bearer_faction = "unknown"},
    ["nenya"] = {bearer_name = "names_name_2147365377", bearer_cqi = -1, turns_held = 0, bearer_faction = "rom_fact_lothlorien"},
    ["vilya"] = {bearer_name = "unknown", bearer_cqi = -1, turns_held = 0, bearer_faction = "unknown"},
    ["dwarven_ring_3"] = {bearer_name = "names_name_2147366365", bearer_cqi = -1, turns_held = 0, bearer_faction = "rom_fact_mordor"},
    ["dwarven_ring_4"] = {bearer_name = "names_name_2147366365", bearer_cqi = -1, turns_held = 0, bearer_faction = "rom_fact_mordor"},
    ["dwarven_ring_5"] = {bearer_name = "names_name_2147366365", bearer_cqi = -1, turns_held = 0, bearer_faction = "rom_fact_mordor"},
    ["mannish_ring_1"] = {bearer_name = "names_name_2147366365", bearer_cqi = -1, turns_held = 0, bearer_faction = "rom_fact_mordor"},
    ["mannish_ring_2"] = {bearer_name = "names_name_2147366365", bearer_cqi = -1, turns_held = 0, bearer_faction = "rom_fact_mordor"},
    ["mannish_ring_3"] = {bearer_name = "names_name_2147366365", bearer_cqi = -1, turns_held = 0, bearer_faction = "rom_fact_mordor"},
    ["mannish_ring_4"] = {bearer_name = "names_name_2147366365", bearer_cqi = -1, turns_held = 0, bearer_faction = "rom_fact_mordor"},
    ["mannish_ring_5"] = {bearer_name = "names_name_2147366365", bearer_cqi = -1, turns_held = 0, bearer_faction = "rom_fact_mordor"},
    ["mannish_ring_6"] = {bearer_name = "names_name_2147366365", bearer_cqi = -1, turns_held = 0, bearer_faction = "rom_fact_mordor"},
    ["mannish_ring_7"] = {bearer_name = "names_name_2147366365", bearer_cqi = -1, turns_held = 0, bearer_faction = "rom_fact_mordor"},
    ["mannish_ring_8"] = {bearer_name = "names_name_2147366365", bearer_cqi = -1, turns_held = 0, bearer_faction = "rom_fact_mordor"},
    ["mannish_ring_9"] = {bearer_name = "names_name_2147366365", bearer_cqi = -1, turns_held = 0, bearer_faction = "rom_fact_mordor"},
};

local RING_RECIPIENTS_TABLE = {
    ["rom_fact_erebor"] = {encountered = true, refusers = {}},
    ["rom_fact_ironfist"] = {encountered = false, refusers = {}},
    ["rom_fact_blacklock"] = {encountered = false, refusers = {}},
    ["rom_fact_gondor"] = {encountered = true, refusers = {}},
    ["rom_fact_rohan"] = {encountered = false, refusers = {}},
    ["rom_fact_dale"] = {encountered = true, refusers = {}},
    ["rom_fact_anduin_vale"] = {encountered = true, refusers = {}},
    ["rom_fact_umbar"] = {encountered = false, refusers = {}},
    ["rom_fact_harondor"] = {encountered = true, refusers = {}},
    ["rom_fact_harad"] = {encountered = true, refusers = {}},
    ["rom_fact_khand"] = {encountered = true, refusers = {}},
    ["rom_fact_mahuds"] = {encountered = false, refusers = {}},
    ["rom_fact_rhurim"] = {encountered = true, refusers = {}},
    ["rom_fact_haerrim"] = {encountered = false, refusers = {}},
    ["rom_fact_feredrim"] = {encountered = false, refusers = {}},
    ["rom_fact_wainriders"] = {encountered = true, refusers = {}},
    ["rom_fact_balchoth"] = {encountered = true, refusers = {}},
    ["rom_fact_dunland"] = {encountered = false, refusers = {}},
    ["rom_fact_northern_enedwaith"] = {encountered = false, refusers = {}},
    ["rom_fact_southern_enedwaith"] = {encountered = false, refusers = {}},
};

local GOOD_CHARACTER_TRAITS_LIST = {
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

local BAD_CHARACTER_TRAITS_LIST = {
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
	["already_rejected_ring"] = "[[col:red]]This character rejected a Ring of Power.[[/col]]||Characters may re-evaluate their stances in time, especially if they face difficult circumstances or when a new ruler leads their faction.",
	["likelihood_high"] = "Likelihood of accepting a ring: [[col:green]]High[[/col]]||",
	["likelihood_moderate"] = "Likelihood of accepting a ring: [[col:yellow]]Moderate[[/col]]||",
	["likelihood_low"] = "Likelihood of accepting a ring: [[col:red]]Low[[/col]]||",
	["culture_positive"] = "\t[[col:green]]+Cultural affinity [[/col]]",
    ["traits_positive"] = "\t[[col:green]] +Character's traits [[/col]]",
    ["last_stand"] = "\t[[col:green]] +Losing ground [[/col]]",
    ["civil_war"] = "\t[[col:green]] +Civil war [[/col]]",
    ["war_free_peoples"] = "\t[[col:green]] +Common enemies [[/col]]",
    ["culture_negative"] = "\t[[col:red]] -Cultural aversion [[/col]]",
    ["traits_negative"] = "\t[[col:red]] -Character's traits [[/col]]",
    ["war_mordor"] = "\t[[col:red]] -War with Sauron [[/col]]",
};

local RING_ELIGIBILITY_GRAVITAS_RATIO = 0.8;                     -- List characters within <value>% gravitas of their faction leader
local RING_ACCEPTANCE_CHANCE_BASE_PCT = 30;                      -- Base percentage chance of a character accepting a ring
local RING_ACCEPTANCE_CHANCE_PER_BAD_TRAIT_PCT_ADD = 10;         -- Added to accept chance per wicked trait the character has
local RING_ACCEPTANCE_CHANCE_PER_GOOD_TRAIT_PCT_ADD = -10;       -- Added to accept chance per virtuous trait the character has
local RING_ACCEPTANCE_CHANCE_LAST_STAND_PCT_ADD = 60;            -- Added to accept chance if character faction is down to one region
local RING_ACCEPTANCE_CHANCE_CIVIL_WAR_PCT_ADD = 20;             -- Added to accept chance if character faction suffers from civil war
local RING_ACCEPTANCE_CHANCE_WAR_WITH_FREE_PEOPLES_PCT_ADD = 10; -- Added to accept chance if character is at war with the Free Peoples
local RING_ACCEPTANCE_CHANCE_WAR_WITH_SAURON_PCT_ADD = -200;     -- Added to accept chance if character is at war with Sauron's allies
local RING_ACCEPTANCE_CHANCE_DIFFICULTY_EASY_PCT_ADD = 20;       -- Added to accept chance at difficulty level
local RING_ACCEPTANCE_CHANCE_DIFFICULTY_NORMAL_PCT_ADD = 10;     -- Added to accept chance at difficulty level
local RING_ACCEPTANCE_CHANCE_DIFFICULTY_HARD_PCT_ADD = 0;        -- Added to accept chance at difficulty level
local RING_ACCEPTANCE_CHANCE_DIFFICULTY_VERY_HARD_PCT_ADD = 0;   -- Added to accept chance at difficulty level
local RING_ACCEPTANCE_CHANCE_DIFFICULTY_LEGENDARY_PCT_ADD = -10; -- Added to accept chance at difficulty level
local RING_ACCEPTANCE_CHANCE_DUNEDAIN_CULTURE_PCT_MOD = -0.9;    -- Calculated chance multiplied by <value> if faction is Dunedain
local RING_ACCEPTANCE_CHANCE_NORTHMEN_CULTURE_PCT_MOD = -0.7;    -- Calculated chance multiplied by <value> if faction is Northmen
local RING_ACCEPTANCE_CHANCE_WILDMEN_CULTURE_PCT_MOD = 0.3;      -- Calculated chance multiplied by <value> if faction is Wildmen
local RING_ACCEPTANCE_CHANCE_SOUTHRON_CULTURE_PCT_MOD = 0.1;     -- Calculated chance multiplied by <value> if faction is Southrons
local RING_ACCEPTANCE_CHANCE_EASTERLING_CULTURE_PCT_MOD = 0.1;   -- Calculated chance multiplied by <value> if faction is Easterlings
local RING_ACCEPTANCE_CHANCE_LONGBEARDS_CULTURE_PCT_MOD = -0.9;  -- Calculated chance multiplied by <value> if faction is Longbeards
local RING_ACCEPTANCE_CHANCE_OROCARNI_CULTURE_PCT_MOD = 0;       -- Calculated chance multiplied by <value> if faction is Orocarni
local REFUSER_REEVALUATE_RING_OFFER_NEW_LEADER = true;           -- A character to be eligible for new offer after a ruler change?
local REFUSER_REEVALUATE_RING_OFFER_LAST_STAND = true;           -- A character to be eligible for new offer if faction has 1 region?
local REFUSER_REEVALUATE_RING_OFFER_CIVIL_WAR = true;            -- A character to be eligible for new offer due to civil war?
local REFUSER_REEVALUATE_RING_OFFER_TREATY_WITH_SAURON = true;   -- A character to be eligible for new offer if treated with Mordor?
local RING_BEARER_CORRUPTION_DWARVEN_GREED_PER_TURN = 1          -- A Dwarven faction with a ring to gain <value> Greed per turn
local RING_BEARER_CORRUPTION_THRESHOLD_STAGE_1_TURNS = 48        -- Turns a bearer has to hold the ring for before unlocking "revolt"
local RING_BEARER_CORRUPTION_THRESHOLD_STAGE_2_TURNS = 96        -- Turns a bearer has to hold the ring for before unlocking "vassalize"
local RING_BEARER_CORRUPTION_THE_ONE_RING_FACTOR = 2             -- 'turns_held' increment to be multiplied by <value>, if the One is claimed


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
            "RingMouseOn",
            "ComponentMouseOn",
            function(context)
                return is_elven_ring(context.string) or is_dwarven_ring(context.string) or is_mannish_ring(context.string)
            end,
            function(context) 
                UpdateRingTooltip(context)
            end,
            true
        );

        cm:add_listener(
            "RingSelected",
            "ComponentLClickUp",
            function(context)
                return is_elven_ring(context.string) or is_dwarven_ring(context.string) or is_mannish_ring(context.string)
            end,
            function(context) 
                LAST_SELECTED_RING = context.string
            end,
            true
        );

        cm:add_listener(
            "RingRecipientSelectionModalRequested",
            "ComponentLClickUp",
            function(context)
                return (context.string == "button_gift_ring_dwarven" or context.string == "button_gift_ring_mannish")
            end,
            function(context) 
                UpdateRingRecipientModal(context);
            end,
            true
        );

        cm:add_listener(
            "RingRecipientSelected",
            "ComponentLClickUp",
            function(context)
                return is_ring_recipient_entry(context.string)
            end,
            function(context) 
                UIComponent(scripting.m_root:Find("button_offer_ring")):SetState("active");
            end,
            true
        );

        cm:add_listener(
            "RingOffer",
            "ComponentLClickUp",
            function(context)
                return context.string == "button_offer_ring"
            end,
            function(context) 
                RingOffer();
            end,
            true
        );

        cm:add_listener(
            "RingOfferDilemmaChoiceMade",
            "DilemmaChoiceMadeEvent",
            function(context)
                return (string.find(context:dilemma(), RING_OFFER_DILEMMA_PREPEND))
            end,
            function(context)
                RingOfferDilemmaChoiceMade(context);
            end,
            true
        );

        cm:add_listener(
            "RingReturn",
            "ComponentLClickUp",
            function(context)
                return context.string == "button_call_ring"
            end,
            function(context) 
                RingReturn();
            end,
            true
        );

        cm:add_listener(
            "RingReturnCallDilemmaChoiceMade",
            "DilemmaChoiceMadeEvent",
            function(context)
                return (string.find(context:dilemma(), RING_RETURN_DILEMMA_PREPEND))
            end,
            function(context)
                RingReturnCallDilemmaChoiceMade(context);
            end,
            true
        );

        cm:add_listener(
            "RingScrollToLocationRequested",
            "ComponentLClickUp",
            function(context)
                return (context.string == "button_ring_location")
            end,
            function(context) 
                ScrollToRingbearer()
            end,
            true
        );

        cm:add_listener(
            "RingRecipientTurnEndTracker",
            "CharacterTurnEnd",
            function(context)
                return can_receive_ring(context:character():faction():name())
            end,
            function(context)
                for ring, v in pairs(RINGS_OF_POWER_TABLE) do
                    if v.bearer_cqi == context:character():cqi() then
                        RingbearerCorruption(context, ring);
                    else
                        if has_ring_ancillary(context:character()) then
                            UpdateRingPossession(context:character():cqi(), ring, context)
                        end
                    end
                end
            end,
            true
        );

        cm:add_listener(
            "RingRecipientTurnStartTracker",
            "FactionTurnStart",
            function(context)
                return can_receive_ring(context:faction():name())
            end,
            function(context) 
                ReevaluateRingRecipientStance(context, "TURN_START");
                RevealRingbearerRegions(context:faction():name());
            end,
            true
        );

        cm:add_listener(
            "RingRecipientDiplomacyTracker",
            "PositiveDiplomaticEvent",
            function(context)
                return (can_receive_ring(context:proposer():name()) or can_receive_ring(context:recipient():name()))
            end,
            function(context) 
                ReevaluateRingRecipientStance(context, "DIPLOMACY");
            end,
            true
        );

        cm:add_listener(
            "RingRecipientNewRulerTracker",
            "CharacterBecomesFactionLeader",
            function(context)
                return can_receive_ring(context:character():faction():name())
            end,
            function(context) 
                ReevaluateRingRecipientStance(context, "LEADER_CHANGE");
            end,
            true
        );

        cm:add_listener(
            "MordorEncountersFaction",
            "FactionEncountersOtherFaction",
            function(context)
                return (context:faction():name() == MORDOR_KEY or context:other_faction():name() == MORDOR_KEY)
            end,
            function(context)
                MordorEncountersFaction(context);
            end,
            true
        );

        UpdateRingsPanel();
        for faction_key, v in pairs(RING_RECIPIENTS_TABLE) do
            RevealRingbearerRegions(faction_key);
        end
    end
end


--- @function MordorEncountersFaction
--- @description Makes a faction discovered by Mordor eligible for a Ring of Power.
--- @param @object; context faction
--- @return void
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


--- @function RingbearerCorruption
--- @description Updates corruption statuses of the current Ring-bearers, and adds to Dwarven Greed.
--- @param @object; context character
--- @param @string; ring ui component string
--- @return void
function RingbearerCorruption(context, ring)
    if is_the_one_ring_claimed() then
        RINGS_OF_POWER_TABLE[ring].turns_held = RINGS_OF_POWER_TABLE[ring].turns_held + (1 * RING_BEARER_CORRUPTION_THE_ONE_RING_FACTOR)
    else
        RINGS_OF_POWER_TABLE[ring].turns_held = RINGS_OF_POWER_TABLE[ring].turns_held + 1
    end

    if (is_dwarven_ring(ring) and not (RINGS_OF_POWER_TABLE[ring].bearer_faction == MORDOR_KEY or RINGS_OF_POWER_TABLE[ring].bearer_faction == "unknown")) then
        --Increase Dwarven Greed for the faction here..
        return
    end
end


--- @function RevealRingbearerRegions
--- @description Lifts the shroud on ring-bearers' regions.
--- @param @string faction key
--- @return void
function RevealRingbearerRegions(faction_key)
    local faction_obj = cm:model():world():faction_by_key(faction_key)
    if faction_obj:character_list():num_items() > 0 then
        for j = 0, faction_obj:character_list():num_items() - 1 do
            local character = faction_obj:character_list():item_at(j);
            if character:has_ancillary(MANNISH_RING_OF_POWER_ANCILLARY_KEY) or character:has_ancillary(DWARVEN_RING_OF_POWER_ANCILLARY_KEY) then
                if character:has_military_force() then
                    if character:has_region() then
                        cm:make_region_visible_in_shroud(local_faction, character:region():name());
                    end
                else
                    cm:make_region_visible_in_shroud(local_faction, character:home_region():name());
                end
            end
        end
    end
end


--- @function ScrollToRingbearer
--- @description Moves camera to the ring-bearer character's display position, or ring-bearer's faction capital.
--- @return void
function ScrollToRingbearer()
    if not (RINGS_OF_POWER_TABLE[LAST_SELECTED_RING].bearer_faction == "unknown") then
        local x_pos = nil;
        local y_pos = nil;
        local x, y, h, r = CampaignUI.GetCameraPosition();

        if (RINGS_OF_POWER_TABLE[LAST_SELECTED_RING].bearer_faction == MORDOR_KEY) then
            if cm:model():world():faction_by_key(MORDOR_KEY):faction_leader():has_military_force() then
                x_pos = cm:model():world():faction_by_key(MORDOR_KEY):faction_leader():display_position_x();
                y_pos = cm:model():world():faction_by_key(MORDOR_KEY):faction_leader():display_position_y();
            else
                x_pos = cm:model():world():faction_by_key(MORDOR_KEY):home_region():settlement():display_position_x();
                y_pos = cm:model():world():faction_by_key(MORDOR_KEY):home_region():settlement():display_position_y();
            end
        else
            local character_obj = cm:model():character_for_command_queue_index(RINGS_OF_POWER_TABLE[LAST_SELECTED_RING].bearer_cqi);
            local faction_obj = character_obj:faction();
            if character_obj:has_military_force() then
                x_pos = character_obj:display_position_x();
                y_pos = character_obj:display_position_y();
            else
                x_pos = faction_obj:home_region():settlement():display_position_x();
                y_pos = faction_obj:home_region():settlement():display_position_y();
            end
        end

        cm:scroll_camera_with_direction(
            2, 
            {x, y, h, r}, 
            {x_pos, y_pos, 0.96, 0}
        );
    end
end


--- @function RingOffer
--- @description Handles the gifting of a ring. For AI, it is a calculated percentage chance; for a human recipient, presents a dilemma.
--- @return void
function RingOffer()
    local selected_recipient
    local faction_select_popup_list = find_uicomponent(cm:ui_root(), "dominion_panel", "faction_selection_popup", "listview", "list_clip", "list_box");
    for i = 0, faction_select_popup_list:ChildCount() - 1 do
        local faction_slot = UIComponent(faction_select_popup_list:Find(i));
        if faction_slot:CurrentState() == "selected" then
            selected_recipient = tonumber(faction_slot:Id());
            break
        end
    end

    local recipient_obj = cm:model():character_for_command_queue_index(selected_recipient);
    local recipient_faction = recipient_obj:faction();
    if recipient_faction:is_human() and recipient_faction:faction_leader() == recipient_obj then
        cm:add_turn_start_callback_for_faction(
            "Ring_of_Power_Offer", 
            recipient_faction:name(), 
            function() 
                output("\t___ SAURON OFFERS "..tostring(recipient_faction:name()).." A RING OF POWER ___")
                cm:trigger_custom_dilemma(
                    recipient_faction:name(),
                    RING_OFFER_DILEMMA..LAST_SELECTED_RING, 
                    "payload{ effect_bundle{bundle_key cha_bundle_hre_formed;turns 0;}; }",
                    "payload{ effect_bundle{bundle_key cha_bundle_hre_formed;turns 1;}; }"
                );
            end,
            false
        );

    else
        output("\t___ SAURON OFFERS "..tostring(recipient_faction:name()).." A RING OF POWER ___")
        local accept_chance = UpdateRingRecipientSlotTooltip(recipient_obj, "accept_chance")
        if cm:model():random_percent(accept_chance) then
            UpdateRingPossession(selected_recipient, LAST_SELECTED_RING)
            RING_RECIPIENTS_TABLE[recipient_faction:name()].refusers[selected_recipient] = nil
            output("\t___ "..tostring(recipient_faction:name()).." HAS ACCEPTED A RING OF POWER ___")
        else
            RING_RECIPIENTS_TABLE[recipient_faction:name()].refusers[selected_recipient] = true
            output("\t___ "..tostring(recipient_faction:name()).." HAS REJECTED A RING OF POWER ___")
        end
    end
end


--- @function RingOfferDilemmaChoiceMade
--- @description Handles the ring gift offer for human player recipient. Dilemma will only concern faction leader.
--- @param @object; context dilemma
--- @return void
function RingOfferDilemmaChoiceMade(context)
    -- Dilemma choice 0 >>> Accept the Ring of Power
    -- Dilemma choice 1 >>> Refuse the gift
    local ring = string.sub(context:dilemma(), 32)
    local leader_cqi = context:faction():faction_leader():cqi();
    if context:choice() == 0 then
        UpdateRingPossession(leader_cqi, ring)
        output("\t___ "..tostring(context:faction():name()).." HAS ACCEPTED A RING OF POWER ___")
    else
        RING_RECIPIENTS_TABLE[context:faction():name()].refusers[leader_cqi] = true
        output("\t___ "..tostring(context:faction():name()).." HAS REJECTED A RING OF POWER ___")
    end
end


--- @function RingReturn
--- @description Handles the calling back of the gifted ring. AI wil automatically yield the Ring; for human ring-bearer, a dilemma will be presented.
--- @return void
function RingReturn()
    local ringbearer = RINGS_OF_POWER_TABLE[LAST_SELECTED_RING].bearer_cqi
    if not (ringbearer == -1 or ringbearer == 0) then
        local ringbearer_obj = cm:model():character_for_command_queue_index(ringbearer);
        local ringbearer_faction = ringbearer:faction();
        if ringbearer_faction:is_human() and ringbearer_obj == ringbearer_faction:faction_leader() then
            cm:add_turn_start_callback_for_faction(
                "Ring_of_Power_Return_Call", 
                ringbearer_faction:name(), 
                function() 
                    output("\t___ SAURON DEMANDS FROM "..tostring(ringbearer_faction:name()).." A RING OF POWER ___")
                    cm:trigger_custom_dilemma(
                        ringbearer_faction:name(),
                        RING_RETURN_DILEMMA_PREPEND..LAST_SELECTED_RING, 
                        "payload{ effect_bundle{bundle_key cha_bundle_hre_formed;turns 0;}; }",
                        "payload{ effect_bundle{bundle_key cha_bundle_hre_formed;turns 1;}; }"
                    );
                end,
                false
            );

        else
            local sauron = cm:model():world():faction_by_key(MORDOR_KEY):faction_leader():cqi();
            UpdateRingPossession(false, LAST_SELECTED_RING)
            UpdateRingPossession(sauron, LAST_SELECTED_RING)
            output("\t___ "..tostring(ringbearer_faction:name()).." HAS GIVEN UP A RING TO SAURON ___")
            RING_RECIPIENTS_TABLE[ringbearer_faction].refusers[ringbearer] = nil
        end
    end
end


--- @function RingReturnCallDilemmaChoiceMade
--- @description Handles the ring return call for human ring-bearer faction. Dilemma will only ask for the faction leader's ring.
--- @param @object; context dilemma
--- @return void
function RingReturnCallDilemmaChoiceMade(context)
    -- Dilemma choice 0 >>> Give up the Ring of Power
    -- Dilemma choice 1 >>> Claim the Ring of Power
    if context:choice() == 0 then
        local ring = string.sub(context:dilemma(), 33)
        local sauron = cm:model():world():faction_by_key(MORDOR_KEY):faction_leader():cqi();
        UpdateRingPossession(false, LAST_SELECTED_RING)
        UpdateRingPossession(sauron, ring)
        RING_RECIPIENTS_TABLE[context:faction():name()].refusers[context:faction():faction_leader():cqi()] = nil
        output("\t___ "..tostring(context:faction():name()).." HAS GIVEN UP A RING TO SAURON ___")
    else
        output("\t___ "..tostring(context:faction():name()).." HAS REFUSED TO YIELD A RING OF POWER ___")
    end
end


--- @function UpdateRingPossession
--- @description Hands a key specified ring to a cqi specified character.
--- @param @number; character_cqi
--- @param @string; ring component key
--- @param @object; context character object, used for removing ancillary from ring-bearer.
--- @return void
function UpdateRingPossession(character_cqi, ring, context)
    if character_cqi then
        local character_obj = cm:model():character_for_command_queue_index(tonumber(character_cqi));
        local faction_key = character_obj:faction():name()

        if context then
            if is_mannish_ring(ring) then
                if context:character():has_ancillary(MANNISH_RING_OF_POWER_ANCILLARY_KEY) then
                    effect.remove_ancillary(MANNISH_RING_OF_POWER_ANCILLARY_KEY, context);
                end
            elseif is_dwarven_ring(ring) then
                if context:character():has_ancillary(DWARVEN_RING_OF_POWER_ANCILLARY_KEY) then
                    effect.remove_ancillary(DWARVEN_RING_OF_POWER_ANCILLARY_KEY, context);
                end
            end

        else
            if faction_key ~= MORDOR_KEY then
                if is_mannish_ring(ring) then
                    cm:force_add_ancillary("character_cqi:"..character_cqi, MANNISH_RING_OF_POWER_ANCILLARY_KEY);
                elseif is_dwarven_ring(ring) then
                    cm:force_add_ancillary("character_cqi:"..character_cqi, DWARVEN_RING_OF_POWER_ANCILLARY_KEY);
                end
            end

            RINGS_OF_POWER_TABLE[ring].bearer_name = character_obj:get_forename()
            RINGS_OF_POWER_TABLE[ring].bearer_cqi = character_cqi
            RINGS_OF_POWER_TABLE[ring].turns_held = 0
            RINGS_OF_POWER_TABLE[ring].bearer_faction = faction_key
            RevealRingbearerRegions(faction_key)
            output("t___ "..tostring(faction_key).." HAS RECEIVED A RING ("..tostring(ring)..") ___")
        end
    else
        RINGS_OF_POWER_TABLE[ring].bearer_name = "unknown"
        RINGS_OF_POWER_TABLE[ring].bearer_cqi = -1
        RINGS_OF_POWER_TABLE[ring].turns_held = 0
        RINGS_OF_POWER_TABLE[ring].bearer_faction = "unknown"
    end

    UpdateRingsPanel();
end


--- @function UpdateRingsPanel
--- @description Iterates over ring components updating their states, and setting their bearers for the tooltip.
--- @return void
function UpdateRingsPanel()
    local rings_of_power_parent = find_uicomponent(cm:ui_root(), "dominion_panel", "rings_layout_parent");
    for i = 0, rings_of_power_parent:ChildCount() - 1 do
        local ring_component = UIComponent(rings_of_power_parent:Find(i));
        local ring_name = tostring(ring_component:Id());

        if not (ring_name == "dwarven_ring_1" or ring_name == "dwarven_ring_2" or ring_name == "dwarven_ring_6" or ring_name == "dwarven_ring_7") then
            if RINGS_OF_POWER_TABLE[ring_name].bearer_name == "names_name_2147366365" then
                ring_component:SetState("owned_active");
            else
                ring_component:SetState("away_active");
            end
        end
    end

    local dy_ring_bearer = find_uicomponent(cm:ui_root(), "dominion_panel", "tooltip_rings_of_power", "wielder_section", "dy_wielder");
    --local button_call_ring = find_uicomponent(cm:ui_root(), "dominion_panel", "tooltip_rings_of_power", "wielder_section", "dy_wielder");
    for k, v in pairs(RINGS_OF_POWER_TABLE) do
        dy_ring_bearer:SetState(k)
        if v.bearer_name == "unknown" then
            dy_ring_bearer:SetStateText("?")
        elseif v.bearer_name == "names_name_2147366365" then
            dy_ring_bearer:SetStateText("-")
        else
            dy_ring_bearer:SetStateText(NAMES_TO_LOCALISATION[v.bearer_name].." "..FACTIONS_TO_LOCALISATION[v.bearer_faction])
        end
    end
end


--- @function UpdateRingTooltip
--- @description Sets state of zoom to ring location button depending on the ring's owner.
--- @param @object; context ui component
--- @return void
function UpdateRingTooltip(context)
    local rings_of_power_tooltip_buttons_parent = find_uicomponent(cm:ui_root(), "dominion_panel", "tooltip_ring_actions");
    local rings_of_power_tooltip_location_button = UIComponent(rings_of_power_tooltip_buttons_parent:Find("button_ring_location"));
    local rings_of_power_tooltip_recall_button = UIComponent(rings_of_power_tooltip_buttons_parent:Find("button_recall_ring"));
    local rings_of_power_tooltip_revolt_button = UIComponent(rings_of_power_tooltip_buttons_parent:Find("button_revolt"));
    local rings_of_power_tooltip_vassalize_button = UIComponent(rings_of_power_tooltip_buttons_parent:Find("button_vassalize"));
    local rings_of_power_tooltip_gift_men_button = UIComponent(rings_of_power_tooltip_buttons_parent:Find("button_gift_ring_mannish"));
    local rings_of_power_tooltip_gift_dwarves_button = UIComponent(rings_of_power_tooltip_buttons_parent:Find("button_gift_ring_dwarven"));

    rings_of_power_tooltip_recall_button:SetVisible(false);
    rings_of_power_tooltip_revolt_button:SetVisible(false);
    rings_of_power_tooltip_vassalize_button:SetVisible(false);

    if RINGS_OF_POWER_TABLE[context.string].bearer_faction == "unknown" then
        rings_of_power_tooltip_location_button:SetState("inactive_unknown");
    else
        rings_of_power_tooltip_location_button:SetState("active");

        if RINGS_OF_POWER_TABLE[context.string].bearer_faction == MORDOR_KEY then
            if is_dwarven_ring(context.string) then
                rings_of_power_tooltip_gift_dwarves_button:SetVisible(true);
                rings_of_power_tooltip_gift_men_button:SetVisible(false);
            elseif is_mannish_ring(context.string) then
                rings_of_power_tooltip_gift_men_button:SetVisible(true);
                rings_of_power_tooltip_gift_dwarves_button:SetVisible(false);
            end

        else
            if not is_elven_ring(context.string) then
                rings_of_power_tooltip_gift_dwarves_button:SetVisible(false);
                rings_of_power_tooltip_gift_men_button:SetVisible(false);
                rings_of_power_tooltip_recall_button:SetVisible(true);
                rings_of_power_tooltip_revolt_button:SetVisible(true);
                rings_of_power_tooltip_vassalize_button:SetVisible(true);

                if is_mannish_ring(context.string) then
                    local ringbearer_faction_leader_obj = cm:model():world():faction_by_key(RINGS_OF_POWER_TABLE[context.string].bearer_faction):faction_leader();
                    if RINGS_OF_POWER_TABLE[context.string].turns_held >= RING_BEARER_CORRUPTION_THRESHOLD_STAGE_1_TURNS then
                        if RINGS_OF_POWER_TABLE[context.string].bearer_cqi ~= ringbearer_faction_leader_obj:cqi() then
                            rings_of_power_tooltip_revolt_button:SetState("active")
                        else
                            rings_of_power_tooltip_revolt_button:SetState("inactive_leader")
                        end
                    else
                        rings_of_power_tooltip_revolt_button:SetState("inactive_not_corrupted")
                    end

                    if RINGS_OF_POWER_TABLE[context.string].turns_held >= RING_BEARER_CORRUPTION_THRESHOLD_STAGE_2_TURNS then
                        if RINGS_OF_POWER_TABLE[context.string].bearer_cqi == ringbearer_faction_leader_obj:cqi() then
                            rings_of_power_tooltip_vassalize_button:SetState("active")
                        else
                            rings_of_power_tooltip_vassalize_button:SetState("inactive_not_leader")
                        end
                    else
                        rings_of_power_tooltip_vassalize_button:SetState("inactive_not_corrupted")
                    end
                end
            end
        end
    end

    if RINGS_OF_POWER_TABLE["the_one_ring"].bearer_faction ~= MORDOR_KEY then
        rings_of_power_tooltip_recall_button:SetState("inactive_requires_one_ring")
    else
        rings_of_power_tooltip_recall_button:SetState("active")
    end

    rings_of_power_tooltip_buttons_parent:Layout();
end


--- @function UpdateRingRecipientModal
--- @description Handles visibility and cosmetics of faction slots in the ring recipient selection popup.
--- @param @object; context ui component
--- @return void
function UpdateRingRecipientModal(context)
    local dominion_panel_uic = UIComponent(scripting.m_root:Find("dominion_panel"));
    local faction_select_popup_list = find_uicomponent(dominion_panel_uic, "faction_selection_popup", "listview", "list_clip", "list_box");
    faction_select_popup_list:DestroyChildren();

    for faction_key, v in pairs(RING_RECIPIENTS_TABLE) do
        if v.encountered then
            local faction_obj = cm:model():world():faction_by_key(faction_key);
            local faction_leader_obj = faction_obj:faction_leader();

            if faction_obj:is_null_interface() == false then
                local character_list = faction_obj:character_list();
                local generals = {}
                local slot_primary = faction_leader_obj:cqi();
                local min_gravitas = faction_leader_obj:gravitas() * RING_ELIGIBILITY_GRAVITAS_RATIO;

                for j = 0, character_list:num_items() - 1 do
                    local char = character_list:item_at(j)
                    if (is_character(char) and char_is_general(char) and NAMES_TO_LOCALISATION[char:get_forename()] and (char:gravitas() >= min_gravitas) and (char:cqi() ~= slot_primary) and (has_ring_ancillary(char) == false)) then
                        table.insert(generals, char)
                    end
                end

                table.sort(generals, function(char_a, char_b) return char_a:gravitas() > char_b:gravitas() end)

                if not (has_ring_ancillary(faction_leader_obj)) then
                    CreateRingRecipientSlot(
                        slot_primary,
                        faction_leader_obj,
                        true
                    )
                end

                if generals[1] then
                    CreateRingRecipientSlot(
                        generals[1]:cqi(),
                        generals[1],
                        false
                    )
                end

                if generals[2] then
                    CreateRingRecipientSlot(
                        generals[2]:cqi(),
                        generals[2],
                        false
                    )
                end

                if generals[3] then
                    CreateRingRecipientSlot(
                        generals[3]:cqi(),
                        generals[3],
                        false
                    )
                end
            end
        end
    end

    faction_select_popup_list:Layout();
    for i = 0, faction_select_popup_list:ChildCount() - 1 do
        local slot = UIComponent(faction_select_popup_list:Find(i));
        local character_cqi = tonumber(slot:Id());
        local character_obj = cm:model():character_for_command_queue_index(tonumber(character_cqi));
        local faction_obj = character_obj:faction();
        local faction_key = faction_obj:name();
        local faction_icon = UIComponent(slot:Find("icon_faction"));
        local faction_string = UIComponent(slot:Find("dy_faction"));
        local faction_leader_icon = UIComponent(faction_string:Find("icon_leader"));

        slot:PropagateVisibility(false);
    
        if context.string == "button_gift_ring_dwarven" then
            if (faction_key == "rom_fact_erebor" or faction_key == "rom_fact_ironfist" or faction_key == "rom_fact_blacklock") then
                if (RING_RECIPIENTS_TABLE[faction_key].refusers[character_cqi]) then
                    slot:PropagateVisibility(true);
                    slot:SetDisabled(true);
                    faction_icon:SetInteractive(false);
                    faction_icon:ShaderTechniqueSet("set_greyscale_t0", true);
                    faction_icon:ShaderVarsSet(0.9, 0.35, 0, 0, true);
                    faction_string:ShaderTechniqueSet("red_and_alpha_t0", true);
                    faction_string:ShaderVarsSet(0, 0, 0, 0, true);
                    faction_leader_icon:PropagateVisibility((character_obj == faction_obj:faction_leader()));
                    slot:SetTooltipText(RING_RECIPIENT_TOOLTIP_STRINGS["already_rejected_ring"])
                else
                    slot:PropagateVisibility(true);
                    slot:SetDisabled(false);
                    faction_icon:SetInteractive(true);
                    faction_icon:ShaderTechniqueSet("normal_t0", true);
                    faction_icon:ShaderVarsSet(0, 0, 0, 0, true);
                    faction_string:ShaderTechniqueSet("normal_t0", true);
                    faction_string:ShaderVarsSet(0, 0, 0, 0, true);
                    faction_leader_icon:PropagateVisibility((character_obj == faction_obj:faction_leader()));
                    -- Construct tooltip from strings
                    local tooltip_strings = UpdateRingRecipientSlotTooltip(character_obj, "strings");
                    local tooltip_text = ""

                    -- Always put likelihood first
                    if tooltip_strings["likelihood_high"] then
                        tooltip_text = tooltip_text .. tooltip_strings["likelihood_high"]
                    elseif tooltip_strings["likelihood_moderate"] then
                        tooltip_text = tooltip_text .. tooltip_strings["likelihood_moderate"]
                    elseif tooltip_strings["likelihood_low"] then
                        tooltip_text = tooltip_text .. tooltip_strings["likelihood_low"]
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
            if not (faction_key == "rom_fact_erebor" or faction_key == "rom_fact_ironfist" or faction_key == "rom_fact_blacklock") then
                if (RING_RECIPIENTS_TABLE[faction_key].refusers[character_cqi]) then
                    slot:PropagateVisibility(true);
                    slot:SetDisabled(true);
                    faction_icon:SetInteractive(false);
                    faction_icon:ShaderTechniqueSet("set_greyscale_t0", true);
                    faction_icon:ShaderVarsSet(0.9, 0.35, 0, 0, true);
                    faction_string:ShaderTechniqueSet("red_and_alpha_t0", true);
                    faction_string:ShaderVarsSet(0, 0, 0, 0, true);
                    faction_leader_icon:PropagateVisibility((character_obj == faction_obj:faction_leader()));
                    slot:SetTooltipText(RING_RECIPIENT_TOOLTIP_STRINGS["already_rejected_ring"])
                else
                    slot:PropagateVisibility(true);
                    slot:SetDisabled(false);
                    faction_icon:SetInteractive(true);
                    faction_icon:ShaderTechniqueSet("normal_t0", true);
                    faction_icon:ShaderVarsSet(0, 0, 0, 0, true);
                    faction_string:ShaderTechniqueSet("normal_t0", true);
                    faction_string:ShaderVarsSet(0, 0, 0, 0, true);
                    faction_leader_icon:PropagateVisibility((character_obj == faction_obj:faction_leader()));
                    -- Construct tooltip from strings
                    local tooltip_strings = UpdateRingRecipientSlotTooltip(character_obj, "strings");
                    local tooltip_text = ""

                    -- Always put likelihood first
                    if tooltip_strings["likelihood_high"] then
                        tooltip_text = tooltip_text .. tooltip_strings["likelihood_high"]
                    elseif tooltip_strings["likelihood_moderate"] then
                        tooltip_text = tooltip_text .. tooltip_strings["likelihood_moderate"]
                    elseif tooltip_strings["likelihood_low"] then
                        tooltip_text = tooltip_text .. tooltip_strings["likelihood_low"]
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
    faction_select_popup_list:Layout();
end


--- @function ReevaluateRingRecipientStance
--- @description Makes a faction re-consider a Ring of Power if it previously declined an offer.
--- @param @object; context faction
--- @param @string; event type to track
--- @return void
function ReevaluateRingRecipientStance(context, event)
    if event == "LEADER_CHANGE" then
        if REFUSER_REEVALUATE_RING_OFFER_NEW_LEADER then
            if RING_RECIPIENTS_TABLE[context:character():faction():name()].rejected_ring then
                RING_RECIPIENTS_TABLE[context:character():faction():name()].rejected_ring = false
                return
            end
        end
    end

    if event == "TURN_START" then
        if REFUSER_REEVALUATE_RING_OFFER_LAST_STAND then
            if context:faction():region_list():num_items() < 2 then
                if RING_RECIPIENTS_TABLE[context:faction():name()].rejected_ring then
                    RING_RECIPIENTS_TABLE[context:faction():name()].rejected_ring = false
                end
            end
        end

        if REFUSER_REEVALUATE_RING_OFFER_CIVIL_WAR then
            local civil_war_faction_key = "rom_fact_separatist"..string.sub(context:faction():name(), 9)
            if cm:model():world():faction_exists(civil_war_faction_key) then
                if context:faction():at_war_with(cm:model():world():faction_by_key(civil_war_faction_key)) then
                    if RING_RECIPIENTS_TABLE[context:faction():name()].rejected_ring then
                        RING_RECIPIENTS_TABLE[context:faction():name()].rejected_ring = false
                    end
                end
            end
        end
    end

    if event == "DIPLOMACY" then
        if REFUSER_REEVALUATE_RING_OFFER_TREATY_WITH_SAURON then
            if context:recipient():name() == "rom_fact_mordor" then
                if RING_RECIPIENTS_TABLE[context:proposer():name()].rejected_ring then
                    RING_RECIPIENTS_TABLE[context:proposer():name()].rejected_ring = false
                    return
                end
            elseif context:proposer():name() == "rom_fact_mordor" then
                if RING_RECIPIENTS_TABLE[context:recipient():name()].rejected_ring then
                    RING_RECIPIENTS_TABLE[context:recipient():name()].rejected_ring = false
                    return
                end
            end
        end
    end
end


--- @function UpdateRingRecipientSlotTooltip
--- @description Updates the tooltip of a faction slot in the ring recipient selection popup. Also runs a likelihood check and serves the calculated chance to ring offer function.
--- @param @object; character object
--- @param @string; requested payload (table of strings or calculated chance of accepting ring)
--- @return @table or @number;
function UpdateRingRecipientSlotTooltip(character_obj, payload)
    local tooltip_strings = {};
    local faction_obj = character_obj:faction();
    local faction_key = faction_obj:name();

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
        tooltip_strings["culture_negative"] = RING_RECIPIENT_TOOLTIP_STRINGS["culture_negative"]
    elseif faction_culture == "rom_sc_rohirrim" or faction_culture == "rom_sc_middle_men" then
        faction_culture = RING_ACCEPTANCE_CHANCE_NORTHMEN_CULTURE_PCT_MOD
        tooltip_strings["culture_negative"] = RING_RECIPIENT_TOOLTIP_STRINGS["culture_negative"]
    elseif faction_culture == "rom_sc_wildmen" then
        faction_culture = RING_ACCEPTANCE_CHANCE_WILDMEN_CULTURE_PCT_MOD
        tooltip_strings["culture_positive"] = RING_RECIPIENT_TOOLTIP_STRINGS["culture_positive"]
    elseif faction_culture == "rom_sc_southrons" then
        faction_culture = RING_ACCEPTANCE_CHANCE_SOUTHRON_CULTURE_PCT_MOD
    elseif faction_culture == "rom_sc_easterlings" then
        faction_culture = RING_ACCEPTANCE_CHANCE_EASTERLING_CULTURE_PCT_MOD
        tooltip_strings["culture_positive"] = RING_RECIPIENT_TOOLTIP_STRINGS["culture_positive"]
    elseif faction_culture == "rom_sc_dwarves_erebor" then
        faction_culture = RING_ACCEPTANCE_CHANCE_LONGBEARDS_CULTURE_PCT_MOD
        tooltip_strings["culture_negative"] = RING_RECIPIENT_TOOLTIP_STRINGS["culture_negative"]
    elseif faction_culture == "rom_sc_dwarves_orocarni" then
        faction_culture = RING_ACCEPTANCE_CHANCE_OROCARNI_CULTURE_PCT_MOD
    end

    local faction_num_regions = faction_obj:region_list():num_items();
    local is_losing_ground = 0
    if faction_num_regions < 2 then
        is_losing_ground = RING_ACCEPTANCE_CHANCE_LAST_STAND_PCT_ADD
        tooltip_strings["last_stand"] = RING_RECIPIENT_TOOLTIP_STRINGS["last_stand"]
    end

    local faction_civil_war_faction_key = faction_key
    local civil_war = 0
    if string.sub(faction_key, 1, 8) == "rom_fact" then
        faction_civil_war_faction_key = "rom_fact_separatist"..string.sub(faction_key, 9)
    end
    if cm:model():world():faction_exists(faction_civil_war_faction_key) then
        if faction_obj:at_war_with(cm:model():world():faction_by_key(faction_civil_war_faction_key)) then
            civil_war = RING_ACCEPTANCE_CHANCE_CIVIL_WAR_PCT_ADD
            tooltip_strings["civil_war"] = RING_RECIPIENT_TOOLTIP_STRINGS["civil_war"]
        end
    end

    local warring_free_peoples = 0
    local warring_sauron = 0
    if faction_obj:at_war() then
        local faction_list = cm:model():world():faction_list();
        for i = 0, faction_list:num_items() - 1 do
            local current_faction = faction_list:item_at(i);
            if is_faction_good(current_faction) then
                if faction_obj:at_war_with(current_faction) then
                    warring_free_peoples = RING_ACCEPTANCE_CHANCE_WAR_WITH_FREE_PEOPLES_PCT_ADD;
                    tooltip_strings["war_free_peoples"] = RING_RECIPIENT_TOOLTIP_STRINGS["war_free_peoples"]
                    break;
                end
            end
        end
        if (faction_obj:at_war_with(cm:model():world():faction_by_key("rom_fact_mordor")) or faction_obj:at_war_with(cm:model():world():faction_by_key("rom_fact_dol_guldur")) or faction_obj:at_war_with(cm:model():world():faction_by_key("rom_fact_goblins")) or faction_obj:at_war_with(cm:model():world():faction_by_key("rom_fact_gundabad"))) then
            warring_sauron = RING_ACCEPTANCE_CHANCE_WAR_WITH_SAURON_PCT_ADD;
            tooltip_strings["war_mordor"] = RING_RECIPIENT_TOOLTIP_STRINGS["war_mordor"]
        end
    end

    local num_positive_traits = 0;
    local num_negative_traits = 0;
    for j = 1, #GOOD_CHARACTER_TRAITS_LIST do
        if character_obj:has_trait(GOOD_CHARACTER_TRAITS_LIST[j]) then
            num_positive_traits = num_positive_traits + 1
        end
    end

    for k = 1, #BAD_CHARACTER_TRAITS_LIST do
        if character_obj:has_trait(BAD_CHARACTER_TRAITS_LIST[k]) then
            num_negative_traits = num_negative_traits + 1
        end
    end

    if num_positive_traits > num_negative_traits then
        tooltip_strings["traits_positive"] = RING_RECIPIENT_TOOLTIP_STRINGS["traits_positive"]
    elseif num_negative_traits > num_positive_traits then
        tooltip_strings["traits_negative"] = RING_RECIPIENT_TOOLTIP_STRINGS["traits_negative"]
    end

    local accept_chance = ((RING_ACCEPTANCE_CHANCE_BASE_PCT) + (difficulty) + (is_losing_ground) + (civil_war) + (warring_free_peoples) + (warring_sauron) + (num_negative_traits * RING_ACCEPTANCE_CHANCE_PER_BAD_TRAIT_PCT_ADD) + (num_positive_traits * RING_ACCEPTANCE_CHANCE_PER_GOOD_TRAIT_PCT_ADD))
    accept_chance = math.floor(accept_chance) + math.floor(accept_chance * faction_culture)
    accept_chance = math.max(accept_chance, 0);
    accept_chance = math.min(accept_chance, 100);

    if accept_chance < 20 then
        tooltip_strings["likelihood_low"] = RING_RECIPIENT_TOOLTIP_STRINGS["likelihood_low"]
    elseif accept_chance > 80 then
        tooltip_strings["likelihood_high"] = RING_RECIPIENT_TOOLTIP_STRINGS["likelihood_high"]
    else
        tooltip_strings["likelihood_moderate"] = RING_RECIPIENT_TOOLTIP_STRINGS["likelihood_moderate"]
    end

    if payload == "strings" then
        return tooltip_strings
    elseif payload == "accept_chance" then
        return accept_chance
    end
end


--- @function CreateRingRecipientSlot
--- @description Creates a ui component for the list of characters that can receive a ring.
--- @param @number; character cqi
--- @param @object; character object
--- @param @boolean; leader icon to show up in the slot?
--- @return void
function CreateRingRecipientSlot(cqi, character, is_leader)
	if not is_number(cqi) then
		return
	end

	if not is_character(character) then
		return
	end

	if not is_boolean(is_leader) then
		return
	end

    local ui_root = cm:ui_root();
    local faction_select_popup_list = find_uicomponent(ui_root, "dominion_panel", "faction_selection_popup", "listview", "list_clip", "list_box");
    local slot = UIComponent(faction_select_popup_list:CreateComponent(tostring(cqi), "ui/campaign ui/factions_list_entry_template"))

    UIComponent(slot:Find("icon_faction")):SetState(tostring(character:faction():name()))
    UIComponent(slot:Find("dy_faction")):SetStateText(NAMES_TO_LOCALISATION[character:get_forename()])
    UIComponent(UIComponent(slot:Find("dy_faction")):Find("icon_leader")):PropagateVisibility(is_leader)
end


--- @function can_receive_ring
--- @description Checks if key specified faction is a potential Ring of Power recipient.
--- @param @string; faction key
--- @return @boolean;
function can_receive_ring(faction_key)
	return RING_RECIPIENTS_TABLE[faction_key] ~= nil;
end


--- @function has_ring_ancillary
--- @description Checks if context supplied character possesses a ring ancillary.
--- @param @object; character object
--- @return @boolean;
function has_ring_ancillary(character)
	return character:has_ancillary(MANNISH_RING_OF_POWER_ANCILLARY_KEY) or character:has_ancillary(DWARVEN_RING_OF_POWER_ANCILLARY_KEY)
end


--- @function is_ring_recipient_entry
--- @description Checks if supplied ui component string is of factions list.
--- @param @string; context string
--- @return @boolean;
function is_ring_recipient_entry(string)
    return UIComponent(scripting.m_root:Find(string)):CallbackId() == "FactionListItem"
end


--- @function is_the_one_ring_claimed
--- @description Returns status of the One Ring.
--- @return @boolean;
function is_the_one_ring_claimed()
	return RINGS_OF_POWER_TABLE["the_one_ring"].bearer_faction == MORDOR_KEY
end


--- @function is_elven_ring
--- @description Checks if the string specified ring is Elven OR the One.
--- @param @string; context string
--- @return @boolean;
function is_elven_ring(string)
	return string == "the_one_ring" or string == "narya" or string == "nenya" or string == "vilya"
end


--- @function is_dwarven_ring
--- @description Checks if the string specified ring is Dwarven.
--- @param @string; context string
--- @return @boolean;
function is_dwarven_ring(string)
	return string == "dwarven_ring_3" or string == "dwarven_ring_4" or string == "dwarven_ring_5"
end


--- @function is_mannish_ring
--- @description Checks if the string specified ring is Mannish.
--- @param @string; context string
--- @return @boolean;
function is_mannish_ring(string)
	return string.find(string, "mannish_ring_")
end