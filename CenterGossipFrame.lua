---@diagnostic disable: duplicate-set-field

CenterGossipFrame = StormwindLibrary_v1_13_0.new({
    colors = {
        primary = 'ED5859'
    },
    name = 'Center Gossip Frame',
    version = '1.3.0',
})



-- CenterGossipFrame:applyListener(GossipFrame)
-- CenterGossipFrame:applyListener(MerchantFrame)
-- CenterGossipFrame:applyListener(QuestFrame)
-- CenterGossipFrame:applyListener(TaxiFrame)

local events = CenterGossipFrame.events

events:listen(events.EVENT_NAME_PLAYER_LOGIN, function()
    -- initializes the TSM integration
    CenterGossipFrame.tsmIntegration = CenterGossipFrame:new('CenterGossipFrame/TradeSkillMasterIntegration')
end)