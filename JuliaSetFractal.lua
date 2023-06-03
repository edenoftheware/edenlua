hook.Remove("HUDPaint", "DrawFractal")
local maxIterations = 100
local zoom = 200
local squareSize = 400 -- Size of the square the fractal will be drawn in. I don't recommend making this higher unless you have beefy computer.
local squareOffsetX = (ScrW() - squareSize) / 2
local squareOffsetY = (ScrH() - squareSize) / 2
local time = 0
local animSpeed = 0.02
local baseCReal = -0.88
local baseCImaginary = 0.356
local evoSpeed = 0.001
local evoOffset = 0

// Localization (+3 fps lol)
local surface_DrawRect = surface.DrawRect
local surface_setDrawColor = surface.SetDrawColor
local math_sin = math.sin
local math_cos = math.cos
local math_floor = math.floor
local ScrW = ScrW
local ScrH = ScrH

local halfSquare = squareSize / 2
local maxIterationsInv = 1 / maxIterations

local function draw()
    time = time + animSpeed
    evoOffset = evoOffset + evoSpeed

    zoom = zoom + math_sin(time) * 0.01

    local start_x = squareOffsetX
    local start_y = squareOffsetY
    local end_x = start_x + squareSize
    local end_y = start_y + squareSize

    for x = start_x, end_x do
        for y = start_y, end_y do
            local a = (x - start_x - halfSquare) / zoom
            local b = (y - start_y - halfSquare) / zoom

            local animCReal = baseCReal + math_sin(time) * 0.2
            local animCImaginary = baseCImaginary + math_cos(time) * 0.2

            local evolvedA = a + math_sin(a * evoOffset) * 0.1
            local evolvedB = b + math_cos(b * evoOffset) * 0.1

            local iteration = 0
            while iteration < maxIterations do
                local aa = evolvedA * evolvedA - evolvedB * evolvedB
                local bb = 2 * evolvedA * evolvedB
                evolvedA = aa + animCReal
                evolvedB = bb + animCImaginary

                if evolvedA * evolvedA + evolvedB * evolvedB > 16 then
                    break
                end

                iteration = iteration + 1
            end

            local brightness = math_floor(iteration * maxIterationsInv * 255)
            surface_setDrawColor(brightness, brightness, brightness)
            surface_DrawRect(x, y, 1, 1)
        end
    end
end

hook.Add("HUDPaint", "DrawFractal", draw)
