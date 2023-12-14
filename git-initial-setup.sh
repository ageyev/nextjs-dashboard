source "${HOME}"/.bashrc
source ./.env

git config --local init.defaultBranch 'main'
git config --local user.name "$GIT_USER_NAME"
git config --local user.email "$GIT_USER_EMAIL"
git config --list --local
echo "-------------------"

git init
git add .  && git commit -a -m 'initial commit'

ssh-add -D # delete all identities
ssh-add "${GITLAB_KEY_PATH}"
ssh-add "${GITHUB_KEY_PATH}"

echo "GitLab connection test:"
ssh -T git@gitlab.com
echo "GitHub connection test:"
ssh -T git@github.com

# >>> Create repo on github using GitHUb CLI
# https://github.com/cli/cli/blob/trunk/docs/install_linux.md
# https://github.com/settings/tokens < generate access tokens for general use or repo-scoped
gh auth login --with-token < "${GITHUB_TOKEN_PATH}"
#  https://cli.github.com/manual/gh_repo_create
gh repo create --source=. --public --remote=github --push
# additional options:
# --include-all-branches
# --description="${GIT_USER_NAME}.github.io/${APP_NAME}/"
# --homepage="${GIT_USER_NAME}.github.io/${APP_NAME}/"
git remote set-url github "git@github.com:${GIT_USER_NAME}/${APP_NAME}.git" # see https://stackoverflow.com/a/21761136/1697878

# create new GitLab repo:
# GitLab can create new private repo on first push (see https://stackoverflow.com/a/64656788/1697878)
git remote add gitlab "git@gitlab.com:${GIT_USER_NAME}/${APP_NAME}.git" && git push -u gitlab main

# or add existing remote repository
## see: https://docs.github.com/en/get-started/getting-started-with-git/managing-remote-repositories
# git remote add gitlab "git@gitlab.com:${GIT_USER_NAME}/${APP_NAME}.git"
# git remote add github "git@github.com:${GIT_USER_NAME}/${APP_NAME}.git"

# [git push](https://git-scm.com/docs/git-push) options:
# -u --set-upstream : https://git-scm.com/docs/git-push#Documentation/git-push.txt--u < for the first push
# -f -- force : https://git-scm.com/docs/git-push#Documentation/git-push.txt---force  < replace the remote repo with local repo

