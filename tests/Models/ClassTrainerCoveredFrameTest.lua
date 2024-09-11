TestClassTrainerCoveredFrame = BaseTestClass:new()

-- @covers ClassTrainerCoveredFrame:__construct()
TestCase.new()
    :setName('__construct')
    :setTestClass(TestClassTrainerCoveredFrame)
    :setExecution(function()
        local instance = CenterGossipFrame:new('CenterGossipFrame/ClassTrainerCoveredFrame')

        lu.assertIsFalse(instance.registered)
    end)
    :register()

-- @covers GenericCoveredFrame:register()
TestCase.new()
    :setName('register')
    :setTestClass(TestClassTrainerCoveredFrame)
    :setExecution(function()

    end)
    :register()

-- @covers GenericCoveredFrame:shouldCentralize()
TestCase.new()
    :setName('shouldCentralize')
    :setTestClass(TestClassTrainerCoveredFrame)
    :setExecution(function()
        local instance = CenterGossipFrame:new('CenterGossipFrame/ClassTrainerCoveredFrame')

        lu.assertIsTrue(instance:shouldCentralize())
    end)
    :register()