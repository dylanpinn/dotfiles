[alias]
	# Add
	aa = add --all
	ap = add --patch

	# Checkout
	co = checkout
	workon = "!f(){ git fetch && git checkout -b \"$1\" $(git symbolic-ref refs/remotes/origin/HEAD | sed \"s@^refs/remotes/@@\"); };f"

	# Commit
	amend = commit --amend
	ci = commit --verbose

	# Diff
	di = diff
	dc = diff --cached

	# Log
	changelog = log origin..HEAD --format='* %s%n%w(,4,4)%+b'
	glg = log --oneline --decorate --all --graph

	# Pull
	refresh = "!f(){ git fetch && git stash && git rebase $(git symbolic-ref refs/remotes/origin/HEAD | sed \"s@^refs/remotes/@@\") && git stash pop; };f"

	# Push
	pf = push --force-with-lease

	# Status
	st = status
[color]
	ui = auto
[fetch]
	prune = true
[help]
	autocorrect = 10
[init]
	defaultBranch = main
[merge]
	conflictStyle = diff3
	ff = only
[mergetool]
	keepBackup = false
[pull]
	ff = only
[rebase]
	autosquash = true
[user]
	name = NAME
	email = EMAIL
