git_branch() {
	branch=$(git branch 2> /dev/null | grep '*' | cut -c3-)

	if [[ ! -z "$branch" ]]; then
		echo -e "(\033[01;31m$branch\033[00m) "
	fi
}

PS1="[\033[01;32m\u@\h\033[00m: \033[01;34m\W\033[00m] $(git_branch)$ "

alias ll='ls -AlFh'

