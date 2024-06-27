TestCenterGossipFrame = BaseTestClass:new()
    -- @covers CenterGossipFrame
    function TestCenterGossipFrame:testMainAddonFile()
        lu.assertNotIsNil(CenterGossipFrame)
    end

    -- @covers CenterGossipFrame:centralizeFrame
    function TestCenterGossipFrame:testCentralizeFrame()
        local frame = CreateFrame()

        CenterGossipFrame:centralizeFrame(frame)

        lu.assertTrue(frame.clearAllPointsInvoked)
        lu.assertEquals({
            ['CENTER'] = {
                relativeFrame = UIParent,
                relativePoint = 'CENTER',
                xOfs = 0,
                yOfs = 0,
            }
        }, frame.points)
    end
-- end of MultiTargetsTest