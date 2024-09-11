TestAbstractCoveredFrame = BaseTestClass:new()

-- helper method to instantiate the abstract class
function TestAbstractCoveredFrame:instance()
    -- instantiating an abstract class here is ok for the sake of testing
    return setmetatable({}, CenterGossipFrame:getClass('AbstractCoveredFrame'))
end

-- @covers AbstractCoveredFrame
TestCase.new()
    :setName('abstraction')
    :setTestClass(TestAbstractCoveredFrame)
    :setExecution(function()
        local instance = TestAbstractCoveredFrame:instance()

        local expectedMsg = 'This is an abstract method and should be implemented by this class inheritances'

        lu.assertErrorMsgContains(expectedMsg, instance.register)
        lu.assertErrorMsgContains(expectedMsg, instance.shouldCentralize)
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

-- @covers AbstractCoveredFrame:canBeCentralized()
TestCase.new()
    :setName('canBeCentralized')
    :setTestClass(TestAbstractCoveredFrame)
    :setExecution(function()
        -- @TODO: Implement this method in CG3 <2024.09.11>
    end)
    :register()

-- @covers AbstractCoveredFrame:centralizeFrame()
TestCase.new()
    :setName('centralizeFrame')
    :setTestClass(TestAbstractCoveredFrame)
    :setExecution(function()
        -- @TODO: Implement this method in CG4 <2024.09.11>
    end)
    :register()

-- @covers AbstractCoveredFrame:isFrameCentered()
TestCase.new()
    :setName('isFrameCentered')
    :setTestClass(TestAbstractCoveredFrame)
    :setExecution(function()
        -- @TODO: Implement this method in CG5 <2024.09.11>
    end)
    :register()

-- @covers AbstractCoveredFrame:maybeCentralizeFrame()
TestCase.new()
    :setName('maybeCentralizeFrame')
    :setTestClass(TestAbstractCoveredFrame)
    :setExecution(function()
        -- @TODO: Implement this method in CG6 <2024.09.11>
    end)
    :register()