CenterGossipFrame = StormwindLibrary_v1_9_0.new({
  colors = {
    primary = 'ED5859'
  },
  name = 'Center Gossip Frame'
})

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

-- events that trigger when the quest frame is shown
for _, event in ipairs({'QUEST_DETAIL', 'QUEST_COMPLETE', 'QUEST_PROGRESS'}) do
  CenterGossipFrame.events:listenOriginal(event, function ()
    CenterGossipFrame:centralizeFrame(QuestFrame)
  end)
end

-- events that trigger when the gossip frame is shown
CenterGossipFrame.events:listenOriginal('GOSSIP_SHOW', function ()
    CenterGossipFrame:centralizeFrame(GossipFrame)
end)