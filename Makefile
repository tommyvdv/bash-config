bin_docker_compose=docker-compose
bin_git=git
path_git_bundle=repo.bundle
git_commit_hash_current=$$($(bin_git) rev-parse --short HEAD)
git_branch_current=$$($(bin_git) rev-parse --abbrev-ref HEAD)
git_commit_info_current=$$($(bin_git) show --quiet --pretty="format:%h %an %s" $(git_commit_hash))
tree:
	tree -a -I .git > tree.md \
	&& git add tree.md
pre-commit: tree
git-hook-install:
	git-hooks/install
git-hook-uninstall:
	git-hooks/uninstall
git-bundle:
	git submodule init
	git submodule update
	git bundle create $(path_git_bundle) --all
docker-compose-login:
	$(bin_docker_compose) exec bash /bin/bash
docker-compose-up:
	$(bin_docker_compose) up --detach
docker-compose-down:
	$(bin_docker_compose) down
docker-compose-build:
	$(bin_docker_compose) up --build --detach --force-recreate
docker-compose-test-info:
	@printf '%*s\n' "$${COLUMNS:-$$(tput cols)}" '' | tr ' ' -
	@echo "branch: $(git_branch_current)"
	@echo "commit: $(git_commit_info_current)"
	@printf '%*s\n' "$${COLUMNS:-$$(tput cols)}" '' | tr ' ' -
docker-compose-test: docker-compose-test-info git-bundle docker-compose-down docker-compose-build docker-compose-up docker-compose-login
