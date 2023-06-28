.PHONY: update run help

# Default target
help:
	@echo "Available targets:"
	@echo "  update          Stop, remove, and rebuild the Docker container."
	@echo "  build           Reuild the Docker container."
	@echo "  run             Run the Docker container."
	@echo "  help            Show this help message."

build:
	docker build -t image-resizer .

update:
	docker stop image-resizer-container || true
	docker rm image-resizer-container || true
	docker build -t image-resizer .

run:
	docker run -d -p 8111:8111 --name image-resizer-container image-resizer