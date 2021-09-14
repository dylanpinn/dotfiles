[alias]
	# Add
	aa = add --all
	ap = add --patch

	# Checkout
	co = checkout

	# Commit
	amend = commit --amend
	ci = commit --verbose

	# Diff
	di = diff
	dc = diff --cached

	# Log
	changelog = log origin..HEAD --format='* %s%n%w(,4,4)%+b'
	glg = log --oneline --decorate --all --graph

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
