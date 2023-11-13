////////////////////////////////////////////////////////////////
// Program..:            Land of Warriors (LOW)               //
// Author...:            Luigi Caprio (Phobos70)              //
// Mail.....:            akamilab@proton.me                   //
// SH.......:            Akamilab                             //
// Date.....:            13/11/2023                           //
//                                                            //
// Nota(1)..:                                                 //
// Nota(2)..:                                                 //
//                                                            //
// FRAMEWORK                                                  //
////////////////////////////////////////////////////////////////
//
Function global_definition()
	/*
		Set all the global variables
		for the framework
	*/
	Global deviceWidth as integer				= 600
	Global deviceHeight as integer					= 800
	Global deviceSyncRate as integer			= 60
	Global deviceFullScreen as integer		= 0
	Global deviceSystem as string				= "" 
	Global deviceType as string				= ""
	Global deviceLanguage as string			= ""
	Global deviceKeyboard as integer			= 0	
	Global deviceMaxWidth as float			= 0.0
	Global deviceMaxHeight as float			= 0.0
	Global deviceAspectRatio as float			= 0.0
	
	Global statusGame as integer				= 1 // 1 = SpalshScreen - 2 = TitleScreen - 3 = Game - 5 = Options - 8 = Pause - 9 = Exit
	Global exitGame as integer				= 1
	Global displayInfo as integer				= 0
endfunction
//
Function device_info()
	/*
		get all the device info
		for the framework
	*/
	deviceSystem = GetDeviceBaseName()
	
	if deviceSystem = "windows" or deviceSystem = "linux" or deviceSystem = "mac"
		deviceType	= "pc"
		deviceSyncRate = 60
		deviceLanguage = left(GetDeviceLanguage(),2)
		deviceKeyboard = GetKeyboardExists()
	elseif deviceSystem = "html5"
		deviceType = "html"
		deviceSyncRate = 30
		deviceLanguage = "en"
		deviceKeyboard = GetKeyboardExists()
	elseif deviceSystem = "ios" or deviceSystem = "android"
		deviceType = "mobile"	
		deviceSyncRate = 30
		deviceLanguage = left(GetDeviceLanguage(),2)
		deviceKeyboard = GetKeyboardExists()
	endif
	
	if deviceLanguage = "" then deviceLanguage = "en"
	
	deviceMaxWidth = GetMaxDeviceWidth()
	deviceMaxHeight = GetMaxDeviceHeight()
	deviceAspectRatio = (deviceMaxWidth / deviceMaxHeight)
endfunction
//
Function screen_definition()
	/*
		Set the screen resolution and basic definitions
	*/
	SetDisplayAspect(-1)
	SetWindowSize( deviceWidth, deviceHeight, deviceFullScreen )
	SetScissor( 0,0,0,0 ) 					// use the maximum available screen space, no black borders
	SetWindowAllowResize( 0 ) 				// NOT allow the user to resize the window

	SetOrientationAllowed( 1, 1, 1, 1 ) 	// allow both portrait and landscape on mobile devices
	SetSyncRate( deviceSyncRate, 0 )
	
	UseNewDefaultFonts( 1 )
	
	if deviceType = "pc"
		SetWindowTitle(textGame[0])
	endif
endfunction
//
Function estrai_pacchetti()
	ExtractZip("01.akamilab","","AkamiNeko2023")	// Splash
	
	// ....
	
endfunction
