-- Blink using timer alarm --

timerId = 0
dly = 1000
local ledPinR = 23
local ledPinG = 5
local ledPinB = 4
local ledStateR = 0
local ledStateG = 0
local ledStateB = 0

-- set mode to output
gpio.config({
	gpio = { ledPinR, ledPinG, ledPinB },
	dir = gpio.OUT,
})

-- timer loop
local function toggleR()
	ledStateR = 1 - ledStateR
	ledStateG = 1 - ledStateG
	ledStateR = 1 - ledStateB
	gpio.write(ledPinR, ledStateR)
	gpio.write(ledPinG, ledStateG)
	gpio.write(ledPinB, ledStateB)
	-- print("Hello")
end

local function toggleG()
	ledStateG = 1 - ledStateG
	gpio.write(ledPinG, ledStateG)
	-- print("Hello")
end

local function toggleB()
	ledStateB = 1 - ledStateB
	gpio.write(ledPinB, ledStateB)
	-- print("Hello")
end

mytimer = tmr.create()
mytimer:alarm(1000, tmr.ALARM_AUTO, toggleR)
-- mytimer:alarm(1000, tmr.ALARM_AUTO, toggleG)
-- mytimer:alarm(1000, tmr.ALARM_AUTO, toggleB)
