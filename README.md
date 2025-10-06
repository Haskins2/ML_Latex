# LaTeX Assignment Repository

This repository is set up for writing machine learning assignments in LaTeX with CMake for continuous PDF generation.

## Quick Start

1. **Initial Setup:**
   ```bash
   mkdir build
   cd build
   cmake ..
   ```

2. **Compile PDF:**
   ```bash
   make latex
   ```

3. **For Continuous Compilation:**
   ```bash
   make latex-watch
   ```
   Then run `make latex` whenever you want to rebuild the PDF.

## Directory Structure

```
├── main.tex              # Main LaTeX document
├── CMakeLists.txt        # CMake configuration
├── .gitignore           # Git ignore file
├── README.md            # This file
├── figures/             # Directory for images and figures
├── tables/              # Directory for table files
├── sections/            # Directory for separate section files
│   └── README.md        # Directory structure documentation
├── build/               # Build directory (created by CMake)
└── output/              # Output directory for PDFs (created by CMake)
```

## Features

- **CMake Integration**: Automated LaTeX compilation with CMake
- **Continuous Compilation**: Easy setup for watching file changes
- **Clean Structure**: Organized directories for figures, tables, and sections
- **Git Ready**: Proper .gitignore for LaTeX and CMake artifacts
- **Professional Template**: Pre-configured LaTeX document with common packages

## Available CMake Targets

- `make latex` - Compile LaTeX document once
- `make latex-watch` - Set up continuous compilation monitoring
- `make latex-clean` - Clean all generated files

## Requirements

- LaTeX distribution (TeX Live, MiKTeX, etc.)
- CMake 3.10 or higher
- Make (usually included with development tools)

## Usage Tips

1. **Adding Images**: Place images in the `figures/` directory and reference them in your LaTeX:
   ```latex
   \includegraphics[width=0.8\textwidth]{figures/your_image.png}
   ```

2. **Large Documents**: For complex assignments, consider splitting content into separate files in the `sections/` directory and including them:
   ```latex
   \input{sections/introduction}
   \input{sections/methodology}
   ```

3. **Tables**: Store table definitions in the `tables/` directory for better organization.

4. **Continuous Workflow**: 
   - Run `make latex-watch` once to set up monitoring
   - Edit your LaTeX files
   - Run `make latex` to rebuild the PDF
   - The PDF will be generated in the `output/` directory

## Customization

- Modify `main.tex` to customize the document structure
- Add additional LaTeX packages as needed
- Adjust CMakeLists.txt for different compilation options
- The template includes common packages for machine learning assignments (math, graphics, code listings, etc.)

## Troubleshooting

- If compilation fails, check the LaTeX log files in the output directory
- Ensure all required LaTeX packages are installed
- For continuous compilation issues, try running `make latex-clean` first
