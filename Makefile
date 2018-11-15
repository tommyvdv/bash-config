bin_docker_compose=docker-compose
tree:
	tree -a -I .git > tree.md \
	&& git add tree.md
pre-commit: tree
docker-compose-login: docker-compose-build
	$(bin_docker_compose) exec bash bash
docker-compose-up:
	$(bin_docker_compose) up --detach
docker-compose-down:
	$(bin_docker_compose) down
docker-compose-build:
	$(bin_docker_compose) up --build --detach
