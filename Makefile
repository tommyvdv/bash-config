bin_docker_compose=docker-compose
tree:
	tree -a -I .git > tree.md \
	&& git add tree.md
pre-commit: tree
bundle:
	git bundle create repo.bundle --all
docker-compose-login: docker-compose-build
	$(bin_docker_compose) exec bash /bin/bash
docker-compose-up: bundle
	$(bin_docker_compose) up --detach
docker-compose-down:
	$(bin_docker_compose) down
docker-compose-build: bundle
	$(bin_docker_compose) up --build --detach
