# 🌞 Solar Radiation Visualization Suite

Multiple implementations of the same solar radiation analysis data using different programming languages and visualization tools.

## 📊 Available Visualizations

### 1. **Python (Original)** - `lab.py`

- **Tool**: Matplotlib
- **Run**: `python lab.py`
- Classic line plots with markers

### 2. **R with ggplot2** - `solar_viz.R`

- **Tool**: ggplot2, gridExtra
- **Run**: `Rscript solar_viz.R`
- **Features**:
  - Elegant faceted layouts
  - Area plots with statistical themes
  - Heatmap with normalized values
  - Professional publication-ready output
- **Output**: `radiation_components_R.png`, `input_variables_R.png`, `heatmap_R.png`

### 3. **C++ with Gnuplot** - `solar_viz.cpp`

- **Tool**: C++ + Gnuplot
- **Compile**: `g++ -std=c++17 solar_viz.cpp -o solar_viz`
- **Run**: `./solar_viz` (requires gnuplot installed)
- **Features**:
  - ASCII art bar chart in terminal
  - Formatted data table output
  - Generates gnuplot scripts dynamically
  - Produces high-quality PNG plots
- **Output**: `radiation_cpp.png`, `variables_cpp.png`

### 4. **Interactive Web (D3.js)** - `solar_viz.html`

- **Tool**: D3.js v7
- **Run**: Open `solar_viz.html` in any modern browser
- **Features**:
  - Fully interactive tooltips
  - Smooth animations and transitions
  - Beautiful gradient styling
  - Statistical summary cards
  - Correlation matrix heatmap
  - Responsive design
- No installation required!

### 5. **Pure Gnuplot** - `solar_viz.gnu`

- **Tool**: Gnuplot scripting language
- **Run**: `gnuplot -persist solar_viz.gnu`
- **Features**:
  - 4-panel multiplot layout
  - Filled area charts
  - Bar chart for averages
  - Creative polar/radar plot
- **Output**: `radiation_gnuplot.png`, `radiation_polar.png`

## 🎨 Visualization Types Included

- **Line plots** with markers (all implementations)
- **Faceted/panel plots** (R, Gnuplot)
- **Area/filled curves** (R, Gnuplot)
- **Heatmaps** (R, D3.js correlation matrix)
- **Bar charts** (Gnuplot)
- **Polar/Radar plots** (Gnuplot)
- **ASCII art** (C++)
- **Interactive tooltips** (D3.js)

## 📦 Dependencies

### Python

```bash
pip install pandas numpy matplotlib
```

### R

```R
install.packages(c("ggplot2", "gridExtra", "scales", "reshape2"))
```

### C++

```bash
# Install gnuplot first
# Ubuntu/Debian: sudo apt-get install gnuplot
# macOS: brew install gnuplot
# Windows: Download from http://www.gnuplot.info/

# Then compile
g++ -std=c++17 solar_viz.cpp -o solar_viz
```

### Gnuplot

```bash
# Ubuntu/Debian
sudo apt-get install gnuplot

# macOS
brew install gnuplot

# Windows
# Download from http://www.gnuplot.info/
```

### D3.js (HTML)

No installation needed! Just open in browser.
(Uses CDN for D3.js library)

## 🚀 Quick Start

```bash
# Run all visualizations
python lab.py                    # Python/Matplotlib
Rscript solar_viz.R             # R/ggplot2
g++ -std=c++17 solar_viz.cpp -o solar_viz && ./solar_viz  # C++
gnuplot -persist solar_viz.gnu  # Pure Gnuplot
# Open solar_viz.html in browser  # D3.js
```

## 📊 Data Description

**Variables:**

- `G0`: Extraterrestrial Solar Radiation (W/m²)
- `h`: Bright sunshine hours
- `N`: Maximum possible sunshine duration
- `W`: Absolute humidity
- `R`: Relative humidity (%)
- `G`: Total solar radiation (calculated)
- `D`: Diffuse radiation (calculated)
- `B`: Direct beam radiation (B = G - D)

**Calculations:**

```
G = G0 × (0.394 + (0.364 × (h/N²) × 0.0035 × W))
D = G0 × (0.306 - (0.165 × (h/N²)) + 0.0025 × W)
B = G - D
```

## 🎯 Highlights

- **Most Beautiful**: R with ggplot2 (publication quality)
- **Most Interactive**: D3.js HTML version
- **Most Hardcore**: C++ with gnuplot
- **Most Creative**: Gnuplot polar plot
- **Most Practical**: Original Python/Matplotlib

## 📸 Output Files

After running all scripts, you'll have:

- `Fig-1.png`, `Fig-2.png` (original Python)
- `radiation_components_R.png`, `input_variables_R.png`, `heatmap_R.png` (R)
- `radiation_cpp.png`, `variables_cpp.png` (C++)
- `radiation_gnuplot.png`, `radiation_polar.png` (Gnuplot)
- Interactive visualization in browser (D3.js)

Enjoy exploring your data in multiple dimensions! 🎉
