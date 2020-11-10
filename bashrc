
git_branch() {
	branch=$(git branch 2> /dev/null | grep '*' | cut -c3-)

	if [[ ! -z "$branch" ]]; then
		echo -e "(\001\033[01;31m\002$branch\001\033[00m\002) "
	fi
}

PS1='[\[\033[01;32m\]\u@\h\[\033[00m\]: \[\033[01;34m\]\W\[\033[00m\]] $(git_branch)$ '

alias ll='ls -AlFh'

