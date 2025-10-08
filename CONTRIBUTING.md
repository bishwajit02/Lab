# Contributing to Solar Radiation Visualization Suite

First off, thank you for considering contributing to this project! 🎉

## 🌟 Ways to Contribute

### 1. Add a New Language/Tool Implementation

Want to see this data visualized in Julia, MATLAB, Rust, or another tool? We'd love that!

**Steps:**

1. Create a new file: `solar_viz.[extension]`
2. Implement the same data visualization
3. Update the README with your implementation
4. Add installation instructions to `README_visualizations.md`
5. Update `COMPARISON.md` with your tool's pros/cons

**Required Features:**

- Plot radiation components (G, D, B)
- Plot input variables (R, h, N, W)
- Include month labels
- Use similar color schemes where possible

### 2. Enhance Existing Implementations

- Add new chart types
- Improve styling
- Optimize performance
- Fix bugs

### 3. Improve Documentation

- Fix typos
- Add examples
- Clarify installation steps
- Add troubleshooting guides

### 4. Add Features

- 3D visualizations
- Time-series analysis
- Export functionality
- Data input from files
- Additional calculations

## 📋 Contribution Guidelines

### Code Style

**Python:**

- Follow PEP 8
- Use meaningful variable names
- Add comments for complex calculations

**R:**

- Follow tidyverse style guide
- Use <- for assignment
- Document functions

**C++:**

- Use C++17 standard
- Follow Google C++ Style Guide
- Comment class methods

**JavaScript:**

- Use ES6+ features
- Follow Airbnb JavaScript Style Guide
- Use meaningful function names

### Commit Messages

Use clear, descriptive commit messages:

```
✅ Good:
- "Add Julia implementation with Plots.jl"
- "Fix correlation calculation in D3.js version"
- "Update README with installation steps for Windows"

❌ Bad:
- "update"
- "fix bug"
- "changes"
```

### Pull Request Process

1. **Fork** the repository
2. **Create** a new branch: `git checkout -b feature/my-new-feature`
3. **Make** your changes
4. **Test** your implementation thoroughly
5. **Commit** your changes: `git commit -m "Add feature X"`
6. **Push** to your fork: `git push origin feature/my-new-feature`
7. **Submit** a pull request

### PR Checklist

Before submitting a pull request, ensure:

- [ ] Code runs without errors
- [ ] Documentation is updated
- [ ] New dependencies are documented
- [ ] Code follows style guidelines
- [ ] Commit messages are clear
- [ ] README is updated if needed

## 🎨 Design Principles

When adding visualizations, keep these in mind:

1. **Consistency**: Use similar color schemes across implementations
2. **Clarity**: Labels and legends should be clear
3. **Accessibility**: Consider colorblind-friendly palettes
4. **Performance**: Code should run efficiently
5. **Documentation**: Include usage examples

## 🐛 Reporting Bugs

### Before Reporting

- Check if the bug has already been reported
- Try to reproduce the bug
- Collect error messages and logs

### Bug Report Template

```markdown
**Description:**
A clear description of the bug

**To Reproduce:**
Steps to reproduce the behavior:

1. Run '...'
2. See error '...'

**Expected Behavior:**
What you expected to happen

**Environment:**

- OS: [e.g., Windows 10]
- Language Version: [e.g., Python 3.9]
- Tool Version: [e.g., matplotlib 3.5]

**Additional Context:**
Any other relevant information
```

## 💡 Suggesting Enhancements

### Enhancement Request Template

```markdown
**Feature Description:**
A clear description of the feature

**Use Case:**
Why this feature would be useful

**Proposed Implementation:**
How you think it could be implemented

**Alternatives:**
Any alternative solutions you've considered
```

## 🎯 Good First Issues

New to the project? Look for issues tagged with:

- `good-first-issue`
- `documentation`
- `enhancement`

## 📚 Resources

### Visualization Libraries

- [matplotlib documentation](https://matplotlib.org/stable/contents.html)
- [ggplot2 documentation](https://ggplot2.tidyverse.org/)
- [D3.js documentation](https://d3js.org/)
- [gnuplot documentation](http://www.gnuplot.info/documentation.html)
- [Processing documentation](https://processing.org/reference/)

### Learning Resources

- [Python Data Visualization Guide](https://realpython.com/python-data-visualization-matplotlib/)
- [R Graphics Cookbook](https://r-graphics.org/)
- [Interactive Data Visualization for the Web](https://alignedleft.com/work/d3-book)

## 🤝 Code of Conduct

### Our Standards

- Be respectful and inclusive
- Welcome newcomers
- Accept constructive criticism
- Focus on what's best for the project
- Show empathy towards others

### Unacceptable Behavior

- Harassment or discrimination
- Trolling or insulting comments
- Publishing others' private information
- Other unprofessional conduct

## ❓ Questions?

- Open a [GitHub Discussion](https://github.com/yourusername/solar-radiation-viz/discussions)
- Tag your issue with `question`
- Check existing issues and discussions first

## 🙏 Thank You!

Every contribution, no matter how small, makes a difference. Thank you for helping make this project better!

---

_Happy coding!_ ☀️💻
