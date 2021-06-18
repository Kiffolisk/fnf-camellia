-- funny modchart variables
local doFunnySpinny = false
local doHell = false
local hellVar = 0.0005
local currentBeat = 0
local wantedZoom = 1;

local clock = os.clock

function sleep(n)
	local t0 = clock()
	while clock() - t0 <= n do end
end

-- unused
local coolShit = true

function start(song) -- do nothing
	local currentBeat = (songPos / 1000)*(bpm/60)
end

function update(elapsed)
	tweenCameraZoom(wantedZoom, (crochet * 4) / 1000)
	local currentBeat = (songPos / 1000)*(bpm/60)
	for i=0,7 do
		if doFunnySpinny then
			setActorAngle(_G['defaultStrum'..i..'Angle'] + funnySpinnySpeed, i)
		else
			setActorAngle(_G['defaultStrum'..i..'Angle'], i)
		end
		if doHell then
			setActorAlpha(getActorAlpha(i) - hellVar, i)
		else
			setActorAlpha(1, i)
		end
	end
    if curStep == 12 then
        -- local currentBeat = (songPos / 1000)*(bpm/60)
		wantedZoom = 2
    end
	if curStep == 44 then
        -- local currentBeat = (songPos / 1000)*(bpm/60)
		wantedZoom = 1
    end
	if curStep == 135 then
        -- local currentBeat = (songPos / 1000)*(bpm/60)
		doHell = true
		wantedZoom = 0.7
    end
	if curStep == 167 then
        -- local currentBeat = (songPos / 1000)*(bpm/60)
		doHell = false
		wantedZoom = 1
    end
end

function beatHit(beat)
	
end

function stepHit(step) -- do nothing

end