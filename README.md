# ☀️ Solar Radiation Analysis & Visualization Suite

<div align="center">

**A multi-language, multi-tool approach to visualizing solar radiation data**

[![Python](https://img.shields.io/badge/Python-3.7+-blue.svg)](https://www.python.org/)
[![R](https://img.shields.io/badge/R-4.0+-276DC3.svg)](https://www.r-project.org/)
[![C++](https://img.shields.io/badge/C++-17-00599C.svg)](https://isocpp.org/)
[![JavaScript](https://img.shields.io/badge/JavaScript-ES6+-F7DF1E.svg)](https://developer.mozilla.org/en-US/docs/Web/JavaScript)
[![Processing](https://img.shields.io/badge/Processing-3.0+-006699.svg)](https://processing.org/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

_One dataset. Six implementations. Infinite possibilities._

[Features](#-features) • [Quick Start](#-quick-start) • [Gallery](#-visualization-gallery) • [Documentation](#-documentation) • [Installation](#-installation)

</div>

---

## 📖 Overview

This project demonstrates the power of different visualization tools and programming languages by implementing the **same solar radiation analysis** in six distinct ways. From classic Python to modern D3.js, from hardcore C++ to artistic Processing sketches - explore how different tools bring unique perspectives to data visualization.

### 🎯 Project Goals

- 📊 **Educational**: Compare visualization approaches across languages
- 🎨 **Creative**: Showcase artistic and technical data representation
- 🔬 **Scientific**: Analyze extraterrestrial and terrestrial solar radiation
- 💻 **Practical**: Provide ready-to-use code for various platforms

---

## ✨ Features

<table>
<tr>
<td width="33%" align="center">
<h3>🐍 Python + Matplotlib</h3>
Simple, reliable, scientific
<br><br>
<code>lab.py</code>
</td>
<td width="33%" align="center">
<h3>📊 R + ggplot2</h3>
Publication-quality graphics
<br><br>
<code>solar_viz.R</code>
</td>
<td width="33%" align="center">
<h3>🔧 C++ + Gnuplot</h3>
High-performance computing
<br><br>
<code>solar_viz.cpp</code>
</td>
</tr>
<tr>
<td width="33%" align="center">
<h3>🌐 D3.js Interactive</h3>
Web-based, interactive
<br><br>
<code>solar_viz.html</code>
</td>
<td width="33%" align="center">
<h3>📈 Pure Gnuplot</h3>
Classic plotting language
<br><br>
<code>solar_viz.gnu</code>
</td>
<td width="33%" align="center">
<h3>🎨 Processing</h3>
Animated art visualization
<br><br>
<code>solar_viz.pde</code>
</td>
</tr>
</table>

### 🎁 What You Get

- ✅ **6 complete implementations** in different languages
- ✅ **Interactive web dashboard** (no server required!)
- ✅ **Animated visualizations** with Processing
- ✅ **Statistical analysis** with correlation matrices
- ✅ **Publication-ready plots** from R
- ✅ **ASCII art charts** from C++
- ✅ **Batch processing scripts** for automation

---

## 🚀 Quick Start

### Fastest Way (No Installation)

**Open the interactive visualization** - just double-click:

```bash
solar_viz.html
```

Works in any modern browser! No dependencies, no setup. 🎉

### Run Your Favorite Tool

```bash
# Python (most common)
python lab.py

# D3.js Interactive
start solar_viz.html          # Windows
open solar_viz.html           # macOS/Linux

# R (publication quality)
Rscript solar_viz.R

# Gnuplot (classic)
gnuplot -persist solar_viz.gnu

# C++ (compile first)
g++ -std=c++17 solar_viz.cpp -o solar_viz
./solar_viz

# Processing (open in IDE)
# 1. Download Processing from processing.org
# 2. Open solar_viz.pde
# 3. Press Run ▶️
```

### Run Everything at Once

**Windows:**

```batch
run_all.bat
```

**macOS/Linux:**

```bash
chmod +x run_all.sh
./run_all.sh
```

---

## 📊 Visualization Gallery

### 🐍 Python + Matplotlib

Classic line plots with markers - perfect for scientific papers.

**Features:**

- Traditional matplotlib styling
- Multi-line plots with legends
- Grid overlay for easy reading

### 📊 R + ggplot2

Elegant, publication-ready visualizations with the grammar of graphics.

**Features:**

- ✨ Faceted multi-panel layouts
- 🎨 Professional color schemes
- 📈 Normalized correlation heatmap
- 🌊 Area plots with transparency

### 🔧 C++ + Gnuplot

Maximum geek cred with terminal ASCII art and dynamic plot generation.

**Features:**

- 🖥️ ASCII art bar charts in terminal
- 📊 Auto-generated gnuplot scripts
- 🔢 Formatted data tables
- ⚡ Ultra-fast computation

### 🌐 D3.js Interactive Web

Modern, interactive dashboard with smooth animations.

**Features:**

- 🖱️ **Hover tooltips** on every data point
- 📊 **Statistical summary cards** with key metrics
- 🔥 **Correlation matrix heatmap**
- 📱 **Responsive design** - works on mobile
- ✨ **Smooth animations** and transitions
- 🎨 **Beautiful gradients** and modern UI

### 📈 Pure Gnuplot

Classic plotting with multiplot layouts and polar coordinates.

**Features:**

- 🎯 4-panel multiplot layout
- 🎪 Polar/radar plot visualization
- 📊 Filled area charts
- 📈 Statistical aggregations

### 🎨 Processing Art

Four different animated view modes - perfect for presentations!

**Features:**

- 🎡 **Circular View**: Radial layout with month labels
- 🌊 **Wave View**: Flowing curves across time
- ✨ **Particle System**: Dynamic particle visualization
- 🌀 **Spiral View**: Data spiraling through time
- 🎮 **Interactive**: Press SPACE to switch, click to reset

---

## 📚 Documentation

### Data Description

This project analyzes monthly solar radiation data with the following variables:

| Variable | Description                            | Unit  |
| -------- | -------------------------------------- | ----- |
| `G0`     | Extraterrestrial Solar Radiation       | W/m²  |
| `h`      | Bright sunshine hours                  | hours |
| `N`      | Maximum possible sunshine duration     | hours |
| `W`      | Absolute humidity                      | g/m³  |
| `R`      | Relative humidity                      | %     |
| **`G`**  | **Total solar radiation** (calculated) | W/m²  |
| **`D`**  | **Diffuse radiation** (calculated)     | W/m²  |
| **`B`**  | **Direct beam radiation** (G - D)      | W/m²  |

### Calculation Formulas

```python
G = G0 × (0.394 + (0.364 × (h/N²) × 0.0035 × W))
D = G0 × (0.306 - (0.165 × (h/N²)) + 0.0025 × W)
B = G - D
```

### File Structure

```
.
├── lab.py                      # Original Python implementation
├── solar_viz.R                 # R + ggplot2 version
├── solar_viz.cpp               # C++ + Gnuplot version
├── solar_viz.html              # D3.js interactive web version
├── solar_viz.gnu               # Pure Gnuplot script
├── solar_viz.pde               # Processing animated version
├── run_all.bat                 # Windows batch runner
├── run_all.sh                  # Unix shell runner
├── README.md                   # This file
├── README_visualizations.md    # Detailed installation guide
└── COMPARISON.md               # Tool comparison matrix
```

---

## 🔧 Installation

### Prerequisites by Tool

<details>
<summary><b>🐍 Python + Matplotlib</b></summary>

```bash
# Install Python 3.7+
pip install pandas numpy matplotlib
```

</details>

<details>
<summary><b>📊 R + ggplot2</b></summary>

```R
# Install R 4.0+
install.packages(c("ggplot2", "gridExtra", "scales", "reshape2"))
```

</details>

<details>
<summary><b>🔧 C++ + Gnuplot</b></summary>

```bash
# Install C++ compiler (g++)
# Ubuntu/Debian
sudo apt-get install g++ gnuplot

# macOS
brew install gcc gnuplot

# Windows
# Install MinGW and download gnuplot from gnuplot.info
```

</details>

<details>
<summary><b>🌐 D3.js</b></summary>

**No installation needed!** Just open `solar_viz.html` in any modern browser.

</details>

<details>
<summary><b>📈 Gnuplot</b></summary>

```bash
# Ubuntu/Debian
sudo apt-get install gnuplot

# macOS
brew install gnuplot

# Windows
# Download from http://www.gnuplot.info/
```

</details>

<details>
<summary><b>🎨 Processing</b></summary>

1. Download Processing IDE from [processing.org](https://processing.org/)
2. Install and launch
3. Open `solar_viz.pde`
4. Press Run ▶️
</details>

---

## 🎓 Use Cases

### For Students

- 📚 Learn different visualization approaches
- 🔬 Understand solar radiation analysis
- 💡 Compare programming paradigms

### For Researchers

- 📊 Publication-quality plots (R)
- 🔢 Statistical analysis (correlation matrices)
- 📈 Quick data exploration (Python)

### For Developers

- 🌐 Web dashboard templates (D3.js)
- 🔧 Performance comparison across languages
- 🎨 Creative visualization techniques

### For Presenters

- ✨ Interactive demos (D3.js)
- 🎨 Animated visualizations (Processing)
- 📊 Professional slides (R exports)

---

## 🏆 Comparison

| Criteria              | Winner                  | Runner-up     |
| --------------------- | ----------------------- | ------------- |
| **Easiest Setup**     | 🥇 D3.js (browser only) | 🥈 Python     |
| **Best Looking**      | 🥇 R + ggplot2          | 🥈 D3.js      |
| **Most Interactive**  | 🥇 D3.js                | 🥈 Processing |
| **Publication Ready** | 🥇 R + ggplot2          | 🥈 Python     |
| **Coolest Factor**    | 🥇 Processing           | 🥈 C++        |
| **Fastest Runtime**   | 🥇 C++                  | 🥈 Python     |

_See [COMPARISON.md](COMPARISON.md) for detailed analysis._

---

## 📸 Output Files

After running all implementations, you'll have:

```
📁 Generated Outputs
├── 🐍 Python
│   ├── Fig-1.png (radiation components)
│   └── Fig-2.png (input variables)
├── 📊 R
│   ├── radiation_components_R.png
│   ├── input_variables_R.png
│   └── heatmap_R.png
├── 🔧 C++
│   ├── radiation_cpp.png
│   └── variables_cpp.png
├── 📈 Gnuplot
│   ├── radiation_gnuplot.png (4-panel)
│   └── radiation_polar.png (radar plot)
└── 🌐 D3.js
    └── (interactive in browser)
```

---

## 💡 Tips & Tricks

### Best Practices

1. **Start with D3.js** - Fastest way to explore the data interactively
2. **Use R for papers** - Publication-quality output
3. **Use Python for iteration** - Quick testing and modifications
4. **Use Processing for demos** - Wow factor for presentations

### Customization

All implementations use the same data structure, making it easy to:

- 🔄 Add your own data
- 🎨 Change color schemes
- 📊 Add new visualization types
- 🔧 Modify calculations

### Performance Tips

- **Python**: Use `plt.ion()` for interactive mode
- **R**: Increase DPI for higher quality: `ggsave(..., dpi=600)`
- **C++**: Compile with `-O3` for optimization
- **D3.js**: Works best in Chrome/Edge for performance

---

## 🤝 Contributing

Contributions are welcome! Here are some ideas:

- 🎨 Add new visualization types (3D plots, animations)
- 🔧 Add new language implementations (Julia, MATLAB, etc.)
- 📊 Add more statistical analysis
- 🐛 Fix bugs or improve documentation
- 🌍 Add internationalization

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

## 🙏 Acknowledgments

- Solar radiation data analysis formulas
- matplotlib, ggplot2, D3.js, gnuplot, and Processing communities
- All contributors and users of this project

---

## 📞 Contact & Support

- 📧 Issues: [GitHub Issues](https://github.com/yourusername/solar-radiation-viz/issues)
- 💬 Discussions: [GitHub Discussions](https://github.com/yourusername/solar-radiation-viz/discussions)
- ⭐ Star this repo if you find it useful!

---

<div align="center">

**Made with ☀️ and 💻**

_Demonstrating that there's more than one way to visualize data!_

[![Star this repo](https://img.shields.io/github/stars/yourusername/solar-radiation-viz?style=social)](https://github.com/yourusername/solar-radiation-viz)

</div>
