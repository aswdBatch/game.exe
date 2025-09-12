@echo off
cls
title game.exe
cls
:warn
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
echo Please dont be alarmed.
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
echo [2] credits
echo.
echo [3] Exit
echo.
echo.
set /p answer=
if %answer% == 1 goto first.
if %answer% == 2 goto credits
if %answer% == 3 exit
echo [ERROR 1] Enter legitemate answer.
pause
goto menu

:first.
cls
echo -----------------------------------------
echo.
echo Chapter one: Nothingness. (1/10)
echo.
echo -----------------------------------------
echo.
echo "Welcome! Welcome!"
echo.
echo "You might be wondering where we are. "
echo.
echo ...
echo.
echo "Its in Nothingness!"
echo.
echo "Before you freak out, No, your computer is fine...
echo.
echo ... maybe."
echo.
pause
cls
cls
echo -----------------------------------------
echo.
echo Chapter one: Nothingness. (2/10)
echo.
echo -----------------------------------------
echo.
echo "I've got a question."
echo.
echo "How did you get here? Its not like we get
echo people here often."
echo.
echo "What's your name?"
echo.
set /p name=
cls
echo -----------------------------------------
echo.
echo Chapter one: Nothingness. (3/10)
echo.
echo -----------------------------------------
echo.
echo "%name%, nice name!"
echo.
echo "You should get settled here. It's always dark here."
echo.
echo "If you hate it... you're not the only one.
echo My name is ģ'ēģūķļī. If you dont understand it..."
echo.
echo "Its fine. Not many people understnad it."
pause
cls
cls
echo -----------------------------------------
echo.
echo Chapter one: Nothingness. (4/10)
echo.
echo -----------------------------------------
echo.
echo "Well, there is ONE more zone..."
echo. 
echo "But it is dangerous. It has light, but there's one thing thats holding it off..."
echo.
echo "We dont know exactly what, but anyone who went there never came back."
echo.
pause
cls 
cls
echo -----------------------------------------
echo.
echo Chapter one: Nothingness. (5/10)
echo.
echo -----------------------------------------
echo.
echo "Do you want to go?"
echo.
echo "We're not forcing you to, but we would appreciate it."
echo.
echo "did i mention if you dont your computer will get killed?"
echo.
echo ...
echo.
echo "yea you have to go."
set /p answer=(y/n)
if %answer% == 1
if %answer% == n shutdown.exe /s /t 10 
if %answer% == no shutdown.exe /s /t 10 
pause
cls 
cls
echo -----------------------------------------
echo.
echo Chapter one: Nothingness. (6/10)
echo.
echo -----------------------------------------
echo.
echo 
