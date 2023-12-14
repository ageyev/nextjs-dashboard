
source "${HOME}"/.bashrc
source ./.env

ssh-add "${GITLAB_KEY_PATH}"
ssh-add "${GITHUB_KEY_PATH}"

git push github
git push gitlab