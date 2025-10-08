@echo off
echo ================================================
echo   Solar Radiation Visualization Suite
echo   Running all implementations...
echo ================================================
echo.

echo [1/5] Running Python (matplotlib)...
python lab.py
echo.

echo [2/5] Running R (ggplot2)...
Rscript solar_viz.R
echo.

echo [3/5] Compiling and running C++ (gnuplot)...
g++ -std=c++17 solar_viz.cpp -o solar_viz.exe
if %errorlevel% equ 0 (
    solar_viz.exe
) else (
    echo C++ compilation failed. Make sure you have g++ installed.
)
echo.

echo [4/5] Running Gnuplot script...
gnuplot -persist solar_viz.gnu
echo.

echo [5/5] Opening D3.js interactive visualization...
start solar_viz.html
echo.

echo ================================================
echo   All visualizations complete!
echo   Check the generated PNG files in this folder
echo ================================================
pause

