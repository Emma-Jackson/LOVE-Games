function love.load()
  
  screen_width = 500
  screen_height = 300
  
  love.graphics.setBackgroundColor(0, 100, 0)
  love.window.setTitle("Pong")
  love.window.setMode(screen_width, screen_height)
  
  
  ph1 = 50
  pw1 = 7
  ph2 = 50
  pw2 = 7
  
  px2 = 490
  py2 = (screen_height / 2) - (ph1 / 2)
  px1 = 5
  py1 = (screen_height / 2) - (ph1 / 2)
  
  paddle_speed = 300
  paddle2_speed = 300
  
  bh = 6
  bw = 6
  bx = (screen_width / 2) - (bw / 2)
  by = (screen_height / 2) - (bh / 2)
  b_speedx = - 150
  b_speedy = 150

end

function love.update(dt)
  
  if love.keyboard.isDown("q") then
    py1 = py1 - (paddle_speed * dt)
  end
  
  if love.keyboard.isDown("a") then
    py1 = py1 + (paddle_speed * dt)
  end
  
  if love.keyboard.isDown('o') then
    py2 = py2 - (paddle2_speed * dt)
  end
    if love.keyboard.isDown('l') then
    py2 = py2 + (paddle2_speed * dt)
    end
  
  bx = bx + (b_speedx * dt)
  by = by + (b_speedy * dt)

if py1 < 0 then 
  py1 = 0
elseif (py1 + ph1) > screen_height then
  py1 = screen_height - ph1
end

if py2 < 0 then
  py2 = 0
elseif (py2 + ph2) > screen_height then
  py2 = screen_height - ph2
 end
 
 if bx <= pw1 and
  (by + bh) >= py1 and
  by < (py1 + ph1)
 then
  b_speedx = math.abs(b_speedx)
 end

if bx + bw < 0 or bx > screen_width then
  bx = (screen_width / 2) - (bw / 2)
  by = (screen_height / 2) - (bh / 2)
 end
 
if by < 0 then
  b_speedy = math.abs(b_speedy)
elseif (by + bh) > screen_height then
  b_speedy = -math.abs(b_speedy)
end

if (bx + bw) >= (screen_width - pw2) and
  (by + bh) >= py2 and
  by < (py2 + ph2)
  then
    b_speedx = -math.abs(b_speedx)
    end


end


function love.draw()
  
  love.graphics.rectangle("line", 250, 0, 1, 300)
  
  love.graphics.rectangle("fill", px1, py1, pw1, ph1)
  love.graphics.rectangle("fill", px2, py2, pw2, ph2)
  
  love.graphics.circle("fill", bx, by, bw, bh)

end
