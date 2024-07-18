---@diagnostic disable: duplicate-set-field

TestCenterGossipFrame = BaseTestClass:new()
    -- @covers CenterGossipFrame:applyListener()
    function TestCenterGossipFrame:testApplyListener()
        CenterGossipFrame.canBeCentralized = function() return true end
        CenterGossipFrame.maybeCentralizeFrame = function(self, gameFrame)
            CenterGossipFrame.centralizeInvoked = true
            gameFrame.centralized = true
        end

        local frame = {
            HookScript = function(self, event, callback)
                self.event = event
                self.callback = callback
            end
        }

        CenterGossipFrame:applyListener(frame)

        lu.assertEquals('OnUpdate', frame.event)
        lu.assertIsNil(CenterGossipFrame.centralizeInvoked)
        lu.assertIsNil(frame.centralized)

        frame.callback()

        lu.assertTrue(CenterGossipFrame.centralizeInvoked)
        lu.assertTrue(frame.centralized)
    end

    -- @covers CenterGossipFrame:applyListener()
    function TestCenterGossipFrame:testApplyListenerWhenCantBeCentralized()
        CenterGossipFrame.canBeCentralized = function() return false end
        
        local frame = {
            HookScript = function(self)
                self.scriptHooked = true
            end
        }

        CenterGossipFrame:applyListener(frame)

        lu.assertIsNil(frame.scriptHooked)
    end    

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

    -- @covers CenterGossipFrame:isFrameCentered()
    function TestCenterGossipFrame:testIsFrameCentered()
        local function execution(point, relativeTo, relativePoint, offsetX, offsetY, expected)
            local frame = {
                GetPoint = function()
                    return point, relativeTo, relativePoint, offsetX, offsetY
                end
            }

            lu.assertEquals(expected, CenterGossipFrame:isFrameCentered(frame))
        end

        -- frame is not centered
        execution('TOPLEFT', UIParent, 'TOPLEFT', 0, 0, false)

        -- frame is centered
        execution('CENTER', UIParent, 'CENTER', 0, 0, true)
    end

    -- @covers CenterGossipFrame
    function TestCenterGossipFrame:testMainAddonFile()
        lu.assertNotIsNil(CenterGossipFrame)
    end

    -- @covers CenterGossipFrame:maybeCentralizeFrame()
    function TestCenterGossipFrame:testMaybeCentralizeFrame()
        local function execution(isFrameCentered, shouldInvokeCentralizeFrame)
            local frame = CreateFrame()
            frame.centralizeInvoked = false

            CenterGossipFrame.isFrameCentered = function() return isFrameCentered end
            CenterGossipFrame.centralizeFrame = function() frame.centralizeInvoked = true end

            CenterGossipFrame:maybeCentralizeFrame(frame)

            lu.assertEquals(shouldInvokeCentralizeFrame, frame.centralizeInvoked)
        end

        -- frame is centered
        execution(true, false)

        -- frame is not centered
        execution(false, true)
    end
-- end of MultiTargetsTest