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
// GIOCO                                                      //
////////////////////////////////////////////////////////////////
//
Function gioco()
	// Inizio il gioco vero e prorpio
	// torna tutto nero
	if pause = 0
		// NON SONO IN PASUSA
		if begin = 1
			// SONO ALL'INIZIO DEL GIOCO
			SetClearColor(0,0,0)
			ClearScreen()
			// Sprite eroe visibile e al centro
			SetSpriteOffset(idSprHero,8.0,8.0)
			SetSpriteSize(idSprHero,8.0,8.0)
			
			SetSpritePositionByOffset(idSprHero,50.0,50.0)
			SetSpriteVisible(idSprHero,1)
			
			
			begin = 0
		else
			// HO GIA' INIZIATO DA UN PO'
		
		endif
	else
		// SONO IN PAUSA
	endif
endfunction
//
Function splash_screen()
	local tempoBegin as float
	local tempoProgress as float
	SetClearColor(255,163,0)
	ClearScreen()
	SetSpriteVisible(idSprAkamilab,1)
	ResetTimer()
	tempoBegin = Timer()
	
	repeat
		tempoProgress = Timer()
		SetSpritePosition(idSprAkamilab ,((100 - GetSpriteWidth(idSprAkamilab)) / 2),((100 - GetSpriteHeight(idSprAkamilab)) / 2))
		if (GetPointerState() = 1)
   			DeleteSprite(idSprAkamilab)
			DeleteSprite(idSprAgk)
   			statusGame = 2	// Vado al titolo
   		endif
   		if ((tempoProgress - tempoBegin) > 5.0)
			DeleteSprite(idSprAkamilab)
			DeleteSprite(idSprAgk)
			statusGame = 2	// Vado al titolo
		endif
		
   		Sync()
	until statusGame <> 1
endFunction
//