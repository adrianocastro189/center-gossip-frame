--[[
This class is responsible for handling frames that may be overriden by the TSM
(TradeSkillMaster) addon.

When players open some specific frames like the merchant one, depending on how TSM
is configured, it may override the default frame. Centralizing the original game
frame would result in showing both TSM and the original frame at the same time,
which is not the expected behavior.

Considering that TSM is a very popular addon, it is important to handle this
situation properly and justifies the existence of a compatibility layer for it.
]]
local TradeSkillMasterIntegration = {}
    TradeSkillMasterIntegration.__index = TradeSkillMasterIntegration
    CenterGossipFrame:addClass('CenterGossipFrame/TradeSkillMasterIntegration', TradeSkillMasterIntegration)

    --[[--
    TradeSkillMasterIntegration constructor.
    ]]
    function TradeSkillMasterIntegration.__construct()
        return setmetatable({}, TradeSkillMasterIntegration)
    end

    --[[
    Determines whether the TSM merchant frame is visible or not.

    By visible, it means that TSM is overriding the default merchant frame.
    ]]
    function TradeSkillMasterIntegration:isMerchantFrameVisible()
        local success, result = pcall(function()
            return
                TSM_API ~= nil and
                TSM_API.IsUIVisible ~= nil and
                type(TSM_API.IsUIVisible) == 'function' and
                TSM_API.IsUIVisible('VENDORING')
        end)

        -- success is a boolean that indicates if the pcall was successful, not
        -- if the TSM UI is visible or not
        return success and result
    end
-- end of TradeSkillMasterIntegration