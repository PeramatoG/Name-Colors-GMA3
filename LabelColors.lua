-- grandMA3 Lua — Name colors for selected presets and LABEL them
-- Reads Preset Pool 4 via GetPresetData, finds nearest color name, and runs: Label Preset 4.X "<Name>"

-- -------- Named color tables --------
local HTML_COLORS = {
 {n="AliceBlue",r=240,g=248,b=255},{n="AntiqueWhite",r=250,g=235,b=215},
 {n="Aquamarine",r=127,g=255,b=212},{n="Azure",r=240,g=255,b=255},{n="Beige",r=245,g=245,b=220},
 {n="Bisque",r=255,g=228,b=196},{n="Black",r=0,g=0,b=0},{n="BlanchedAlmond",r=255,g=235,b=205},
 {n="Blue",r=0,g=0,b=255},{n="BlueViolet",r=138,g=43,b=226},{n="Brown",r=165,g=42,b=42},
 {n="BurlyWood",r=222,g=184,b=135},{n="CadetBlue",r=95,g=158,b=160},{n="Chartreuse",r=127,g=255,b=0},
 {n="Chocolate",r=210,g=105,b=30},{n="Coral",r=255,g=127,b=80},{n="CornflowerBlue",r=100,g=149,b=237},
 {n="Cornsilk",r=255,g=248,b=220},{n="Crimson",r=220,g=20,b=60},{n="Cyan",r=0,g=255,b=255},
 {n="DarkBlue",r=0,g=0,b=139},{n="DarkCyan",r=0,g=139,b=139},{n="DarkGoldenRod",r=184,g=134,b=11},
 {n="DarkGrey",r=169,g=169,b=169},{n="DarkGreen",r=0,g=100,b=0},
 {n="DarkKhaki",r=189,g=183,b=107},{n="DarkMagenta",r=139,g=0,b=139},{n="DarkOliveGreen",r=85,g=107,b=47},
 {n="DarkOrange",r=255,g=140,b=0},{n="DarkOrchid",r=153,g=50,b=204},{n="DarkRed",r=139,g=0,b=0},
 {n="DarkSalmon",r=233,g=150,b=122},{n="DarkSeaGreen",r=143,g=188,b=143},{n="DarkSlateBlue",r=72,g=61,b=139},
 {n="DarkSlateGrey",r=47,g=79,b=79},{n="DarkTurquoise",r=0,g=206,b=209},
 {n="DarkViolet",r=148,g=0,b=211},{n="DeepPink",r=255,g=20,b=147},{n="DeepSkyBlue",r=0,g=191,b=255},
 {n="DimGrey",r=105,g=105,b=105},{n="DodgerBlue",r=30,g=144,b=255},
 {n="FireBrick",r=178,g=34,b=34},{n="FloralWhite",r=255,g=250,b=240},{n="ForestGreen",r=34,g=139,b=34},
 {n="Magenta",r=255,g=0,b=255},{n="Gainsboro",r=220,g=220,b=220},{n="GhostWhite",r=248,g=248,b=255},
 {n="Gold",r=255,g=215,b=0},{n="GoldenRod",r=218,g=165,b=32},
 {n="Grey",r=128,g=128,b=128},{n="Green",r=0,g=128,b=0},{n="GreenYellow",r=173,g=255,b=47},
 {n="HoneyDew",r=240,g=255,b=240},{n="HotPink",r=255,g=105,b=180},{n="IndianRed",r=205,g=92,b=92},
 {n="Indigo",r=75,g=0,b=130},{n="Ivory",r=255,g=255,b=240},{n="Khaki",r=240,g=230,b=140},
 {n="Lavender",r=230,g=230,b=250},{n="LavenderBlush",r=255,g=240,b=245},{n="LawnGreen",r=124,g=252,b=0},
 {n="LemonChiffon",r=255,g=250,b=205},{n="LightBlue",r=173,g=216,b=230},{n="LightCoral",r=240,g=128,b=128},
 {n="LightCyan",r=224,g=255,b=255},{n="LightGoldenRodYellow",r=250,g=250,b=210},
 {n="LightGrey",r=211,g=211,b=211},{n="LightGreen",r=144,g=238,b=144},{n="LightPink",r=255,g=182,b=193},
 {n="LightSalmon",r=255,g=160,b=122},{n="LightSeaGreen",r=32,g=178,b=170},{n="LightSkyBlue",r=135,g=206,b=250},
 {n="LightSlateGrey",r=119,g=136,b=153},{n="LightSteelBlue",r=176,g=196,b=222},
 {n="LightYellow",r=255,g=255,b=224},{n="Lime",r=0,g=255,b=0},{n="LimeGreen",r=50,g=205,b=50},
 {n="Linen",r=250,g=240,b=230},{n="Maroon",r=128,g=0,b=0},
 {n="MediumAquaMarine",r=102,g=205,b=170},{n="MediumBlue",r=0,g=0,b=205},{n="MediumOrchid",r=186,g=85,b=211},
 {n="MediumPurple",r=147,g=112,b=219},{n="MediumSeaGreen",r=60,g=179,b=113},{n="MediumSlateBlue",r=123,g=104,b=238},
 {n="MediumSpringGreen",r=0,g=250,b=154},{n="MediumTurquoise",r=72,g=209,b=204},{n="MediumVioletRed",r=199,g=21,b=133},
 {n="MidnightBlue",r=25,g=25,b=112},{n="MintCream",r=245,g=255,b=250},{n="MistyRose",r=255,g=228,b=225},
 {n="Moccasin",r=255,g=228,b=181},{n="NavajoWhite",r=255,g=222,b=173},{n="Navy",r=0,g=0,b=128},
 {n="OldLace",r=253,g=245,b=230},{n="Olive",r=128,g=128,b=0},{n="OliveDrab",r=107,g=142,b=35},
 {n="Orange",r=255,g=165,b=0},{n="OrangeRed",r=255,g=69,b=0},{n="Orchid",r=218,g=112,b=214},
 {n="PaleGoldenRod",r=238,g=232,b=170},{n="PaleGreen",r=152,g=251,b=152},{n="PaleTurquoise",r=175,g=238,b=238},
 {n="PaleVioletRed",r=219,g=112,b=147},{n="PapayaWhip",r=255,g=239,b=213},{n="PeachPuff",r=255,g=218,b=185},
 {n="Peru",r=205,g=133,b=63},{n="Pink",r=255,g=192,b=203},{n="Plum",r=221,g=160,b=221},
 {n="PowderBlue",r=176,g=224,b=230},{n="Purple",r=128,g=0,b=128},{n="RebeccaPurple",r=102,g=51,b=153},
 {n="Red",r=255,g=0,b=0},{n="RosyBrown",r=188,g=143,b=143},{n="RoyalBlue",r=65,g=105,b=225},
 {n="SaddleBrown",r=139,g=69,b=19},{n="Salmon",r=250,g=128,b=114},{n="SandyBrown",r=244,g=164,b=96},
 {n="SeaGreen",r=46,g=139,b=87},{n="SeaShell",r=255,g=245,b=238},{n="Sienna",r=160,g=82,b=45},
 {n="Silver",r=192,g=192,b=192},{n="SkyBlue",r=135,g=206,b=235},{n="SlateBlue",r=106,g=90,b=205},
 {n="SlateGrey",r=112,g=128,b=144},{n="Snow",r=255,g=250,b=250},
 {n="SpringGreen",r=0,g=255,b=127},{n="SteelBlue",r=70,g=130,b=180},{n="Tan",r=210,g=180,b=140},
 {n="Teal",r=0,g=128,b=128},{n="Thistle",r=216,g=191,b=216},{n="Tomato",r=255,g=99,b=71},
 {n="Turquoise",r=64,g=224,b=208},{n="Violet",r=238,g=130,b=238},{n="Wheat",r=245,g=222,b=179},
 {n="White",r=255,g=255,b=255},{n="WhiteSmoke",r=245,g=245,b=245},{n="Yellow",r=255,g=255,b=0},
 {n="YellowGreen",r=154,g=205,b=50}
}

local BASIC_COLORS = {
 {n="White",r=255,g=255,b=255},
 {n="Red",r=255,g=0,b=0},{n="Orange",r=255,g=127,b=0},{n="Yellow",r=255,g=255,b=0},
 {n="Fern Green",r=127,g=255,b=0},{n="Green",r=0,g=255,b=0},{n="Sea Green",r=0,g=255,b=127},
 {n="Cyan",r=0,g=255,b=255},{n="Blue",r=0,g=127,b=255},{n="Dark Blue",r=0,g=0,b=255},
 {n="Purple",r=127,g=0,b=255},{n="Magenta",r=255,g=0,b=255},{n="Pink",r=255,g=0,b=127},
 {n="Light Red",r=255,g=127,b=127},{n="Light Orange",r=255,g=191,b=127},{n="Light Yellow",r=255,g=255,b=127},
 {n="Light Fern Green",r=191,g=255,b=127},{n="Light Green",r=127,g=255,b=127},{n="Light Sea Green",r=127,g=255,b=191},
 {n="Light Cyan",r=127,g=255,b=255},{n="Light Blue",r=127,g=191,b=255},{n="Light Dark Blue",r=127,g=127,b=255},
 {n="Light Purple",r=191,g=127,b=255},{n="Light Magenta",r=255,g=127,b=255},{n="Light Pink",r=255,g=127,b=191}
}

-- -------- Utilities --------
local function norm255_from100(x) return math.floor((x or 0)*2.55 + 0.5) end
local function srgb_to_linear(c) if c<=0.04045 then return c/12.92 else return ((c+0.055)/1.055)^2.4 end end
local function nearest_name_from_table(tbl, r255, g255, b255)
    local rl, gl, bl = srgb_to_linear(r255/255), srgb_to_linear(g255/255), srgb_to_linear(b255/255)
    local best, bestd = tbl[1].n, 1e12
    for _,c in ipairs(tbl) do
        local cr, cg, cb = srgb_to_linear(c.r/255), srgb_to_linear(c.g/255), srgb_to_linear(c.b/255)
        local dr, dg, db = rl-cr, gl-cg, bl-cb
        local d = dr*dr + dg*dg + db*db
        if d < bestd then best, bestd = c.n, d end
    end
    return best
end

-- Find absolute values for ColorRGB_R/G/B (0..100) inside the nested preset table
local function extract_rgb_table(t, path, rgb)
    if type(t) ~= "table" then return end
    path = path or ""
    rgb = rgb or {r=nil,g=nil,b=nil}
    for k,v in pairs(t) do
        local kp = (path=="" and tostring(k)) or (path.."/"..tostring(k))
        if type(v)=="table" then
            extract_rgb_table(v, kp, rgb)
        elseif k=="absolute" and type(v)=="number" then
            local lkp = kp:lower()
            if lkp:find("/colorrgb_r/") then rgb.r = v end
            if lkp:find("/colorrgb_g/") then rgb.g = v end
            if lkp:find("/colorrgb_b/") then rgb.b = v end
        end
    end
    return rgb
end

local function name_for_rgb(table_choice, r255, g255, b255)
    local tbl = (table_choice == 2) and BASIC_COLORS or HTML_COLORS
    return nearest_name_from_table(tbl, r255, g255, b255)
end

local function process_preset(idx, table_choice)
    local h = DataPool().PresetPools[4][idx]
    if not h then
        Printf("Preset 4."..tostring(idx)..": empty.")
        return
    end
    local ok, content = pcall(function() return GetPresetData(h) end)
    if not ok or type(content) ~= "table" then
        Printf("Preset 4."..tostring(idx)..": GetPresetData failed.")
        return
    end
    local rgb = extract_rgb_table(content)
    if rgb and rgb.r and rgb.g and rgb.b then
        local r,g,b = norm255_from100(rgb.r), norm255_from100(rgb.g), norm255_from100(rgb.b)
        local name = name_for_rgb(table_choice, r,g,b)
        -- Print and LABEL
        Printf("Preset 4."..tostring(idx).." => RGB("..r..","..g..","..b..") ≈ "..name)
        Cmd('Label Preset 4.'..tostring(idx)..' "'..name..'"')
    else
        Printf("Preset 4."..tostring(idx)..": RGB not found.")
    end
end

-- -------- UI + main --------
local function main()
    local inputs = {
        {name = "First Preset", value = "1",  whiteFilter = "0123456789"},
        {name = "Last Preset",  value = "50", whiteFilter = "0123456789"}
    }
    local selectors = {
        { name="Color table", selectedValue=1, values={["HTML colors"]=1,["Basic colors"]=2}, type=1}
    }

    local resultTable = MessageBox({
        title = "Name colors",
        message = "Select first and last color preset to rename. Don´t use preset prefix (4.).",
        message_align_h = Enums.AlignmentH.Left,
        message_align_v = Enums.AlignmentV.Top,
        commands = {{value = 1, name = "Ok"}, {value = 0, name = "Cancel"}},
        inputs = inputs,
        selectors = selectors,
        backColor = "Global.Default",
        icon = "logo_small",
        messageTextColor = "Global.Text",
        autoCloseOnInput = true
    })

    if not resultTable or resultTable.result ~= 1 then
        Printf("Canceled.")
        return
    end

    local first = tonumber(resultTable.inputs["First Preset"]) or 1
    local last  = tonumber(resultTable.inputs["Last Preset"]) or first
    if last < first then
        Printf("Invalid range.")
        return
    end

    local table_choice = 1
    if resultTable.selectors and resultTable.selectors["Color table"] then
        table_choice = tonumber(resultTable.selectors["Color table"]) or 1
    end

    for i = first, last do
        process_preset(i, table_choice)
    end
end

return main
