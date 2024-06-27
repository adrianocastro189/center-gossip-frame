CenterGossipFrame = StormwindLibrary_v1_6_0.new({
  colors = {
    primary = 'ED5859'
  },
  name = 'Center Gossip Frame'
})

function CenterGossipFrame:centralizeGossipFrame()
  self:centralizeFrame(GossipFrame)
end

function CenterGossipFrame:centralizeQuestFrame()
  self:centralizeFrame(QuestFrame)
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

local questEvents = {'QUEST_DETAIL', 'QUEST_COMPLETE', 'QUEST_PROGRESS'}

local events = CenterGossipFrame.events

for _, event in ipairs(questEvents) do
    events:listenOriginal(event, function ()
        CenterGossipFrame:centralizeQuestFrame()
    end)
end

events:listenOriginal('GOSSIP_SHOW', function ()
    CenterGossipFrame:centralizeGossipFrame()
end)

events:listen(events.EVENT_NAME_PLAYER_LOGIN, function ()
    -- @TODO: Implement this in the future <2024.06.27>
end)