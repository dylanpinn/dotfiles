[alias]
	# Add
	aa = add --all
	ap = add --patch

	# Checkout
	cleanup-merged = "!f(){ git fetch && git branch --merged | grep -v '* ' | xargs git branch --delete; };f"
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
	glg = log --oneline --decorate --all --graph --abbrev-commit

	# Pull
	refresh = "!f(){ git fetch && git stash && git rebase $(git symbolic-ref refs/remotes/origin/HEAD | sed \"s@^refs/remotes/@@\") && git stash pop; };f"

	# Push
	pf = push --force-with-lease

	# Review
	files = !git diff --name-only $(git merge-base HEAD $(git symbolic-ref refs/remotes/origin/HEAD))
	stats = !git diff --stat $(git merge-base HEAD $(git symbolic-ref refs/remotes/origin/HEAD))

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
