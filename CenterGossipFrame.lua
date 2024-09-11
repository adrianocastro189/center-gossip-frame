---@diagnostic disable: duplicate-set-field

CenterGossipFrame = StormwindLibrary_v1_13_0.new({
    colors = {
        primary = 'ED5859'
    },
    name = 'Center Gossip Frame',
    version = '1.3.0',
})

--[[
Apply a listener to a frame.

The listener will be responsible for detecting when the frame is updated and
centralizing it if necessary. When the frame is already centralized, no changes
will be made, so the listener will not be invoked repeatedly.

@param gameFrame The frame to be listened to
]]
function CenterGossipFrame:applyListener(gameFrame)
    if not self:canBeCentralized(gameFrame) then return end

    gameFrame:HookScript('OnUpdate', function()
        CenterGossipFrame:maybeCentralizeFrame(gameFrame)
    end)
end

--[[
Determines whether a frame can be centralized or not.

@param gameFrame The frame to be checked
]]
function CenterGossipFrame:canBeCentralized(gameFrame)
    return
        gameFrame ~= nil and
        gameFrame.ClearAllPoints ~= nil and
        gameFrame.SetPoint ~= nil
end

--[[
Positions a frame in the center of the screen.

This method was designed to be used with the GossipFrame and QuestFrame. It
will probably work with many other frames, but must be well tested if the
addon covers other frames in the future.

@param gameFrame The frame to be centralized
]]
function CenterGossipFrame:centralizeFrame(gameFrame)
    gameFrame:ClearAllPoints()
    gameFrame:SetPoint('CENTER', UIParent, 'CENTER', 0, 0)
end

--[[
Determines whether a frame is already centered or not.

@param gameFrame The frame to be checked
]]
function CenterGossipFrame:isFrameCentered(frame)
    local point, relativeTo, relativePoint, offsetX, offsetY = frame:GetPoint()

    return
        point == 'CENTER' and
        relativeTo == UIParent and
        relativePoint == 'CENTER' and
        offsetX == 0 and
        offsetY == 0
end

--[[
May centralize a frame if it can be centralized.

@param frame The frame to be centralized
]]
function CenterGossipFrame:maybeCentralizeFrame(frame)
    -- @TODO: Remove this condition when the frame class implementation is done <2024.08.21>
    if not self:shouldCentralizeIfMerchantFrame(frame) then return end

    if not self:isFrameCentered(frame) then
        self:centralizeFrame(frame)
    end
end

--[[
May register the ClassTrainerFrame listener.

During development, it was noticed that ClassTrainerFrame doesn't exist until
players interact with a class trainer. That said, it can't be registered when the
addon initializes like the other frames.

Still, it must be registered only once, and that's why this method manages a flag.
]]
function CenterGossipFrame:maybeRegisterClassTrainerFrame()
    if CenterGossipFrame.classTrainerFrameRegistered then return end

    CenterGossipFrame:applyListener(ClassTrainerFrame)

    CenterGossipFrame.classTrainerFrameRegistered = true
end

--[[
Determines whether the GossipFrame should be centralized or not if it's
MerchantFrame.

@NOTE: This is a temporary solution that will be migrated in upcoming versions when
       every frame will be encapsulated in a class, so these conditions will be
       later refactored.
]]
function CenterGossipFrame:shouldCentralizeIfMerchantFrame(frame)
    local isMerchantFrame = frame == MerchantFrame

    local isTsmEnabledForMerchantFrame = isMerchantFrame and CenterGossipFrame.tsmIntegration:isMerchantFrameVisible()

    return not isMerchantFrame or not isTsmEnabledForMerchantFrame
end

CenterGossipFrame:applyListener(GossipFrame)
CenterGossipFrame:applyListener(MerchantFrame)
CenterGossipFrame:applyListener(QuestFrame)
CenterGossipFrame:applyListener(TaxiFrame)

local events = CenterGossipFrame.events

events:listen(events.EVENT_NAME_PLAYER_LOGIN, function()
    -- initializes the TSM integration
    CenterGossipFrame.tsmIntegration = CenterGossipFrame:new('CenterGossipFrame/TradeSkillMasterIntegration')
end)

events:listenOriginal('TRAINER_UPDATE', function ()
    CenterGossipFrame:maybeRegisterClassTrainerFrame()
end)