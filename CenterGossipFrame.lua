---@diagnostic disable: duplicate-set-field

CenterGossipFrame = StormwindLibrary_v1_13_0.new({
    colors = {
        primary = 'ED5859'
    },
    name = 'Center Gossip Frame',
    version = '1.3.0',
})

local events = CenterGossipFrame.events

events:listen(events.EVENT_NAME_PLAYER_LOGIN, function()
    -- initializes the TSM integration
    CenterGossipFrame.tsmIntegration = CenterGossipFrame:new('CenterGossipFrame/TradeSkillMasterIntegration')

    local coveredFrames = {
        CenterGossipFrame:new('CenterGossipFrame/GenericCoveredFrame', GossipFrame),
        CenterGossipFrame:new('CenterGossipFrame/GenericCoveredFrame', QuestFrame),
        CenterGossipFrame:new('CenterGossipFrame/GenericCoveredFrame', TaxiFrame),
        CenterGossipFrame:new('CenterGossipFrame/MerchantCoveredFrame'),
        CenterGossipFrame:new('CenterGossipFrame/ClassTrainerCoveredFrame'),
    }

    CenterGossipFrame.arr:each(coveredFrames, function(coveredFrame)
        coveredFrame:register()
    end)
end)