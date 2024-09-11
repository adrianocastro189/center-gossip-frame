TestAbstractCoveredFrame = BaseTestClass:new()

-- @covers AbstractCoveredFrame
TestCase.new()
    :setName('abstraction')
    :setTestClass(TestAbstractCoveredFrame)
    :setExecution(function()
        local class = CenterGossipFrame:getClass('AbstractCoveredFrame')

        local expectedMsg = 'This is an abstract method and should be implemented by this class inheritances'

        lu.assertErrorMsgContains(expectedMsg, class.register)
        lu.assertErrorMsgContains(expectedMsg, class.shouldCentralize)
    end)
    :register()

-- @covers AbstractCoveredFrame:applyListener()
TestCase.new()
    :setName('applyListener')
    :setTestClass(TestAbstractCoveredFrame)
    :setExecution(function()
        -- @TODO: Implement this method in CG2 <2024.09.11>
    end)
    :register()