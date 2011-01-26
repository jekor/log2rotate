all : log2rotate

log2rotate : log2rotate.lhs
	runhaskell Setup.lhs configure
	runhaskell Setup.lhs build

doc : log2rotate.pdf

log2rotate.pdf : log2rotate.tex
	pdflatex $<

log2rotate.tex : log2rotate.lhs
	lhs2TeX log2rotate.lhs > $@

clean :
	cabal clean
	rm -f log2rotate.{aux,log,out,ptb,tex}

dist :
	darcs dist