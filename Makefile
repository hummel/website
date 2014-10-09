all: gen

CV: content/media/pdfs/CV.pdf

content/media/pdfs/CV.pdf: CV/CV.tex
	cd CV; make
	mkdir -p content/media/pdfs/
	cp CV/CV.pdf content/media/pdfs/

gen: #CV
	hyde gen

serve: clean gen
	hyde serve

clean:
	rm -rf deploy

gen-production: clean
	hyde gen -c production.yaml

publish: gen-production	#CV
	rsync -e ssh -r deploy_production/ jhummel@astro.as.utexas.edu:www/
