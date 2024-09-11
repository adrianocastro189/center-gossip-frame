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

-- @covers ClassTrainerCoveredFrame:maybeRegisterOnTrainerUpdate()
TestCase.new()
    :setName('maybeRegisterOnTrainerUpdate')
    :setTestClass(TestClassTrainerCoveredFrame)
    :setExecution(function(data)
        _G['ClassTrainerFrame'] = 'ClassTrainerFrame'

        local instance = Spy
            .new(CenterGossipFrame:new('CenterGossipFrame/ClassTrainerCoveredFrame'))
            :mockMethod('applyListener')

        instance.gameFrame = data.gameFrame

        instance:maybeRegisterOnTrainerUpdate()

        lu.assertEquals(ClassTrainerFrame, instance.gameFrame)
        instance:getMethod('applyListener'):assertCalledOrNot(data.shouldCallApplyListener)
    end)
    :setScenarios({
        ['gameFrame is set'] = {
            gameFrame = 'ClassTrainerFrame',
            shouldCallApplyListener = false,
        },
        ['gameFrame is not set'] = {
            gameFrame = nil,
            shouldCallApplyListener = true,
        },
    })
    :register()

-- @covers ClassTrainerCoveredFrame:register()
TestCase.new()
    :setName('register')
    :setTestClass(TestClassTrainerCoveredFrame)
    :setExecution(function()

    end)
    :register()

-- @covers ClassTrainerCoveredFrame:shouldCentralize()
TestCase.new()
    :setName('shouldCentralize')
    :setTestClass(TestClassTrainerCoveredFrame)
    :setExecution(function()
        local instance = CenterGossipFrame:new('CenterGossipFrame/ClassTrainerCoveredFrame')

        lu.assertIsTrue(instance:shouldCentralize())
    end)
    :register()