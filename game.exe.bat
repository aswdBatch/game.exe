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

:BfThird.
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
echo BETA OPTION
echo.
echo -----------------------------------------
echo.
echo Heya!
echo.
echo You finished the currently fully done chapters.
echo.
echo Wanna do chapter 4 early? U can do dat :D
echo.
pause
goto Third.


:Third.
echo Third.>save.txt
cls
echo -----------------------------------------
echo.
echo Chapter Three: No hope, No mercy. (1/9)
echo.
echo -----------------------------------------
echo.
echo The elevator rattles and shakes...
echo.
echo It stops suddenly.
echo.
echo The doors open, revealing... a void.
echo.
pause

cls
echo -----------------------------------------
echo.
echo Chapter Three: No hope, No mercy. (2/9)
echo.
echo -----------------------------------------
echo.
echo Voices whisper all around you.
echo.
echo "You should not be here."
echo.
echo "There is no hope here."
echo.
echo "Only mercy... denied."
echo.
pause

cls
echo -----------------------------------------
echo.
echo Chapter Three: No hope, No mercy. (3/9)
echo.
echo -----------------------------------------
echo.
echo Before you is a terminal locked with 4 switches.
echo.
echo They must be flipped in the right order.
echo.
echo A strange note is in your inventory: "HOPE"
echo.
echo Maybe... that's the order?
echo.
echo.
echo Puzzle: Enter the correct order of letters (H,O,P,E)
set /p puzzle1="Order: "
if /I "%puzzle1%"=="HOPE" goto Ch3-pass1
goto Ch3-fail1

:Ch3-fail1
cls
echo The switches spark violently.
echo.
echo You take damage.
set /a playerHealth-=20
if %playerHealth% LEQ 0 goto bossdeath
pause
goto Third.

:Ch3-pass1
cls
echo The switches click.
echo.
echo A door unlocks ahead.
pause

cls
echo -----------------------------------------
echo.
echo Chapter Three: No hope, No mercy. (4/9)
echo.
echo -----------------------------------------
echo.
echo You walk into the next room.
echo.
echo A terminal screen flickers:
echo.
echo "PASSWORD REQUIRED."
echo.
echo [TIP: Look in folder MERCY on Desktop]
echo.
pause
cd /d "%userprofile%\Desktop"
md MERCY >nul 2>&1
echo Salvation>key.txt
set /p code3="Enter Password: "
if /I "%code3%"=="Salvation" goto Ch3-pass2
goto Ch3-fail2

:Ch3-fail2
cls
echo Access Denied.
echo.
echo The screen shocks you with static.
set /a playerHealth-=15
if %playerHealth% LEQ 0 goto bossdeath
pause
goto Third.

:Ch3-pass2
cls
echo Access Granted.
echo.
echo The void shifts into a staircase leading downward.
echo.
pause
cd /d "%basedir%"

cls
echo -----------------------------------------
echo.
echo Chapter Three: No hope, No mercy. (5/9)
echo.
echo -----------------------------------------
echo.
echo On a pedestal lies a weapon...
echo.
echo You pick it up. It's a REVOLVER.
echo.
echo [UNLOCKED WEAPON: Revolver]
echo.
echo Revolver Modes:
echo [1] Normal Fire (safe, 15-25 dmg)
echo [2] Piercer Fire (30-50 dmg, but 1/3 chance to shock you for 15 dmg)
echo.
pause
goto miniboss-ch3

:miniboss-ch3
setlocal enabledelayedexpansion
set "enemyName=Tormented"
set "enemyHealth=80"
set /a playerHealth=100
set "usedNormal=0"
set "usedPiercer=0"

echo.
echo A shadow emerges...
echo The Tormented stares at you.
echo.
echo [TUTORIAL] Use your revolver to survive. Both Normal and Piercer must be used!
echo.
echo [TUTORIAL] The Tormented can only, and ONLY be finished if shot with revolver. Punches put him at 10 hp if oneshot.
pause

:ch3minibossloop
cls
echo -----------------------------------------
echo.
echo Chapter Three: No hope, No mercy. (Tutorial: !enemyName!)
echo.
echo -----------------------------------------
echo Your Health: !playerHealth!
echo !enemyName! Health: !enemyHealth!
echo.
echo [1] Revolver - Normal Fire
echo [2] Revolver - Piercer Fire (risky)
set /p move="> "

if "!move!"=="1" goto rev-normal
if "!move!"=="2" goto rev-piercer
goto ch3minibossloop

:rev-normal
set /a dmg=12 + (!random! %% 9)
set "usedNormal=1"
echo You fire a normal shot for !dmg! damage!
set /a enemyHealth-=dmg
if !enemyHealth! LEQ 0 goto ch3tutorialcheck
goto ch3minibossturn

:rev-piercer
set /a dmg=25 + (!random! %% 15)
set "usedPiercer=1"
echo You fire a PIERCE shot for !dmg! damage!
set /a enemyHealth-=dmg
if !enemyHealth! LEQ 0 goto ch3tutorialcheck
set /a backlash=!random! %% 5
if !backlash!==0 (
    echo The revolver shocks you with static! You take 10 damage!
    set /a playerHealth-=10
    if !playerHealth! LEQ 0 goto bossdeath
)
goto ch3minibossturn

:ch3minibossturn
set /a enemydmg=8 + (!random! %% 12)
echo !enemyName! lashes out for !enemydmg! damage!
set /a playerHealth-=enemydmg
if !playerHealth! LEQ 0 goto bossdeath
pause
goto ch3minibossloop

:ch3tutorialcheck
if "!usedNormal!"=="1" if "!usedPiercer!"=="1" (
    echo.
    echo You defeated !enemyName!.
    echo His cloak falls into ash.
    echo.
    echo [CHECKPOINT SAVED]
    echo Third-checkpoint>save.txt
    echo The revolver is now permanently unlocked!
    pause
    endlocal
    goto boss-ch3
) else (
    echo.
    echo The Tormented refuses to die...
    echo You must use BOTH Normal and Piercer fire!
    set /a enemyHealth=10
    pause
    goto ch3minibossloop
)


cls
echo -----------------------------------------
echo.
echo Chapter Three: No hope, No mercy. (6/9)
echo.
echo -----------------------------------------
echo.
echo The voice echoes:
echo.
echo "If you killed him... you’re ready for me."
echo.
pause

cls
echo -----------------------------------------
echo.
echo Chapter Three: No hope, No mercy. (7/9)
echo.
echo -----------------------------------------
echo.
echo A massive door opens.
echo.
echo Inside waits a towering figure: "The Judge"
echo.
echo "No mercy shall be given."
echo.
pause
goto boss-ch3

:boss-ch3
setlocal enabledelayedexpansion
set "enemyName=The Judge"
set "enemyHealth=200"
set /a playerHealth=120

:ch3bossloop
cls
echo -----------------------------------------
echo.
echo Chapter Three: No hope, No mercy. (BOSS: !enemyName!)
echo.
echo -----------------------------------------
echo Your Health: !playerHealth!
echo !enemyName! Health: !enemyHealth!
echo.
echo [1] Attack
echo [2] Guard
echo [3] Desperation (risky)
echo [4] Revolver - Normal Fire
echo [5] Revolver - Piercer Fire (risky)
set /p choice="> "

if "!choice!"=="1" goto ch3bossattack
if "!choice!"=="2" goto ch3bossguard
if "!choice!"=="3" goto ch3bossdesperation
if "!choice!"=="4" goto ch3revnormal-boss
if "!choice!"=="5" goto ch3revpiercer-boss
goto ch3bossloop

:ch3bossattack
set /a dmg=12 + (!random! %% 18)
echo You deal !dmg! damage.
set /a enemyHealth-=dmg
if !enemyHealth! LEQ 0 goto ch3bosswin
goto ch3bossturn

:ch3bossguard
echo You brace yourself.
set /a dmg=5 + (!random! %% 8)
echo Reduced damage taken: !dmg!
set /a playerHealth-=dmg
if !playerHealth! LEQ 0 goto bossdeath
pause
goto ch3bossloop

:ch3bossdesperation
set /a risk=!random! %% 2
if !risk!==0 (
    echo Desperation pays off! You deal 40 damage.
    set /a enemyHealth-=40
    if !enemyHealth! LEQ 0 goto ch3bosswin
) else (
    echo Desperation backfires! You take 30 damage.
    set /a playerHealth-=30
    if !playerHealth! LEQ 0 goto bossdeath
)
pause
goto ch3bossturn

:ch3revnormal-boss
set /a dmg=15 + (!random! %% 12)
echo You fire Normal Revolver. !dmg! damage!
set /a enemyHealth-=dmg
if !enemyHealth! LEQ 0 goto ch3bosswin
goto ch3bossturn

:ch3revpiercer-boss
set /a dmg=30 + (!random! %% 20)
set /a backlash=!random! %% 5
echo You fire PIERCER! !dmg! damage!
set /a enemyHealth-=dmg
set /a guardbreak=!random! %% 4
if !guardbreak!==0 echo Piercer shot pierces the guard!
if !backlash!==0 (
    echo The revolver shocks you! -15 HP
    set /a playerHealth-=15
    if !playerHealth! LEQ 0 goto bossdeath
)
if !enemyHealth! LEQ 0 goto ch3bosswin
goto ch3bossturn

:ch3bossturn
set /a enemydmg=15 + (!random! %% 20)
echo !enemyName! smashes you for !enemydmg! damage!
set /a playerHealth-=enemydmg
if !playerHealth! LEQ 0 goto bossdeath
pause
goto ch3bossloop

:ch3bosswin
echo.
echo You defeated !enemyName! The Judge crumbles into dust.
echo.
pause


cls
echo -----------------------------------------
echo.
echo Chapter Three: No hope, No mercy. (8/9)
echo.
echo -----------------------------------------
echo.
echo Silence fills the void.
echo.
echo "Perhaps... there was hope after all."
echo.
echo A light appears, guiding you forward.
echo.
echo.
echo It leads you to another elevator... you step in it.
pause

cls
echo -----------------------------------------
echo.
echo Chapter Three: No hope, No mercy. (9/9)
echo.
echo -----------------------------------------
echo.
echo You ride the elevator, the revolver in your hands.
echo.
echo You feel a sense of power holding it.
echo.
echo ...
echo.
echo To be continued.
echo Fourth.>save.txt
pause
findstr /C:"beat chapter 3" "%basedir%Badges.txt" >nul 2>&1
if errorlevel 1 (
    (
        echo Badge: [GOLD] beat Chapter 3
        echo Complete chapter 3 "No hope, No mercy."
        echo Claimed: "No hope, No mercy."
        echo
        echo ================================
    ) >> "%basedir%Badges.txt"
)

findstr /C:"beat chapter 3 EARLY" "%basedir%Badges.txt" >nul 2>&1
if errorlevel 1 (
    (
        echo Badge: [Platinum] beat Chapter 3... EARLY
        echo Complete chapter 3 "No hope, No mercy." WHILE ITS EARLY ACCSESS!!!!
        echo Claimed: "No hope, No mercy."
        echo
        echo ================================
    ) >> "%basedir%Badges.txt"
)
goto menu
