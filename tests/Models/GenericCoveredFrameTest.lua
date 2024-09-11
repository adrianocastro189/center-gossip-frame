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