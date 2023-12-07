install: install-git

install-git:
	m4 --define=xNAME="Dylan Pinn" git/config.m4 >> git/config
