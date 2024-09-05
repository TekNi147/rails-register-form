.PHONY: test cov

test:
	bundle exec rspec

cov:
	open coverage/index.html
	