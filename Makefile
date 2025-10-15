# Makefile for LaTeX Document

# Variables
MAIN = main
TEX_FILES = $(wildcard sections/*.tex)
FIGURES = $(wildcard figures/*)
TABLES = $(wildcard tables/*)

# Default target
all: $(MAIN).pdf

# Build PDF
$(MAIN).pdf: $(MAIN).tex $(TEX_FILES) $(FIGURES) $(TABLES)
	pdflatex $(MAIN).tex
	pdflatex $(MAIN).tex  # Run twice for proper references

# Clean auxiliary files
clean:
	rm -f *.aux *.log *.out *.toc *.fdb_latexmk *.fls *.synctex.gz
	rm -f sections/*.aux

# Clean everything including PDF
distclean: clean
	rm -f $(MAIN).pdf

# Watch for changes and rebuild
watch:
	@echo "Watching for changes in LaTeX files..."
	@echo "Press Ctrl+C to stop watching"
	@if command -v fswatch >/dev/null 2>&1; then \
		fswatch -o $(MAIN).tex $(TEX_FILES) | while read; do \
			echo "File changed, rebuilding..."; \
			make $(MAIN).pdf; \
		done; \
	elif command -v inotifywait >/dev/null 2>&1; then \
		while inotifywait -e modify $(MAIN).tex $(TEX_FILES); do \
			echo "File changed, rebuilding..."; \
			make $(MAIN).pdf; \
		done; \
	else \
		echo "No file watching tool found. Install fswatch or inotify-tools."; \
		echo "Alternatively, run 'make' manually after each change."; \
	fi

# Help
help:
	@echo "Available targets:"
	@echo "  all      - Build PDF (default)"
	@echo "  clean    - Remove auxiliary files"
	@echo "  distclean- Remove all generated files"
	@echo "  watch    - Watch for changes and rebuild"
	@echo "  help     - Show this help"

.PHONY: all clean distclean watch help
