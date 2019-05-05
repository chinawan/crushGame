--
-- Author: laofuzai
-- Date: 2019-05-05 14:28:28
--
local Bubble = class("Bubble", function()
    return display.newSprite()
end)

function Bubble:ctor()
	self.ID  = 0
	self.posX = 0  --对应 泡泡矩阵中的 X Y 的位置
	self.posY = 0
	self.RuleLayer={}  
end

--[[设置个体泡泡的属性数据]]
function Bubble:setData( ID)
	-- body
	self.ID= ID
	local frameName = string.format("Item%d.png", ID)
	--print("frameName",frameName)
    
    local frame = display.newSpriteFrame(frameName)
    self:setSpriteFrame(frame)

end

--[[移动到某个格子]]
function Bubble:moveToGrid(x , y , back)
	--目标的坐标
    
    --print(x,y)
    -- self:stopAllActions()
    -- self:setScale(1)
	local tarX = self.RuleLayer.startPos.x + self.RuleLayer.bubbleLen* (y-1)
	local tarY = self.RuleLayer.startPos.y + self.RuleLayer.bubbleLen* (x-1)

	--print(tarX,tarY)

	-- 移动动作
	self:runAction(transition.sequence({
		cc.MoveTo:create(0.3,cc.p(tarX,tarY)),
		cc.CallFunc:create(function()
			if back then
				self:stopAllActions()
				self:setScale(1)
			end
		end)
	}))

end

function Bubble:selectStatus()
	self:runAction(cc.RepeatForever:create(transition.sequence({
		cc.ScaleTo:create(0.5, 0.9),
		cc.ScaleTo:create(0.5, 1)
	})))
end

return Bubble