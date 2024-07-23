
local oklab = {}


local function cubeRoot(x)
    return x ^ (1/3)
end


function oklab.rgbToOklab(r,g,b) 
    local l = 0.4122214708 * r + 0.5363325363 * g + 0.0514459929 * b;
	local m = 0.2119034982 * r + 0.6806995451 * g + 0.1073969566 * b;
	local s = 0.0883024619 * r + 0.2817188376 * g + 0.6299787005 * b;

    local l_ = cubeRoot(l);
    local m_ = cubeRoot(m);
    local s_ = cubeRoot(s);

    return
        0.2104542553*l_ + 0.7936177850*m_ - 0.0040720468*s_,
        1.9779984951*l_ - 2.4285922050*m_ + 0.4505937099*s_,
        0.0259040371*l_ + 0.7827717662*m_ - 0.8086757660*s_
end


function oklab.oklabToRGB(L,a,b) 
    local l_ = L + 0.3963377774 * a + 0.2158037573 * b;
    local m_ = L - 0.1055613458 * a - 0.0638541728 * b;
    local s_ = L - 0.0894841775 * a - 1.2914855480 * b;

    local l = l_*l_*l_;
    local m = m_*m_*m_;
    local s = s_*s_*s_;

    return
		 4.0767416621 * l - 3.3077115913 * m + 0.2309699292 * s,
		-1.2684380046 * l + 2.6097574011 * m - 0.3413193965 * s,
		-0.0041960863 * l - 0.7034186147 * m + 1.7076147010 * s
end


return oklab

