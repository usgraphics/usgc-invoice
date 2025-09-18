# Invoice template build commands

# Default recipe - build the invoice PDF
default: build

# Build the invoice PDF using LuaLaTeX
build:
    lualatex usgc-invoice.tex

# Build the Quarto invoice PDF
quarto:
    quarto render uscg-invoice.qmd

# Clean build artifacts
clean:
    rm -f *.aux *.log *.out *.fls *.fdb_latexmk

# Clean everything including PDFs
clean-all: clean
    rm -f *.pdf

# Rebuild (clean + build)
rebuild: clean build

# Watch for changes and rebuild automatically (requires entr)
watch:
    find . -name "*.tex" | entr -r just build

# Show PDF info
info:
    @if [ -f usgc-invoice.pdf ]; then \
        echo "PDF file exists:"; \
        ls -lh usgc-invoice.pdf; \
        echo ""; \
        echo "PDF info:"; \
        pdfinfo usgc-invoice.pdf 2>/dev/null || echo "pdfinfo not available"; \
    else \
        echo "PDF file does not exist. Run 'just build' first."; \
    fi

# Open the PDF (Linux)
open:
    @if [ -f usgc-invoice.pdf ]; then \
        xdg-open usgc-invoice.pdf; \
    else \
        echo "PDF file does not exist. Run 'just build' first."; \
    fi

# List all available recipes
list:
    @just --list