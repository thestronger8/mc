local x=0
local y=0
local fx="y"--移动的方向
function move2x(xx)--移动到xx
	if fx=="y" then 
		turtle.turnLeft()
		fx="x"
	end 
	if x>xx then
		n=x-xx
		for i=1,n do
			turtle.back()
		end
	elseif x<xx then
		n=xx-x
		for i=1,n do
			turtle.forward()
		end
	end 
	x=xx 
end

function move2y(yy)
	if fx=="x" then 
		turtle.turnRight()
		fx="y"
	end 
	if y>yy then
		n=y-yy
		for i=1,n do
			turtle.back()
		end
	elseif y<yy then
		n=yy-y
		for i=1,n do
			turtle.forward()
		end
	end 
	y=yy 
end	

function getItem()
	for i=1,16 do
		local data = turtle.getItemCount(i)
		if data>0 then
			turtle.select(i)
			return i
			break
		end 
	end 
	return 0
end 

while getItem>0 do
	local data=turtle.getItemDetail()
	if data then
		nm=data.name
		xx=tonumber(string.sub(nm,-3,-3))
		yy=tonumber(string.sub(nm,-2,-2))	
		
		move2x(xx)
		move2y(yy)
		turtle.placeDown()
	end 
end 
		