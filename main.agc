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
// MAIN                                                       //
////////////////////////////////////////////////////////////////
//
#include "framework.agc"
#include "load.agc"
#include "gioco.agc"
#renderer "Basic"

global_definition()
device_info()
language_load()
screen_definition()
estrai_pacchetti()
image_load()

repeat
	// ***** DEBUG INFO
	if GetRawKeyPressed(27)		
		statusGame = 9
	endif
	if GetRawKeyPressed(73) and displayInfo = 1		
		displayInfo = 0
	elseif GetRawKeyPressed(73) and displayInfo = 0
		displayInfo = 1
	endif
	
	if displayInfo = 1
		Print("TITLE: " + textGame[00] + " " + textGame[01])
		Print("DEVICE: " + deviceType + " - " + deviceSystem)
		print("MaxW: " + str(deviceMaxWidth,0) + " - MaxH: " + str(deviceMaxHeight,0) + " - R: " + str(deviceAspectRatio,2))
		Print("W: " + str(deviceWidth) + " H: " + str(deviceHeight))
		Print("X: " + str(GetPointerX(),0) +"%" + " Y: " + str(GetPointerY(),0) + "%")
		Print("LANG: " + deviceLanguage)
		Print("FPS: " + str(ScreenFPS(),0))
    endif
    // ***** END DEBUG
    
    // ***** STATUS
    select statusGame
    	case 1 // SplashScreen
    		splash_screen()	
    	endcase
    	case 2 // TitleScreen
    		statusGame = 9 // Jump to the exit	
    	endcase
    	case 3 // Game
    		// gioco()
    	endcase
    	case 5 // Options
    		
    	endcase
    	case 8 // Pause
    		
    	endcase
    	case 9 // Exit
    		exitGame = 0
    	endcase
    endselect
    // ***** END STATUS
    
    Sync()
until exitGame = 0
end
//