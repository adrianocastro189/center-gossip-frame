TestCenterGossipFrame = BaseTestClass:new()

-- @covers CenterGossipFrame:applyListener()
TestCase.new()
    :setName('applyListener')
    :setTestClass(TestCenterGossipFrame)
    :setExecution(function(data)
        CenterGossipFrame = Spy
            .new(CenterGossipFrame)
            :mockMethod('canBeCentralized', function() return data.canBeCentralized end)
            :mockMethod('maybeCentralizeFrame')

        local frameSpy = Spy
            .new()
            :mockMethod('HookScript')

        CenterGossipFrame:applyListener(frameSpy)

        CenterGossipFrame:getMethod('canBeCentralized'):assertCalledOnceWith(frameSpy)
        frameSpy:getMethod('HookScript'):assertCalledOrNot(data.shouldHookScript)
    end)
    :setScenarios({
        ['can be centralized'] = {
            canBeCentralized = true,
            shouldHookScript = true,
        },
        ["can't be centralized"] = {
            canBeCentralized = false,
            shouldHookScript = false,
        },
    })
    :register()

-- @covers CenterGossipFrame:canBeCentralized()
TestCase.new()
    :setName('canBeCentralized')
    :setTestClass(TestCenterGossipFrame)
    :setExecution(function(data)
        local result = CenterGossipFrame:canBeCentralized(data.frame)

        lu.assertEquals(data.expected, result)
    end)
    :setScenarios({
        ['frame is nil'] = {
            frame = nil,
            expected = false,
        },
        ['frame.ClearAllPoints is nil'] = {
            frame = { SetPoint = function() end },
            expected = false,
        },
        ['frame.SetPoint is nil'] = {
            frame = { ClearAllPoints = function() end },
            expected = false,
        },
        ['frame is valid'] = {
            frame = { ClearAllPoints = function() end, SetPoint = function() end },
            expected = true,
        },
    })
    :register()

-- @covers CenterGossipFrame:centralizeFrame()
TestCase.new()
    :setName('centralizeFrame')
    :setTestClass(TestCenterGossipFrame)
    :setExecution(function(data)
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
    end)
    :register()

-- @covers CenterGossipFrame:isFrameCentered()
TestCase.new()
    :setName('isFrameCentered')
    :setTestClass(TestCenterGossipFrame)
    :setExecution(function(data)
        local frameSpy = Spy
            .new()
            :mockMethod('GetPoint', function()
                return
                    data.point,
                    data.relativeTo,
                    data.relativePoint,
                    data.offsetX,
                    data.offsetY
            end)

        local result = CenterGossipFrame:isFrameCentered(frameSpy)

        lu.assertEquals(data.expected, result)
    end)
    :setScenarios({
        ['frame is not centered'] = {
            point = 'TOPLEFT',
            relativeTo = UIParent,
            relativePoint = 'TOPLEFT',
            offsetX = 0,
            offsetY = 0,
            expected = false,
        },
        ['frame is centered'] = {
            point = 'CENTER',
            relativeTo = UIParent,
            relativePoint = 'CENTER',
            offsetX = 0,
            offsetY = 0,
            expected = true,
        },
    })
    :register()

-- @covers CenterGossipFrame
TestCase.new()
    :setName('mainAddonFile')
    :setTestClass(TestCenterGossipFrame)
    :setExecution(function()
        lu.assertNotIsNil(CenterGossipFrame)
        lu.assertNotIsNil(CenterGossipFrame.tsmIntegration)
    end)
    :register()

-- @covers CenterGossipFrame:maybeCentralizeFrame()
TestCase.new()
    :setName('maybeCentralizeFrame')
    :setTestClass(TestCenterGossipFrame)
    :setExecution(function(data)
        local frame = Spy.new()

        CenterGossipFrame = Spy
            .new(CenterGossipFrame)
            :mockMethod('isFrameCentered', function() return data.isFrameCentered end)
            :mockMethod('centralizeFrame')

        CenterGossipFrame:maybeCentralizeFrame(frame)

        if data.shouldInvokeCentralizeFrame then
            CenterGossipFrame:getMethod('isFrameCentered'):assertCalledOnceWith(frame)
            return
        end

        CenterGossipFrame:getMethod('centralizeFrame'):assertNotCalled()
    end)
    :setScenarios({
        ['frame is centered'] = {
            isFrameCentered = true,
            shouldInvokeCentralizeFrame = false,
        },
        ['frame is not centered'] = {
            isFrameCentered = false,
            shouldInvokeCentralizeFrame = true,
        },
    })
    :register()
-- end of MultiTargetsTest
