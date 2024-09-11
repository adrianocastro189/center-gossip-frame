TestGenericCoveredFrame = BaseTestClass:new()

-- @covers GenericCoveredFrame:__construct()
TestCase.new()
    :setName('__construct')
    :setTestClass(TestGenericCoveredFrame)
    :setExecution(function()
        local gameFrame = Spy.new()

        local instance = CenterGossipFrame:new('GenericCoveredFrame', gameFrame)

        lu.assertEquals(gameFrame, instance.gameFrame)
    end)
    :register()

-- @covers GenericCoveredFrame:register()
TestCase.new()
    :setName('register')
    :setTestClass(TestGenericCoveredFrame)
    :setExecution(function()
        local instance = Spy
            .new(CenterGossipFrame:new('GenericCoveredFrame', Spy.new()))
            :mockMethod('applyListener')

        instance:register()

        instance:getMethod('applyListener'):assertCalledOnce()
    end)
    :register()