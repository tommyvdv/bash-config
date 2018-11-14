bin_docker_compose=docker-compose
tree:
	tree -a -I .git > tree.md
pre-commit: tree
docker-compose-login: docker-compose-up
	$(bin_docker_compose) exec bash bash
docker-compose-up:
	$(bin_docker_compose) up -d
docker-compose-down:
	$(bin_docker_compose) down
