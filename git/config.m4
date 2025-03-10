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

	# Difftastic aliases, so `git dlog` is `git log` with difftastic and so on.
	dlog = -c diff.external=difft log --ext-diff
	dshow = -c diff.external=difft show --ext-diff
	ddiff = -c diff.external=difft diff

	# Log
	changelog = log --reverse origin..HEAD --format='* %s%n%w(,4,4)%+b'
	glg = log --oneline --decorate --all --graph --abbrev-commit

	# Push
	pf = push --force-with-lease

	# Status
	st = status
[commit]
	gpgsign = true
[core]
	hooksPath = ~/.config/git/hooks
[gpg]
	format = ssh
[gpg "ssh"]
	program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign"
[user]
	signingkey = SIGNING_KEY
	email = EMAIL
	name = NAME
