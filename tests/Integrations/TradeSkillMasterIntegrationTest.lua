TestTradeSkillMasterIntegration = BaseTestClass:new()

-- @covers TradeSkillMasterIntegration:__construct()
TestCase.new()
    :setName('__construct')
    :setTestClass(TestTradeSkillMasterIntegration)
    :setExecution(function()
        local instance = CenterGossipFrame:new('CenterGossipFrame/TradeSkillMasterIntegration')
        lu.assertNotNil(instance)
    end)
    :register()

-- @covers TradeSkillMasterIntegration:isMerchantFrameVisible()
TestCase.new()
    :setName('isMerchantFrameVisible')
    :setTestClass(TestTradeSkillMasterIntegration)
    :setExecution(function(data)
        _G['TSM_API'] = data.tsmApi

        local instance = CenterGossipFrame:new('CenterGossipFrame/TradeSkillMasterIntegration')

        lu.assertEquals(data.expectedResult, instance:isMerchantFrameVisible())
    end)
    :setScenarios({
        ['tsmApi is nil'] = {
            tsmApi = nil,
            expectedResult = false,
        },
        ['no function'] = {
            tsmApi = {},
            expectedResult = false,
        },
        ['error'] = {
            tsmApi = {
                IsUIVisible = function () error('error') end,
            },
            expectedResult = false,
        },
        ['not visible'] = {
            tsmApi = {
                IsUIVisible = function () return false end,
            },
            expectedResult = false,
        },
        ['visible'] = {
            tsmApi = {
                IsUIVisible = function () return true end,
            },
            expectedResult = true,
        }
    })
    :register()
-- end of TestTradeSkillMasterIntegration