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
// LOAD FILES                                                 //
////////////////////////////////////////////////////////////////
//
Global textGame as String[100]
Global idImgAkamilab as integer = 0
Global idImgAgk as integer = 0

Global idSprAkamilab as integer = 0
Global idSprAgk as integer = 0

Global idImgHero as integer = 0
Global idSprHero as integer =0

//
Function language_load()
	/*
		load all the in game text strings
	*/
	local count as integer	= 0
	local fileToRead as integer
	local file as String
	
	file = deviceLanguage + ".txt"
	if GetFileExists("lang/" + file) <> 1 then file = "en.txt"
	fileToRead = OpenToRead( "lang/" + file )
	while not FileEOF(fileToRead)
		textGame[count] = ReadLine(fileToRead)
		count = count + 1
	endwhile
	CloseFile(fileToRead)
endfunction
//
Function image_load()
	/*
		load all the graphics game
	*/
	// LOGOS AND SPLASH SCREEN
	idImgAkamilab = LoadImage("splash/akamilab.png")
	idImgAgk = LoadImage("splash/made-with-appgamekit-b.png")
	
	idSprAkamilab  = CreateSprite(idImgAkamilab)
	SetSpriteSize(idSprAkamilab ,60 ,45 )
	SetSpriteVisible(idSprAkamilab,0)
	//SetSpriteAngle(idSprAkamilab,45.0)
	
	idSprAgk = CreateSprite(idImgAgk)
	SetSpriteSize(idSprAgk,25,10)
	SetSpriteVisible(idSprAgk,0)
	// END LOGOS
	
	// Load HERO
	idImgHero = LoadImage("01.png")
	idSprHero = CreateSprite(idImgHero)
	SetSpriteVisible(idSprHero,0)
	//
endfunction
//
Function reset_parameters()
	Global pause as integer = 0
	Global begin as integer = 1
endfunction
//