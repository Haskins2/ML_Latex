# LaTeX Document Setup

This directory contains a LaTeX document with a compact title/author/subtitle format, organized for machine learning assignments.

## Structure

```
├── main.tex              # Main LaTeX document
├── sections/             # Section files
│   ├── introduction.tex
│   ├── methodology.tex
│   ├── results.tex
│   ├── discussion.tex
│   └── conclusion.tex
├── figures/              # Image files
├── tables/               # Table files
├── CMakeLists.txt        # CMake build configuration
└── Makefile              # Simple build commands
```

## Features

- **Compact Format**: Reduced spacing and margins for efficient use of space
- **Modular Structure**: Separate files for each section
- **Professional Layout**: Clean typography with proper spacing
- **Build System**: Both CMake and Makefile support

## Building

### Using Makefile (Recommended)
```bash
make          # Build PDF
make clean    # Clean auxiliary files
make watch    # Watch for changes and rebuild
```

### Using CMake
```bash
mkdir build && cd build
cmake ..
make latex
```

## Customization

### Title and Author
Edit the title, author, and subtitle in `main.tex`:
```latex
\title{\vspace{-2cm}\Large\textbf{Your Title}\\[0.5em]
       \large\textit{Your Subtitle}}
\author{\vspace{-1cm}Your Name\\[0.3em]
        \small Your Institution\\[0.3em]
        \small Your Program}
```

### Adding Content
- Edit section files in the `sections/` directory
- Add figures to the `figures/` directory
- Add tables to the `tables/` directory

### Spacing Adjustments
Modify spacing in `main.tex`:
- `\vspace{-2cm}` controls title spacing
- `\titlespacing*` controls section spacing
- `\setlength{\parskip}` controls paragraph spacing
