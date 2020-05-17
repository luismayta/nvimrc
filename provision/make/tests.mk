test.help:
	@echo '    Tests:'
	@echo ''
	@echo '        test                      show help'
	@echo '        test.all   	             Run all module test'
	@echo '        test.lint                 Run all pre-commit'
	@echo '        test.syntax             Run all syntax in code'
	@echo ''

test:
	@echo $(MESSAGE) Running tests on the current Python interpreter with coverage $(END)
	@if [ -z "${run}" ]; then \
		$(docker-test-run) bash -c "$(PIPENV_RUN) pytest"; \
	elif [ -n "${run}" ]; then \
		$(docker-test-run) bash -c "$(PIPENV_RUN) pytest tests/${run}"; \
	fi

test.all:
	@echo $(MESSAGE) Running tests on the current Python interpreter with coverage $(END)
	$(docker-test-run) bash -c "zunit --verbose"

test.lint:
	$(PIPENV_RUN) pre-commit run --all-files --verbose

test.syntax:
	@echo $(MESSAGE) Running tests $(END)
