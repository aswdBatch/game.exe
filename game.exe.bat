:start-script-for-error
@echo off
setlocal enabledelayedexpansion
title game.exe
set "basedir=%~dp0"
cls

if exist save.txt (
    set /p chapter=<save.txt
    echo -----------------------------------------
    echo Save detected! You unlocked: !chapter!
    echo -----------------------------------------
    echo [1] Continue from !chapter!
    echo [2] New Game
    set /p choice="Choose: "
    if "!choice!"=="1" goto !chapter!
    if "!choice!"=="2" del save.txt & goto warn
    goto warn
)

:warn
cls
echo -----------------------------------------
echo.
echo Please note.
echo.
echo -----------------------------------------
echo.
echo This game will make files as part of puzzles.
echo.
echo -----------------------------------------
echo.
echo Please don't be alarmed.
echo.
echo -----------------------------------------
echo.
pause
goto menu

:menu
cls
echo -----------------------------------------
echo.
echo game.exe
echo.
echo -----------------------------------------
echo.
echo [1] Play
echo.
echo [2] Credits
echo.
echo [3] Exit
echo.
echo [4] Badges
echo.
set /p answer=
if "%answer%"=="1" goto First.
if "%answer%"=="2" goto credits
if "%answer%"=="3" exit
if "%answer%"=="4" goto Badges
echo [ERROR] Enter a valid option.
pause
goto menu

:badges
cd /d "%basedir%"
cls
echo -----------------------------------------
echo.
echo Unlocked Badges:
echo.
echo -----------------------------------------

if not exist "badges.txt" (
    echo No badges earned yet.
) else (
    type badges.txt
)

echo.
echo -----------------------------------------
pause
goto menu



:credits
cls
echo -----------------------------------------
echo.
echo Credits:
echo Made by Aswd
echo.
echo Inspired by ULTRAKILL and GRACE
echo.
echo Thank you for playing <3
echo.
echo -----------------------------------------
pause
goto menu


:First.
echo First.>save.txt
cls
echo -----------------------------------------
echo.
echo Chapter One: Nothingness. (1/6)
echo.
echo -----------------------------------------
echo.
echo "Welcome! Welcome!"
echo.
echo "You might be wondering where we are."
echo.
echo ...
echo.
echo "It's in Nothingness!"
echo.
echo "Before you freak out, no, your computer is fine...
echo.
echo ... maybe."
echo.
pause

cls
echo -----------------------------------------
echo.
echo Chapter One: Nothingness. (2/6)
echo.
echo -----------------------------------------
echo.
echo "I've got a question."
echo.
echo "How did you get here? It's not like we get"
echo "people here often."
echo.
echo "What's your name?"
set /p name=

cls
echo -----------------------------------------
echo.
echo Chapter One: Nothingness. (3/6)
echo.
echo -----------------------------------------
echo.
echo "%name%, nice name!"
echo.
echo "You should get settled here. It's always dark here."
echo.
echo "If you hate it... you're not the only one."
echo "My name is VD-8573.... If you don't understand it..."
echo.
echo "It's fine. Not many people understand it."
echo.
echo "Just call me James."
pause

cls
echo -----------------------------------------
echo.
echo Chapter One: Nothingness. (4/6)
echo.
echo -----------------------------------------
echo.
echo "Well, there is ONE more zone..."
echo. 
echo "But it is dangerous. It has light, but there's one thing that's holding it off..."
echo.
echo "We don't know exactly what, but anyone who went there never came back."
echo.
pause

cls
echo -----------------------------------------
echo.
echo Chapter One: Nothingness. (5/6)
echo.
echo -----------------------------------------
echo.
echo "Do you want to go?"
echo.
echo "We're not forcing you to, but we would appreciate it."
echo.
echo "Did I mention if you don't your computer will get killed?"
echo.
echo ...
echo.
echo "Yeah you have to go."
set /p answer=(y/n): 
if /I "%answer%"=="n" shutdown.exe /s /t 10
pause

cls
echo -----------------------------------------
echo.
echo Chapter One: Nothingness. (6/6)
echo.
echo -----------------------------------------
echo.
echo "Fair enough!"
echo.
echo "Good luck-"
echo.
echo ...
echo.
echo darkness...
echo.
echo Suddenly-
echo.
pause
echo Second.>save.txt
findstr /C:"Chapter 1 Complete" "%basedir%Badges.txt" >nul 2>&1
if errorlevel 1 (
    (
        echo Badge: [BRONZE] Chapter 1 complete
        echo Complete the first chapter "Nothingness."
        echo Claimed: "Nothingness."
        echo.
        echo ================================
    ) >> "%basedir%Badges.txt"
cls
goto Second.

:Second.
cls
echo -----------------------------------------
echo.
echo Chapter Two: ...Then The Ashes Fell... (1/10)
echo.
echo -----------------------------------------
echo.
echo You see light... Its grey.
echo.
echo The trees are dead. The air feels poluted.
echo.
echo Nothing feels alive.
echo.
echo There's a keypad on the door...
echo.
echo Find the code.
echo [TIP: C-CDOE]
cd..
cd..
cd..
cd..
cd..
cd..
cd..
cd C:\
md CDOE
cd CDOE
echo 9656>CODE.txt
set /p answer%="Enter Code?>"
if not %answer%== 9656 goto Second.
cls
echo -----------------------------------------
echo.
echo Chapter Two: ...Then The Ashes Fell... (2/10)
echo.
echo -----------------------------------------
echo.
echo The door opens.
echo.
echo The hallway is long, its almost too long-
echo.
pause
cd..
cd..
cd..
cd..
cd..
cd..
cd %basedir%
findstr /C:"Enemy Name: Filth" "%basedir%Enemy data.txt" >nul 2>&1
if errorlevel 1 (
    (
        echo Enemy Name: Filth
        echo Health: 100
        echo First encounter: "...Then The Ashes Fell..."
        echo Encountered By: User
        echo ================================
    ) >> "%basedir%Enemy data.txt"
	cls
    echo [Enemy saved]
) else (
	cls
    echo [Enemy already registered]
)
cls
echo [Enemy saved]
echo -----------------------------------------
echo.
echo Chapter Two: ...Then The Ashes Fell... (3/10)
echo.
echo -----------------------------------------
echo.
echo AN ENEMY APPEARS.
echo.
echo Filth.
echo.
pause
goto Fight1
goto Error2

:Error2
cls

echo -----------------------------------------
echo.
echo FATAL ERROR!!!
echo.
echo -----------------------------------------
echo.
echo ERROR 2
echo.
echo [FAILED TO LOAD FIGHT]
echo.
echo You can restart from the save.
echo.
pause
goto start-script-for-error

:Fight1
cls
echo -----------------------------------------
echo.
echo Chapter Two: ...Then The Ashes Fell... (FIGHT 1 VS FILTH)
echo.
echo -----------------------------------------
echo.
echo [1] Regular punch
echo.
echo [2] Attempt parry
echo.
set /p fightchoice="Choose your move: "

if "%fightchoice%"=="1" goto punch1
if "%fightchoice%"=="2" goto parry1
echo Invalid choice.
pause
goto Fight1

:parry1
cls
echo You attempt to parry...
echo.
timeout /t 2 >nul

set /a chance=%RANDOM% %% 5

if "%chance%"=="0" (
    echo You mistimed the parry!
    echo The enemy strikes you fatally.
    echo.
    echo YOU DIED.
    echo.
    echo.
    del save.txt >nul 2>&1
    del "Enemy data.txt" >nul 2>&1
    echo Your save has been deleted.
    pause
    goto Permadeath-guide
) else (
    echo Perfect parry!
    echo The enemy is stunned.
    echo You strike back successfully.
    pause
    goto fight1won
)

:punch1
cls
echo You swing a regular punch...
echo.
timeout /t 1 >nul
echo Enemy hit.
echo The enemy stumbles.
pause
goto fight1won

:fight1won
findstr /C:"First Win" "%basedir%Badges.txt" >nul 2>&1
if errorlevel 1 (
    (
        echo Badge: [BRONZE] First Win
        echo Win your first fight
        echo Claimed: "...Then The Ashes Fell..."
        echo.
        echo ================================
    ) >> "%basedir%Badges.txt"
cls
echo -----------------------------------------
echo.
echo Chapter Two: ...Then The Ashes Fell... (5/10)
echo.
echo -----------------------------------------
echo.
echo The enemy fades into ash...
echo.
echo You move forward cautiously, there could be more.
echo.
echo You are now Scared.
echo.
pause
cls
echo.
echo -----------------------------------------
echo.
echo Chapter Two: ...Then The Ashes Fell... (6/10)
echo.
echo -----------------------------------------
echo.
echo You continue forward, knowing now that anything can jump out and possibly kill you.
echo.
echo The air is still. Its still grey.
echo.
echo Its getting colder and colder.
echo.
pause
cls
echo -----------------------------------------
echo.
echo Chapter Two: ...Then The Ashes Fell... (7/10)
echo.
echo -----------------------------------------
echo.
echo ...
echo.
echo "Hello."
echo.
echo Who was that? From where it came from?
echo.
echo "I know you're here."
echo.
echo "COME TO ME."
echo.
echo He doesnt even answer your questions, and just... doesnt speak again.
echo.
echo ...
echo.
echo strange.
echo.
pause
cls
:checkpoint-Secondb.
cls
echo checkpoint-Second>save.txt
echo -----------------------------------------
echo.
echo Chapter Two: ...Then The Ashes Fell... (8/10)
echo.
echo -----------------------------------------
echo.
echo You continue forward, and see an elevator... It's also locked.
echo.
echo [TIP: CODE]
set /p answer%=">"
if %answer% == Code goto checkpoint-Second
goto checkpoint-Secondb
cls
:checkpoint-Second
echo -----------------------------------------
echo.
echo Chapter Two: ...Then The Ashes Fell... (9/10)
echo.
echo -----------------------------------------
echo.
echo Strange... the door doesnt open. The keypad says its correct-
echo.
echo A BOSS APPEARS
echo.
pause
goto fight2-boss

:fight2-boss
cd..
cd..
cd..
cd..
cd..
cd..
cd %basedir%
findstr /C:"Enemy Name: Filth" "%basedir%Enemy data.txt" >nul 2>&1
if errorlevel 1 (
    (
        echo Enemy Name: Maurice
        echo Health: 200
        echo First encounter: "...Then The Ashes Fell..."
        echo Encountered By: User
        echo ================================
    ) >> "%basedir%Enemy data.txt"
	cls
    echo [Enemy saved]
) else (
	cls
    echo [Enemy already registered]
)
cls
setlocal enabledelayedexpansion
set "playerHealth=100"
set "enemyHealth=125"
set "enemyName=Maurice"

:bossloop
cls
echo -----------------------------------------
echo.
echo Chapter Two: ...Then The Ashes Fell... (FIGHT 2 VS !enemyName!)
echo.
echo -----------------------------------------
echo Your Health: !playerHealth!
echo !enemyName!'s Health: !enemyHealth!
echo.
echo [1] Attack
echo [2] Defend
echo [3] Attempt Dodge
set /p fightchoice="Choose your move: "

if "!fightchoice!"=="1" goto bossattack
if "!fightchoice!"=="2" goto bossdefend
if "!fightchoice!"=="3" goto bossdodge

echo Invalid input.
pause
goto bossloop

:bossattack
set /a damage=10 + (!random! %% 20)
echo You attack and deal !damage! damage!
set /a enemyHealth-=damage
if !enemyHealth! LEQ 0 goto bosswin
goto bossenemyturn

:bossdefend
set /a blockchance=!random! %% 3
if !blockchance!==0 (
    echo You block the attack entirely!
    goto bossloop
) else (
    echo You tried to block, but some damage still got through...
)
goto bossenemyturn

:bossdodge
set /a dodgechance=!random! %% 4
if !dodgechance!==0 (
    echo You dodged successfully!
    goto bossloop
) else (
    echo You failed to dodge!
)
goto bossenemyturn

:bossenemyturn
set /a enemydamage=10 + (!random! %% 15)
echo !enemyName! attacks and deals !enemydamage! damage!
set /a playerHealth-=enemydamage
if !playerHealth! LEQ 0 goto bossdeath
pause
goto bossloop

:bosswin
:fight1won
findstr /C:"First Boss." "%basedir%Badges.txt" >nul 2>&1
if errorlevel 1 (
    (
        echo Badge: [SILVER] First boss.
        echo Win your first Bossfight
        echo Claimed: "...Then The Ashes Fell..."
        echo.
        echo ================================
    ) >> "%basedir%Badges.txt"
echo.
echo You defeated !enemyName!.
echo The area grows still again.
echo.
echo -----------------------------------------
pause
endlocal
goto BfThird.

:bossdeath
echo.
echo You were defeated by !enemyName!...
echo.
echo YOU DIED.
echo.
del save.txt >nul 2>&1
del "Enemy data.txt" >nul 2>&1
echo Your save has been deleted.
pause
endlocal
goto Permadeath-guide

:BfThird
echo Third.>save.txt
cls
echo -----------------------------------------
echo.
echo Chapter Two: ...Then The Ashes Fell... (10/10)
echo.
echo -----------------------------------------
echo.
echo You reach the elevator.
echo.
echo It's working now...
echo.
echo You descend into silence.
echo.
pause
findstr /C:"beat chapter 2" "%basedir%Badges.txt" >nul 2>&1
if errorlevel 1 (
    (
        echo Badge: [SILVER] beat Chapter 2
        echo Complete chapter 2 "Then The Ashes Fell..."
        echo Claimed: "...Then The Ashes Fell..."
        echo 
        echo ================================
    ) >> "%basedir%Badges.txt"
goto Beta-Win

:Permadeath-guide
echo.
echo Oh.
pause
echo.
echo Hello.
echo.
echo You died.
echo.
echo Shame.
echo.
echo Welp, your file's been wiped.
echo.
pause
cls
echo.
echo Dont die, and your file wont get wiped. That easy.
echo.
echo Im sending you to the start,gimme a sec...
timeout 7 >nul
goto First.


:Beta-Win
findstr /C:"Beta Tester" "%basedir%Badges.txt" >nul 2>&1
if errorlevel 1 (
    (
        echo Badge: [PLATINUM!] Beta tester
        echo Thank you for Beta testing the game! <3
        echo Claimed: "Beta version"
        echo.
        echo ================================
    ) >> "%basedir%Badges.txt"
cls
echo -----------------------------------------
echo.
echo BETA FINISHED
echo.
echo -----------------------------------------
echo.
echo Heya!
echo.
echo You finished the beta.
echo.
echo Chapter 3 soon?!?!
echo.
pause
goto menu
