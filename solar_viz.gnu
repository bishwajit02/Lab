# Pure Gnuplot Script for Solar Radiation Visualization
# Run with: gnuplot -persist solar_viz.gnu

# Set up data inline
$DATA_RADIATION << EOD
# Month G D B
Jan 244.73 185.31 59.42
Feb 291.24 221.10 70.14
Mar 341.86 262.07 79.79
Apr 388.31 301.49 86.82
May 413.07 323.80 89.27
Jun 418.99 333.28 85.71
Jul 412.63 328.86 83.77
Aug 391.79 309.52 82.27
Sep 355.11 274.67 80.44
Oct 300.47 229.61 70.86
Nov 253.97 191.56 62.41
Dec 231.32 174.16 57.16
EOD

$DATA_VARIABLES << EOD
# Month R h N W
Jan 70.67 8.29 9.82 10.96
Feb 69.10 8.47 10.43 11.30
Mar 66.10 8.11 11.13 14.20
Apr 75.11 6.95 11.88 17.33
May 81.70 6.44 12.46 19.47
Jun 86.70 4.23 12.73 22.08
Jul 87.50 3.94 12.58 22.48
Aug 85.50 5.13 12.07 22.70
Sep 86.22 5.28 11.35 22.10
Oct 82.30 7.80 10.60 19.95
Nov 75.30 8.73 9.93 15.60
Dec 73.90 8.36 9.62 12.39
EOD

# ==============================================================================
# PLOT 1: Radiation Components
# ==============================================================================
set terminal pngcairo size 1400,900 enhanced font 'Consolas,14'
set output 'radiation_gnuplot.png'

set multiplot layout 2,2 title "Solar Radiation Analysis Suite (Gnuplot)" font 'Consolas,20'

# --- Subplot 1: Main radiation plot ---
set title "Monthly Variation of Solar Radiation Components" font 'Consolas,16'
set xlabel "Month" font 'Consolas,12'
set ylabel "Radiation (W/m²)" font 'Consolas,12'
set grid linestyle 1 linewidth 1 linecolor rgb '#E0E0E0'
set key outside right top box
set style line 1 lc rgb '#E74C3C' lt 1 lw 3 pt 7 ps 1.5
set style line 2 lc rgb '#27AE60' lt 1 lw 3 pt 5 ps 1.5
set style line 3 lc rgb '#3498DB' lt 2 lw 3 pt 9 ps 1.5
set xtics rotate by -45 font 'Consolas,10'
set style fill solid 0.2

plot $DATA_RADIATION using 0:2:xtic(1) with linespoints ls 1 title 'G: Total Solar Radiation', \
     $DATA_RADIATION using 0:3 with linespoints ls 2 title 'D: Diffuse Radiation', \
     $DATA_RADIATION using 0:4 with linespoints ls 3 title 'B: Direct Beam (G-D)'

# --- Subplot 2: Filled area chart ---
set title "G and D Components (Stacked)" font 'Consolas,16'
set ylabel "Radiation (W/m²)" font 'Consolas,12'
set style fill solid 0.5 border -1

plot $DATA_RADIATION using 0:2:xtic(1) with filledcurves y1=0 lc rgb '#E74C3C' title 'Total (G)', \
     $DATA_RADIATION using 0:3 with filledcurves y1=0 lc rgb '#27AE60' title 'Diffuse (D)'

# --- Subplot 3: Input variables ---
set title "Monthly Variation of Input Variables" font 'Consolas,16'
set ylabel "Value" font 'Consolas,12'
set style line 11 lc rgb '#E74C3C' lt 1 lw 2 pt 7 ps 1.2
set style line 12 lc rgb '#3498DB' lt 1 lw 2 pt 5 ps 1.2
set style line 13 lc rgb '#F39C12' lt 1 lw 2 pt 9 ps 1.2
set style line 14 lc rgb '#9B59B6' lt 1 lw 2 pt 11 ps 1.2
set autoscale y

plot $DATA_VARIABLES using 0:2:xtic(1) with linespoints ls 11 title 'R: Relative Humidity (%)', \
     $DATA_VARIABLES using 0:3 with linespoints ls 12 title 'h: Bright Sunshine Hours', \
     $DATA_VARIABLES using 0:4 with linespoints ls 13 title 'N: Max Sunshine Duration', \
     $DATA_VARIABLES using 0:5 with linespoints ls 14 title 'W: Absolute Humidity'

# --- Subplot 4: Bar chart of average radiation ---
set title "Average Radiation by Type" font 'Consolas,16'
set ylabel "Average Radiation (W/m²)" font 'Consolas,12'
set xlabel "" 
set style data histograms
set style histogram cluster gap 1
set style fill solid 0.7 border -1
set boxwidth 0.9
set xtics ("Total (G)" 0, "Diffuse (D)" 1, "Direct (B)" 2) rotate by 0

$AVERAGES << EOD
344.71 272.95 72.34
EOD

plot $AVERAGES using 1:xtic(1) with boxes lc rgb '#E74C3C' title 'G', \
     $AVERAGES using 2 with boxes lc rgb '#27AE60' title 'D', \
     $AVERAGES using 3 with boxes lc rgb '#3498DB' title 'B'

unset multiplot

# ==============================================================================
# PLOT 2: Polar Plot (Bonus - Creative visualization)
# ==============================================================================
set terminal pngcairo size 800,800 enhanced font 'Consolas,12'
set output 'radiation_polar.png'

set title "Polar View: Total Solar Radiation by Month" font 'Consolas,18'
set polar
set grid polar
set angles degrees
set size square
set xrange [-450:450]
set yrange [-450:450]
set style line 1 lc rgb '#E74C3C' lt 1 lw 2

# Create polar data (angle = month*30, radius = G value)
$POLAR << EOD
0 244.73
30 291.24
60 341.86
90 388.31
120 413.07
150 418.99
180 412.63
210 391.79
240 355.11
270 300.47
300 253.97
330 231.32
360 244.73
EOD

set label "Jan" at first 0, 480 center
set label "Feb" at first 420, 240 center
set label "Mar" at first 370, -240 center
set label "Apr" at first 0, -480 center
set label "May" at first -370, -240 center
set label "Jun" at first -420, 240 center

plot $POLAR using 1:2 with filledcurves lc rgb '#E74C3C' fillstyle solid 0.3 title 'G', \
     $POLAR using 1:2 with linespoints ls 1 pt 7 ps 1.5 notitle

print "✓ Plots generated:"
print "  - radiation_gnuplot.png (4-panel layout)"
print "  - radiation_polar.png (polar plot)"

