---@diagnostic disable: duplicate-set-field

CenterGossipFrame = StormwindLibrary_v1_12_1.new({
    colors = {
        primary = 'ED5859'
    },
    name = 'Center Gossip Frame'
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
    if not self:isFrameCentered(frame) then
        self:centralizeFrame(frame)
    end
end

CenterGossipFrame:applyListener(GossipFrame)
CenterGossipFrame:applyListener(MerchantFrame)
CenterGossipFrame:applyListener(QuestFrame)
CenterGossipFrame:applyListener(TaxiFrame)
