CenterGossipFrame = StormwindLibrary_v1_9_0.new({
  colors = {
    primary = 'ED5859'
  },
  name = 'Center Gossip Frame'
})

--[[
Determines whether a frame can be centralized or not.
]]
function CenterGossipFrame:canBeCentralized(frame)
  return
    frame ~= nil and
    frame.ClearAllPoints ~= nil and
    frame.SetPoint ~= nil
end

--[[
Positions a frame in the center of the screen.

This method was designed to be used with the GossipFrame and QuestFrame. It
will probably work with many other frames, but must be well tested if the
addon covers other frames in the future.
]]
function CenterGossipFrame:centralizeFrame(frame)
  frame:ClearAllPoints()
  frame:SetPoint('CENTER', UIParent, 'CENTER', 0, 0)
end

--[[
May centralize a frame if it can be centralized.
]]
function CenterGossipFrame:maybeCentralizeFrame(frame)
  if not self:canBeCentralized(frame) then return end

  self:centralizeFrame(frame)

  -- this line solves an edge case where the frame is not centralized due
  -- to race conditions between events and the default frame positioning
  C_Timer.After(0.001, function () self:centralizeFrame(frame) end)
end

-- event that triggers when the player interacts with things that can open
-- centralizable frames
CenterGossipFrame.events:listenOriginal('PLAYER_INTERACTION_MANAGER_FRAME_SHOW', function ()
  CenterGossipFrame:maybeCentralizeFrame(GossipFrame)
  CenterGossipFrame:maybeCentralizeFrame(MerchantFrame)
end)

-- events that trigger when the quest frame is shown
for _, event in ipairs({'QUEST_DETAIL', 'QUEST_COMPLETE', 'QUEST_PROGRESS'}) do
  CenterGossipFrame.events:listenOriginal(event, function ()
    CenterGossipFrame:maybeCentralizeFrame(QuestFrame)
  end)
end

-- event that triggers when the taximap frame is shown
CenterGossipFrame.events:listenOriginal('TAXIMAP_OPENED', function ()
  CenterGossipFrame:maybeCentralizeFrame(TaxiFrame)
end)