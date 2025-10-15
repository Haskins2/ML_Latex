cmake_minimum_required(VERSION 3.10)
project(LaTeX_Document)

# Find LaTeX
find_package(LATEX REQUIRED)

# Set LaTeX compiler
set(LATEX_COMPILER pdflatex)

# Main document
set(MAIN_DOCUMENT main.tex)

# Source files
set(SOURCES
    main.tex
    sections/introduction.tex
    sections/methodology.tex
    sections/results.tex
    sections/discussion.tex
    sections/conclusion.tex
)

# Add LaTeX document
add_latex_document(${MAIN_DOCUMENT}
    INPUTS ${SOURCES}
    IMAGE_DIRS figures
    TABLE_DIRS tables
    BIBTEX
    PDF
    MANGLE_TARGET_NAMES
)

# Custom targets for common operations
add_custom_target(latex-clean
    COMMAND ${CMAKE_COMMAND} -E remove_directory ${CMAKE_CURRENT_BINARY_DIR}/output
    COMMAND ${CMAKE_COMMAND} -E remove ${CMAKE_CURRENT_BINARY_DIR}/*.aux
    COMMAND ${CMAKE_COMMAND} -E remove ${CMAKE_CURRENT_BINARY_DIR}/*.log
    COMMAND ${CMAKE_COMMAND} -E remove ${CMAKE_CURRENT_BINARY_DIR}/*.out
    COMMAND ${CMAKE_COMMAND} -E remove ${CMAKE_CURRENT_BINARY_DIR}/*.toc
    COMMAND ${CMAKE_COMMAND} -E remove ${CMAKE_CURRENT_BINARY_DIR}/*.fdb_latexmk
    COMMAND ${CMAKE_COMMAND} -E remove ${CMAKE_CURRENT_BINARY_DIR}/*.fls
    COMMAND ${CMAKE_COMMAND} -E remove ${CMAKE_CURRENT_BINARY_DIR}/*.synctex.gz
    COMMENT "Cleaning LaTeX auxiliary files"
)

# Watch mode for continuous compilation
add_custom_target(latex-watch
    COMMAND ${CMAKE_COMMAND} -E echo "Watching for changes in LaTeX files..."
    COMMAND fswatch -o . | xargs -n1 -I{} make latex
    COMMENT "Watching LaTeX files for changes"
)

# Set output directory
set(LATEX_OUTPUT_PATH ${CMAKE_CURRENT_BINARY_DIR}/output)
