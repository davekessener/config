
gen_git_branch() {
	git_branch=$(git branch 2> /dev/null | grep '*' | cut -c3-)

	if [[ ! -z "$git_branch" ]]; then
		git_branch="(\[\033[01;31m\]$git_branch\[\033[00m\]) "
	fi
}

gen_git_branch

PS1="[\[\033[01;32m\]\u@\h\[\033[00m\]: \[\033[01;34m\]\W\[\033[00m\]] $git_branch$ "

alias ll='ls -AlFh'

