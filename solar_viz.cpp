// C++ Solar Radiation Visualization using gnuplot-iostream
// Compile: g++ -std=c++17 solar_viz.cpp -o solar_viz -lboost_iostreams -lboost_system
// Or simpler: g++ -std=c++17 solar_viz.cpp -o solar_viz

#include <iostream>
#include <vector>
#include <string>
#include <cmath>
#include <fstream>
#include <iomanip>

using namespace std;

class SolarRadiationAnalyzer {
private:
    vector<string> months;
    vector<double> G0, h, N, W, R, G, D, B;
    
    void calculateDerivedValues() {
        G.resize(12);
        D.resize(12);
        B.resize(12);
        
        for (int i = 0; i < 12; i++) {
            G[i] = G0[i] * (0.394 + (0.364 * (h[i] / (N[i] * N[i])) * 0.0035 * W[i]));
            D[i] = G0[i] * (0.306 - (0.165 * (h[i] / (N[i] * N[i]))) + 0.0025 * W[i]);
            B[i] = G[i] - D[i];
        }
    }
    
    void writeGnuplotScript1() {
        ofstream script("plot1.gnu");
        script << "set terminal pngcairo size 1200,800 enhanced font 'Arial,12'\n";
        script << "set output 'radiation_cpp.png'\n";
        script << "set title 'Monthly Variation of Solar Radiation (C++ + Gnuplot)' font 'Arial,16'\n";
        script << "set xlabel 'Month' font 'Arial,12'\n";
        script << "set ylabel 'Radiation (W/m²)' font 'Arial,12'\n";
        script << "set grid linestyle 2 linewidth 0.5\n";
        script << "set key outside right top\n";
        script << "set style line 1 lc rgb '#E74C3C' lt 1 lw 2 pt 7 ps 1.5\n";
        script << "set style line 2 lc rgb '#27AE60' lt 1 lw 2 pt 5 ps 1.5\n";
        script << "set style line 3 lc rgb '#3498DB' lt 2 lw 2 pt 9 ps 1.5\n";
        script << "set xtics rotate by -45\n";
        script << "plot 'data_G.txt' using 0:2:xtic(1) with linespoints ls 1 title 'G: Total Solar Radiation', \\\n";
        script << "     'data_D.txt' using 0:2:xtic(1) with linespoints ls 2 title 'D: Diffuse Radiation', \\\n";
        script << "     'data_B.txt' using 0:2:xtic(1) with linespoints ls 3 title 'B: Direct Beam (G-D)'\n";
        script.close();
    }
    
    void writeGnuplotScript2() {
        ofstream script("plot2.gnu");
        script << "set terminal pngcairo size 1200,800 enhanced font 'Arial,12'\n";
        script << "set output 'variables_cpp.png'\n";
        script << "set title 'Monthly Variation of Input Variables (C++ + Gnuplot)' font 'Arial,16'\n";
        script << "set xlabel 'Month' font 'Arial,12'\n";
        script << "set ylabel 'Value' font 'Arial,12'\n";
        script << "set grid linestyle 2 linewidth 0.5\n";
        script << "set key outside right top\n";
        script << "set style line 1 lc rgb '#E74C3C' lt 1 lw 2 pt 7 ps 1.5\n";
        script << "set style line 2 lc rgb '#3498DB' lt 1 lw 2 pt 5 ps 1.5\n";
        script << "set style line 3 lc rgb '#F39C12' lt 1 lw 2 pt 9 ps 1.5\n";
        script << "set style line 4 lc rgb '#9B59B6' lt 1 lw 2 pt 11 ps 1.5\n";
        script << "set xtics rotate by -45\n";
        script << "plot 'data_R.txt' using 0:2:xtic(1) with linespoints ls 1 title 'R: Relative Humidity (%)', \\\n";
        script << "     'data_h.txt' using 0:2:xtic(1) with linespoints ls 2 title 'h: Bright Sunshine Hours', \\\n";
        script << "     'data_N.txt' using 0:2:xtic(1) with linespoints ls 3 title 'N: Max Sunshine Duration', \\\n";
        script << "     'data_W.txt' using 0:2:xtic(1) with linespoints ls 4 title 'W: Absolute Humidity'\n";
        script.close();
    }
    
    void writeDataFile(const string& filename, const vector<double>& data) {
        ofstream file(filename);
        for (int i = 0; i < 12; i++) {
            file << months[i] << " " << fixed << setprecision(2) << data[i] << "\n";
        }
        file.close();
    }
    
public:
    SolarRadiationAnalyzer() {
        months = {"Jan", "Feb", "Mar", "Apr", "May", "Jun",
                  "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};
        
        G0 = {575.23, 687.15, 814.34, 934.69, 1002.40, 1026.65,
              1014.34, 959.27, 852.72, 713.18, 595.15, 541.45};
        
        h = {8.29, 8.47, 8.11, 6.95, 6.44, 4.23,
             3.94, 5.13, 5.28, 7.80, 8.73, 8.36};
        
        N = {9.82, 10.43, 11.13, 11.88, 12.46, 12.73,
             12.58, 12.07, 11.35, 10.60, 9.93, 9.62};
        
        W = {10.96, 11.30, 14.20, 17.33, 19.47, 22.08,
             22.48, 22.70, 22.10, 19.95, 15.60, 12.39};
        
        R = {70.67, 69.10, 66.10, 75.11, 81.70, 86.70,
             87.50, 85.50, 86.22, 82.30, 75.30, 73.90};
        
        calculateDerivedValues();
    }
    
    void displayData() {
        cout << "\n╔════════════════════════════════════════════════════════════════════════════╗\n";
        cout << "║         SOLAR RADIATION ANALYSIS - C++ Implementation                      ║\n";
        cout << "╚════════════════════════════════════════════════════════════════════════════╝\n\n";
        
        cout << fixed << setprecision(2);
        cout << "Month   G0       h       N       W       R       G       D       B\n";
        cout << "─────────────────────────────────────────────────────────────────────────────\n";
        
        for (int i = 0; i < 12; i++) {
            cout << setw(4) << months[i] << " "
                 << setw(7) << G0[i] << " "
                 << setw(7) << h[i] << " "
                 << setw(7) << N[i] << " "
                 << setw(7) << W[i] << " "
                 << setw(7) << R[i] << " "
                 << setw(7) << G[i] << " "
                 << setw(7) << D[i] << " "
                 << setw(7) << B[i] << "\n";
        }
        cout << "\n";
    }
    
    void generatePlots() {
        // Write data files
        writeDataFile("data_G.txt", G);
        writeDataFile("data_D.txt", D);
        writeDataFile("data_B.txt", B);
        writeDataFile("data_R.txt", R);
        writeDataFile("data_h.txt", h);
        writeDataFile("data_N.txt", N);
        writeDataFile("data_W.txt", W);
        
        // Write gnuplot scripts
        writeGnuplotScript1();
        writeGnuplotScript2();
        
        // Execute gnuplot
        cout << "Generating plots with gnuplot...\n";
        system("gnuplot plot1.gnu");
        system("gnuplot plot2.gnu");
        
        cout << "\n✓ Plots generated:\n";
        cout << "  - radiation_cpp.png\n";
        cout << "  - variables_cpp.png\n\n";
    }
    
    void generateASCIIArt() {
        cout << "\n╔════════════════════════════════════════════════════════════════════╗\n";
        cout << "║                    ASCII RADIATION CHART                            ║\n";
        cout << "╚════════════════════════════════════════════════════════════════════╝\n\n";
        
        // Find max for scaling
        double maxG = *max_element(G.begin(), G.end());
        int width = 60;
        
        for (int i = 0; i < 12; i++) {
            cout << months[i] << " | ";
            int bars = (int)((G[i] / maxG) * width);
            for (int j = 0; j < bars; j++) cout << "█";
            cout << " " << G[i] << "\n";
        }
        cout << "\n";
    }
};

int main() {
    SolarRadiationAnalyzer analyzer;
    
    analyzer.displayData();
    analyzer.generateASCIIArt();
    analyzer.generatePlots();
    
    cout << "╔════════════════════════════════════════════════════════════════════╗\n";
    cout << "║  Analysis complete! Check the generated PNG files.                 ║\n";
    cout << "╚════════════════════════════════════════════════════════════════════╝\n";
    
    return 0;
}

