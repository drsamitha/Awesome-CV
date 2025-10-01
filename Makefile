.PHONY: examples

CC = xelatex
DOCS_DIR = Docs
RESUME_DIR = $(DOCS_DIR)
CV_DIR = $(DOCS_DIR)
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

examples: $(foreach x, coverletter cv resume, $x.pdf)

resume.pdf: $(DOCS_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(DOCS_DIR) $<

cv.pdf: $(DOCS_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(DOCS_DIR) $<

coverletter.pdf: $(DOCS_DIR)/coverletter.tex
	$(CC) -output-directory=$(DOCS_DIR) $<

clean:
	rm -rf $(DOCS_DIR)/*.pdf
