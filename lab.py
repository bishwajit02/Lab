import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
          'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']

# G0 = Extraterrestial Solar Radiation
G0 = np.array([575.23, 687.15, 814.34, 934.69, 1002.40, 1026.65, 
               1014.34, 959.27, 852.72, 713.18, 595.15, 541.45])

# h = Bright sunshine hours
h = np.array([8.29, 8.47, 8.11, 6.95, 6.44, 4.23, 
              3.94, 5.13, 5.28, 7.80, 8.73, 8.36])

# N = Maximum possible sunshine duration
N = np.array([9.82, 10.43, 11.13, 11.88, 12.46, 12.73,
              12.58, 12.07, 11.35, 10.60, 9.93, 9.62])

# W = Absolute humidity
W = np.array([10.96, 11.30, 14.20, 17.33, 19.47, 22.08,
              22.48, 22.70, 22.10, 19.95, 15.60, 12.39])

# R = Relative humidity
R = np.array([70.67, 69.10, 66.10, 75.11, 81.70, 86.70,
              87.50, 85.50, 86.22, 82.30, 75.30, 73.90])

# G = Total solar radiation
G = G0*(0.394 + (0.364* (h/(N**2)) * 0.0035*W))

# D = Diffuse radiation
D = G0*(0.306 - (0.165*(h/(N**2))) + 0.0025*W)

# B = G - D
B = G - D

data = pd.DataFrame({
    'Month': months,
    "G0": G0,
    'h': h,
    'N': N,
    'W': W,
    'R': R, 
    'G': G,
    'D': D,
    'B': B
})

print(data)

# Graph - 1
plt.figure(figsize=(10,6))
plt.plot(months, G, marker='o', label="G: Total Solar Radiation", linewidth=1.5, color="red")
plt.plot(months, D, marker='s', label="D: Diffuse Radiation", linewidth=1.5, color="green")
plt.plot(months, B, marker="^", label='B = G - D', linewidth=1.5, color="blue", linestyle='--')

plt.title('Monthly Variation of G and D')
plt.xlabel("Month")
plt.ylabel("Radiation")
plt.legend()
plt.grid(True, alpha=0.7, linestyle='--')
plt.tight_layout()
plt.show()

# Graph - 2
plt.figure(figsize=(10, 6))
plt.plot(months, R, marker='o', label='R: Relative Humidity (%)', linewidth=1.5)
plt.plot(months, h, marker='s', label='h: Bright Sunshine Hours', linewidth=1.5)
plt.plot(months, N, marker='^', label='N: Max Possible Sunshine Duration', linewidth=1.5)
plt.plot(months, W, marker='D', label='W: Absolute Humidity', linewidth=1.5)

plt.title('Monthly Variation of Input Variables (R%, h, N, W)')
plt.xlabel('Month')
plt.ylabel('Value')
plt.legend()
plt.grid(True, linestyle='--', alpha=0.7)
plt.tight_layout()
plt.show()