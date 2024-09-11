TestGenericCoveredFrame = BaseTestClass:new()

-- @covers GenericCoveredFrame:__construct()
TestCase.new()
    :setName('__construct')
    :setTestClass(TestGenericCoveredFrame)
    :setExecution(function()
        local gameFrame = Spy.new()

        local instance = CenterGossipFrame:new('CenterGossipFrame/GenericCoveredFrame', gameFrame)

        lu.assertEquals(gameFrame, instance.gameFrame)
    end)
    :register()

-- @covers GenericCoveredFrame:register()
TestCase.new()
    :setName('register')
    :setTestClass(TestGenericCoveredFrame)
    :setExecution(function()
        local instance = Spy
            .new(CenterGossipFrame:new('CenterGossipFrame/GenericCoveredFrame', Spy.new()))
            :mockMethod('applyListener')

        instance:register()

        instance:getMethod('applyListener'):assertCalledOnce()
    end)
    :register()

-- @covers GenericCoveredFrame:shouldCentralize()
TestCase.new()
    :setName('shouldCentralize')
    :setTestClass(TestGenericCoveredFrame)
    :setExecution(function()
        local instance = CenterGossipFrame:new('CenterGossipFrame/GenericCoveredFrame', Spy.new())

        lu.assertIsTrue(instance:shouldCentralize())
    end)
    :register()