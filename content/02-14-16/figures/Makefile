all: bisector_tex.png equate_torque_tex.png measurements_tex.png

bisector_tex.png: bisector_tex.pdf
	convert -density 600 $< -alpha off -quality 95 $@

bisector_tex.pdf: bisector_tex.tex bisector.pdf_t
	pdflatex $<
	

equate_torque_tex.png: equate_torque_tex.pdf
	convert -density 600 $< -alpha off -quality 95 $@

equate_torque_tex.pdf: equate_torque_tex.tex equate_torque.pdf_t
	pdflatex $<
	

measurements_tex.png: measurements_tex.pdf
	convert -density 600 $< -alpha off -quality 95 $@

measurements_tex.pdf: measurements_tex.tex measurements.pdf_t
	pdflatex $<
