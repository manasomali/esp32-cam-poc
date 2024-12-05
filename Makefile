# Variables
PYTHON := python
VENV := venv
FLASK_APP := app.py
RUN_PORT := 5000

# Commands
.PHONY: help create-venv install dev run lint-and-format clean

help:  ## Show help message
	@echo "Usage: make <target>"
	@echo
	@echo "Available targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-15s %s\n", $$1, $$2}'

create-venv: ## Create a virtual environment
	@echo "Creating virtual environment..."
	$(PYTHON) -m venv $(VENV)

dev: install ## Run the Flask app in development mode
	@echo "Installing dependencies..."
	$(VENV)/bin/pip install -r requirements.development.txt
	@echo "Starting Flask app in development mode..."
	$(VENV)/bin/flask run --host=0.0.0.0 --port=$(RUN_PORT)

run: install ## Run the Flask app (production settings)
	@echo "Installing dependencies..."
	$(VENV)/bin/pip install -r requirements.txt
	@echo "Starting Flask app in production mode..."
	$(VENV)/bin/python $(FLASK_APP)

lint-and-format: ## Run linter (flake8)
	@echo "Running linter..."
	ruff check --fix
	black .

clean: ## Remove temporary files and the virtual environment
	@echo "Cleaning up..."
	rm -rf $(VENV)
	find . -type f -name "*.pyc" -delete
	find . -type d -name "__pycache__" -delete
