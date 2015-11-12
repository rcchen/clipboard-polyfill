all: clipboard.min.js

clipboard.min.js: clipboard.js
	closure-compiler \
		--js clipboard.js \
		--js_output_file clipboard.min.js

.PHONY: publish
publish:
	echo "Push a tag to GitHub to update bower."
	npm publish

.PHONY: deploy
deploy:
	rsync -avz ./ garron.net:~/garron.net/code/clipboard.js/ --exclude .git
