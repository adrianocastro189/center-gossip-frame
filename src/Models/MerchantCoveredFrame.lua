--[[
The MerchantCoveredFrame is a specific implementation for the MerchantFrame frame.

This frame deserves a special treatment due to the fact that some other addons can
take over it and change its behavior, like TradeSkillMaster.
]]
local MerchantCoveredFrame = {}
    MerchantCoveredFrame.__index = MerchantCoveredFrame

    CenterGossipFrame:addChildClass('CenterGossipFrame/MerchantCoveredFrame', MerchantCoveredFrame, 'CenterGossipFrame/GenericCoveredFrame')

    --[[
    MerchantCoveredFrame constructor.
    ]]
    function MerchantCoveredFrame.__construct()
        local self = setmetatable({}, MerchantCoveredFrame)

        self.gameFrame = MerchantFrame

        return self
    end

    --[[ @inheritDoc ]]
    function MerchantCoveredFrame:shouldCentralize()
        return not CenterGossipFrame.tsmIntegration:isMerchantFrameVisible()
    end
-- end of MerchantCoveredFrame