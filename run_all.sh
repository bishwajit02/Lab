#!/bin/bash

echo "================================================"
echo "  Solar Radiation Visualization Suite"
echo "  Running all implementations..."
echo "================================================"
echo ""

echo "[1/5] Running Python (matplotlib)..."
python3 lab.py
echo ""

echo "[2/5] Running R (ggplot2)..."
Rscript solar_viz.R
echo ""

echo "[3/5] Compiling and running C++ (gnuplot)..."
g++ -std=c++17 solar_viz.cpp -o solar_viz
if [ $? -eq 0 ]; then
    ./solar_viz
else
    echo "C++ compilation failed. Make sure you have g++ installed."
fi
echo ""

echo "[4/5] Running Gnuplot script..."
gnuplot -persist solar_viz.gnu
echo ""

echo "[5/5] Opening D3.js interactive visualization..."
if command -v xdg-open > /dev/null; then
    xdg-open solar_viz.html
elif command -v open > /dev/null; then
    open solar_viz.html
else
    echo "Please open solar_viz.html manually in your browser"
fi
echo ""

echo "================================================"
echo "  All visualizations complete!"
echo "  Check the generated PNG files in this folder"
echo "================================================"

