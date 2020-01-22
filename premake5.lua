workspace "temp"
	architecture "x64"
	startproject "ReactPhysics3d"

	configurations
	{
		"Debug",
		"Release"
	}
	outputdir = "%{cfg.buildcfg}-%{cfg.system}"
project "ReactPhysics3d"
    kind "StaticLib"
    language "C++"
    staticruntime "off"
	systemversion "latest"
    
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("build/" .. outputdir .. "/%{prj.name}")

	files
	{
        "src/**.h",
		"src/**.cpp"
    }
	
	includedirs
	{
		"src",
		"src/body",
		"src/collision",
		"src/constraint",
		"src/containers",
		"src/engine",
		"src./mathematics",
		"src/memory",
		"src/utils"
	} 
    
	filter "system:windows"
		defines 
		{ 
			"WIN32",
			"_WINDOWS"
		}
		
	 filter { "system:windows", "configurations:Debug" }
		
		defines 
		{
			"DEBUG"
		}
		
    filter { "system:windows", "configurations:Release" }
      
		
		defines 
		{
			"NDEBUG"
		}
