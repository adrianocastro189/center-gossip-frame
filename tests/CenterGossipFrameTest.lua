TestCenterGossipFrame = BaseTestClass:new()
    -- @covers CenterGossipFrame:canBeCentralized
    function TestCenterGossipFrame:testCanBeCentralized()
        local function execution(frame, expected)
            lu.assertEquals(expected, CenterGossipFrame:canBeCentralized(frame))
        end

        -- frame is nil
        execution(nil, false)

        -- frame.ClearAllPoints is nil
        execution({SetPoint = function() end}, false)

        -- frame.SetPoint is nil
        execution({ClearAllPoints = function() end}, false)

        -- frame is valid
        execution({ClearAllPoints = function() end, SetPoint = function() end}, true)
    end

    -- @covers CenterGossipFrame:centralizeFrame()
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

    -- @covers CenterGossipFrame:centralizeFrame()
    function TestCenterGossipFrame:testCentralizeFrameWhenCantBeCentralized()
        local frame = CreateFrame()

        CenterGossipFrame.canBeCentralized = function() return false end

        CenterGossipFrame:centralizeFrame(frame)

        lu.assertIsNil(frame.clearAllPointsInvoked)
        lu.assertNil(frame.points)
    end

    -- @covers CenterGossipFrame
    function TestCenterGossipFrame:testMainAddonFile()
        lu.assertNotIsNil(CenterGossipFrame)
    end
-- end of MultiTargetsTest