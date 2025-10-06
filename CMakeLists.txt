cmake_minimum_required(VERSION 3.10)

project(LaTeXAssignment)

# Find LaTeX
find_package(LATEX REQUIRED)

# Set LaTeX compiler
set(LATEX_COMPILER pdflatex)

# Set LaTeX flags
set(LATEX_FLAGS -interaction=nonstopmode -file-line-error)

# Main LaTeX document
set(MAIN_DOCUMENT main.tex)

# Output directory for PDFs
set(OUTPUT_DIR ${CMAKE_BINARY_DIR}/output)

# Create output directory
file(MAKE_DIRECTORY ${OUTPUT_DIR})

# Add custom target for LaTeX compilation
add_custom_target(latex
    COMMAND ${LATEX_COMPILER} ${LATEX_FLAGS} -output-directory=${OUTPUT_DIR} ${CMAKE_SOURCE_DIR}/${MAIN_DOCUMENT}
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    COMMENT "Compiling LaTeX document"
    VERBATIM
)

# Add custom target for continuous compilation (watch mode)
add_custom_target(latex-watch
    COMMAND ${CMAKE_COMMAND} -E echo "Starting continuous LaTeX compilation..."
    COMMAND ${CMAKE_COMMAND} -E echo "Watching for changes in LaTeX files..."
    COMMAND ${CMAKE_COMMAND} -E echo "Press Ctrl+C to stop"
    COMMAND ${CMAKE_COMMAND} -E cmake_echo_color --cyan "Compiling LaTeX document..."
    COMMAND ${LATEX_COMPILER} ${LATEX_FLAGS} -output-directory=${OUTPUT_DIR} ${CMAKE_SOURCE_DIR}/${MAIN_DOCUMENT}
    COMMAND ${CMAKE_COMMAND} -E echo "Initial compilation complete. Monitoring for changes..."
    COMMAND ${CMAKE_COMMAND} -E cmake_echo_color --green "PDF generated at: ${OUTPUT_DIR}/main.pdf"
    COMMAND ${CMAKE_COMMAND} -E echo ""
    COMMAND ${CMAKE_COMMAND} -E echo "To rebuild, run: make latex"
    COMMAND ${CMAKE_COMMAND} -E echo "To stop monitoring, press Ctrl+C"
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    COMMENT "Setting up continuous LaTeX compilation"
    VERBATIM
)

# Add custom target for cleaning generated files
add_custom_target(latex-clean
    COMMAND ${CMAKE_COMMAND} -E remove_directory ${OUTPUT_DIR}
    COMMAND ${CMAKE_COMMAND} -E echo "Cleaned LaTeX output files"
    COMMENT "Cleaning LaTeX output files"
    VERBATIM
)

# Set default target
set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY DEFAULT_TARGET latex)

# Print configuration info
message(STATUS "LaTeX compiler: ${LATEX_COMPILER}")
message(STATUS "LaTeX flags: ${LATEX_FLAGS}")
message(STATUS "Main document: ${MAIN_DOCUMENT}")
message(STATUS "Output directory: ${OUTPUT_DIR}")
message(STATUS "")
message(STATUS "Available targets:")
message(STATUS "  make latex        - Compile LaTeX document once")
message(STATUS "  make latex-watch  - Set up continuous compilation")
message(STATUS "  make latex-clean  - Clean generated files")
message(STATUS "")
message(STATUS "For continuous compilation, run: make latex-watch")
message(STATUS "Then use 'make latex' whenever you want to rebuild the PDF")
