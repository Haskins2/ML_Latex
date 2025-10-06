# LaTeX Assignment Directory Structure

This directory contains the LaTeX source files for your machine learning assignment.

## Directory Structure

- `main.tex` - Main LaTeX document
- `figures/` - Directory for images and figures
- `tables/` - Directory for table files
- `sections/` - Directory for separate section files (optional)
- `CMakeLists.txt` - CMake configuration for building
- `build/` - Build directory (created by CMake)
- `output/` - Output directory for generated PDFs (created by CMake)

## Usage

1. **Initial Setup:**
   ```bash
   mkdir build
   cd build
   cmake ..
   ```

2. **Compile Once:**
   ```bash
   make latex
   ```

3. **Continuous Compilation Setup:**
   ```bash
   make latex-watch
   ```
   Then use `make latex` whenever you want to rebuild the PDF.

4. **Clean Generated Files:**
   ```bash
   make latex-clean
   ```

## Adding Content

- Place images in the `figures/` directory
- Place table files in the `tables/` directory
- For large documents, consider splitting into sections in the `sections/` directory
- Update `main.tex` to include additional files as needed

## Requirements

- LaTeX distribution (TeX Live, MiKTeX, etc.)
- CMake 3.10 or higher
- Make (usually included with development tools)
