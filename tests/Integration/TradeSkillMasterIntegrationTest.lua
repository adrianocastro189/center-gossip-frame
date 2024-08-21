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
-- end of TestTradeSkillMasterIntegration