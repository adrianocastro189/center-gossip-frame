TestMerchantCoveredFrame = BaseTestClass:new()

-- @covers MerchantCoveredFrame:__construct()
TestCase.new()
    :setName('__construct')
    :setTestClass(TestMerchantCoveredFrame)
    :setExecution(function()
        _G['MerchantFrame'] = 'MerchantFrame'

        local instance = CenterGossipFrame:new('CenterGossipFrame/MerchantCoveredFrame')

        lu.assertEquals('MerchantFrame', instance.gameFrame)
    end)
    :register()

-- @covers MerchantCoveredFrame:shouldCentralize()
TestCase.new()
    :setName('shouldCentralize')
    :setTestClass(TestMerchantCoveredFrame)
    :setExecution(function(data)
        CenterGossipFrame.tsmIntegration = Spy
            .new()
            :mockMethod('isMerchantFrameVisible', function() return data.isMerchantFrameVisible end)

        local instance = CenterGossipFrame:new('CenterGossipFrame/MerchantCoveredFrame', Spy.new())

        lu.assertEquals(data.expectedResult, instance:shouldCentralize())
    end)
    :setScenarios({
        ['MerchantFrame is visible'] = {
            isMerchantFrameVisible = true,
            expectedResult = false,
        },
        ['MerchantFrame is not visible'] = {
            isMerchantFrameVisible = false,
            expectedResult = true,
        },
    })
    :register()