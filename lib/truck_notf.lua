local imgui_notf = require 'imgui'
local style = imgui_notf.GetStyle()
local colors = style.Colors
local clr = imgui_notf.Col
local ImVec4 = imgui_notf.ImVec4
local encoding = require 'encoding'
u8 = encoding.UTF8
encoding.default = 'CP1251'
imgui_notf.GetStyle().WindowMinSize = imgui_notf.ImVec2(1.0, 1.0)
local ToScreen = convertGameScreenCoordsToWindowScreenCoords
--[[if not sampTextdrawIsExists(2096) then
	sX, sY = ToScreen(630, 440)
else
   sX, sY = ToScreen(630, 390)
end]]
local message = {}
local typeStyle = {
	{ -- 1 - normal message
		text = imgui_notf.ImColor(255, 255, 255, 255):GetVec4(),
		rightBox = imgui_notf.ImColor(0, 0, 0, 255):GetU32(),
		mainBox = {
			imgui_notf.ImColor(0, 0, 0, 170):GetU32(), -- left top
			imgui_notf.ImColor(0, 0, 0, 235):GetU32(), -- right top
			imgui_notf.ImColor(0, 0, 0, 235):GetU32(), -- left button
			imgui_notf.ImColor(0, 0, 0, 170):GetU32(), -- right button
		}
	},
	{ -- 2 - info message
		text = imgui_notf.ImColor(255, 255, 255, 255):GetVec4(),
		rightBox = imgui_notf.ImColor(0, 157, 194, 255):GetU32(),
		mainBox = {
			imgui_notf.ImColor(0, 137, 174, 170):GetU32(), -- left top
			imgui_notf.ImColor(0, 137, 174, 235):GetU32(), -- right top
			imgui_notf.ImColor(0, 137, 174, 235):GetU32(), -- left button
			imgui_notf.ImColor(0, 137, 174, 170):GetU32(), -- right button
		}
	},
	{ -- 3 - error message
		text = imgui_notf.ImColor(255, 255, 255, 255):GetVec4(),
		rightBox = imgui_notf.ImColor(190, 40, 40, 255):GetU32(),
		mainBox = {
			imgui_notf.ImColor(170, 20, 20, 170):GetU32(), -- left top
			imgui_notf.ImColor(170, 20, 20, 235):GetU32(), -- right top
			imgui_notf.ImColor(170, 20, 20, 235):GetU32(), -- left button
			imgui_notf.ImColor(170, 20, 20, 170):GetU32(), -- right button
		}
	},
	{ -- 4 - custom blue
	text = imgui_notf.ImColor(255, 255, 255, 255):GetVec4(),
	rightBox = imgui_notf.ImColor(123, 138, 211, 255):GetU32(),
	mainBox = {
		imgui_notf.ImColor(103, 118, 191, 170):GetU32(), -- left top
		imgui_notf.ImColor(103, 118, 191, 235):GetU32(), -- right top
		imgui_notf.ImColor(103, 118, 191, 235):GetU32(), -- left button
		imgui_notf.ImColor(103, 118, 191, 170):GetU32(), -- right button
	}
	},
	{ -- 5 - custom dark blue
	text = imgui_notf.ImColor(255, 255, 255, 255):GetVec4(),
	rightBox = imgui_notf.ImColor(60, 66, 95, 255):GetU32(),
	mainBox = {
		imgui_notf.ImColor(40, 46, 75, 170):GetU32(), -- left top
		imgui_notf.ImColor(40, 46, 75, 235):GetU32(), -- right top
		imgui_notf.ImColor(40, 46, 75, 235):GetU32(), -- left button
		imgui_notf.ImColor(40, 46, 75, 170):GetU32(), -- right button
	}
	}
}
local msxMsg = 3
--[[local notfList = {
	pos = {
		x = sX - 200,
		y = sY
	},
	npos = {
		x = sX - 200,
		y = sY
	},
	size = {
		x = 200,
		y = 0
	}
}]]
function setstyle()
	style.WindowRounding = 2.0
	style.WindowTitleAlign = imgui_notf.ImVec2(0.5, 0.5)
	style.ChildWindowRounding = 2.0
	style.FrameRounding = 2.0
	style.ItemSpacing = imgui_notf.ImVec2(5.0, 4.0)
	style.ScrollbarSize = 13.0
	style.ScrollbarRounding = 0
	style.GrabMinSize = 8.0
	style.GrabRounding = 1.0
	-- style.Alpha =
	style.WindowPadding = imgui_notf.ImVec2(4.0, 4.0)
	style.WindowMinSize = imgui_notf.ImVec2(1.0, 1.0)
	style.FramePadding = imgui_notf.ImVec2(3.5, 3.5)
	-- style.ItemInnerSpacing =
	-- style.TouchExtraPadding =
	-- style.IndentSpacing =
	-- style.ColumnsMinSpacing = ?
	style.ButtonTextAlign = imgui_notf.ImVec2(0.0, 0.5)
	-- style.DisplayWindowPadding =
	-- style.DisplaySafeAreaPadding =
	-- style.AntiAliasedLines =
	-- style.AntiAliasedShapes =
	-- style.CurveTessellationTol =

	colors[clr.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00)
	colors[clr.TextDisabled]           = ImVec4(0.50, 0.50, 0.50, 1.00)
	colors[clr.WindowBg]               = ImVec4(0.06, 0.06, 0.06, 0.00)
	colors[clr.ChildWindowBg]          = ImVec4(1.00, 1.00, 1.00, 0.00)
	colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94)
	colors[clr.ComboBg]                = colors[clr.PopupBg]
	colors[clr.Border]                 = ImVec4(0.43, 0.43, 0.50, 0.50)
	colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
	colors[clr.FrameBg]                = ImVec4(0.12, 0.12, 0.12, 0.94)
	colors[clr.FrameBgHovered]         = ImVec4(0.45, 0.45, 0.45, 0.85)
	colors[clr.FrameBgActive]          = ImVec4(0.63, 0.63, 0.63, 0.63)
	colors[clr.TitleBg]                = ImVec4(0.13, 0.13, 0.13, 0.99)
	colors[clr.TitleBgActive]          = ImVec4(0.13, 0.13, 0.13, 0.99)
	colors[clr.TitleBgCollapsed]       = ImVec4(0.05, 0.05, 0.05, 0.79)
	colors[clr.MenuBarBg]              = ImVec4(0.14, 0.14, 0.14, 1.00)
	colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.53)
	colors[clr.ScrollbarGrab]          = ImVec4(0.31, 0.31, 0.31, 1.00)
	colors[clr.ScrollbarGrabHovered]   = ImVec4(0.41, 0.41, 0.41, 1.00)
	colors[clr.ScrollbarGrabActive]    = ImVec4(0.51, 0.51, 0.51, 1.00)
	colors[clr.CheckMark]              = ImVec4(1.00, 1.00, 1.00, 1.00)
	colors[clr.SliderGrab]             = ImVec4(0.28, 0.28, 0.28, 1.00)
	colors[clr.SliderGrabActive]       = ImVec4(0.35, 0.35, 0.35, 1.00)
	colors[clr.Button]                 = ImVec4(0.12, 0.12, 0.12, 0.94)
	colors[clr.ButtonHovered]          = ImVec4(0.34, 0.34, 0.35, 0.89)
	colors[clr.ButtonActive]           = ImVec4(0.21, 0.21, 0.21, 0.81)
	colors[clr.Header]                 = ImVec4(0.12, 0.12, 0.12, 0.94)
	colors[clr.HeaderHovered]          = ImVec4(0.34, 0.34, 0.35, 0.89)
	colors[clr.HeaderActive]           = ImVec4(0.12, 0.12, 0.12, 0.94)
	colors[clr.Separator]              = colors[clr.Border]
	colors[clr.SeparatorHovered]       = ImVec4(0.26, 0.59, 0.98, 0.78)
	colors[clr.SeparatorActive]        = ImVec4(0.26, 0.59, 0.98, 1.00)
	colors[clr.ResizeGrip]             = ImVec4(0.26, 0.59, 0.98, 0.25)
	colors[clr.ResizeGripHovered]      = ImVec4(0.26, 0.59, 0.98, 0.67)
	colors[clr.ResizeGripActive]       = ImVec4(0.26, 0.59, 0.98, 0.95)
	colors[clr.CloseButton]            = ImVec4(0.41, 0.41, 0.41, 0.50)
	colors[clr.CloseButtonHovered]     = ImVec4(0.98, 0.39, 0.36, 1.00)
	colors[clr.CloseButtonActive]      = ImVec4(0.98, 0.39, 0.36, 1.00)
	colors[clr.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00)
	colors[clr.PlotLinesHovered]       = ImVec4(1.00, 0.43, 0.35, 1.00)
	colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00)
	colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
	colors[clr.TextSelectedBg]         = ImVec4(0.26, 0.59, 0.98, 0.35)
	colors[clr.ModalWindowDarkening]   = ImVec4(0.80, 0.80, 0.80, 0.35)
end
setstyle()

function main()
	while not isSampAvailable() do wait(100) end
	while true do
		wait(0)
		imgui_notf.ShowCursor = false
		imgui_notf.SetMouseCursor(-1)
		imgui_notf.Process = true
	end
end

function imgui_notf.OnDrawFrame()
	onRenderNotification()
end

function onRenderNotification()
--	wX = imgui_notf.GetWindowWidth()
	local count = 0
	for k, v in ipairs(message) do
		local push = false
		if v.active and v.time < os.clock() then
			v.active = false
		end
		if count < msxMsg then
			if not v.active then
				if v.showtime > 0 then
					v.active = true
					v.time = os.clock() + v.showtime
					v.showtime = 0
				end
			end
			if v.active then
				count = count + 1
				if v.time + 3.000 >= os.clock() then
					imgui_notf.PushStyleVar(imgui_notf.StyleVar.Alpha, (v.time - os.clock()) / 1.0)
					push = true
				end
				local nText = u8(tostring(v.text))
				notfList.size = imgui_notf.GetFont():CalcTextSizeA(imgui_notf.GetFont().FontSize, 200.0, 196.0, nText)
				notfList.pos = imgui_notf.ImVec2(notfList.pos.x, notfList.pos.y - (notfList.size.y + (count == 1 and 8 or 13)))
				imgui_notf.SetNextWindowPos(notfList.pos, _, imgui_notf.ImVec2(0.0, 0.0))
				imgui_notf.SetNextWindowSize(imgui_notf.ImVec2(200, notfList.size.y + imgui_notf.GetStyle().ItemSpacing.y + imgui_notf.GetStyle().WindowPadding.y))
				imgui_notf.Begin(u8'##msg' .. k, _, imgui_notf.WindowFlags.NoCollapse + imgui_notf.WindowFlags.NoResize + imgui_notf.WindowFlags.NoScrollbar + imgui_notf.WindowFlags.NoMove + imgui_notf.WindowFlags.NoTitleBar)

				local style
				if type(v.style) == "table" then
					style = v.style
				else
					style = typeStyle[v.style] or typeStyle[1]
				end

				local draw_list = imgui_notf.GetWindowDrawList()
				local p = imgui_notf.GetCursorScreenPos()
			--	imgui_notf.SetCursorPosX(wX - 392)
				draw_list:AddRectFilledMultiColor(imgui_notf.ImVec2(p.x - imgui_notf.GetStyle().WindowPadding.x - 20, p.y - imgui_notf.GetStyle().WindowPadding.y), imgui_notf.ImVec2(p.x + 185, p.y + notfList.size.y + imgui_notf.GetStyle().ItemSpacing.y + imgui_notf.GetStyle().WindowPadding.y), style.mainBox[1], style.mainBox[2], style.mainBox[3], style.mainBox[4]);
				draw_list:AddRectFilled(imgui_notf.ImVec2(p.x - imgui_notf.GetStyle().WindowPadding.x + 190, p.y - imgui_notf.GetStyle().WindowPadding.y), imgui_notf.ImVec2(p.x + 216, p.y + notfList.size.y + imgui_notf.GetStyle().ItemSpacing.y + imgui_notf.GetStyle().WindowPadding.y), style.rightBox);

				imgui_notf.PushTextWrapPos(196.0)
				imgui_notf.TextColored(style.text, nText)
				imgui_notf.PopTextWrapPos()

				imgui_notf.End()

				if push then
					imgui_notf.PopStyleVar()
				end
			end
		end
	end
	if not sampTextdrawIsExists(2110) then
		sX, sY = ToScreen(630, 440)
   	else
	   sX, sY = ToScreen(630, 390)
	end
	notfList = {
		pos = {
			x = sX - 200,
			y = sY
		},
		npos = {
			x = sX - 200,
			y = sY
		},
		size = {
			x = 200,
			y = 0
		}
	}
end


function EXPORTS.addNotification(text, time, style)
	local style = style or 1
	message[#message+1] = {active = false, time = 0, showtime = time, text = text, style = style}
end

-- local function New()
-- 	return {
-- 		onRenderNotification = function()
-- 			return onRenderNotification()
-- 		end,
-- 		addNotification = function(text, time)
-- 			return addNotification(text, time)
-- 		end
-- 	}
-- end
-- local notification = New()
-- notification.New = New
-- return notification
