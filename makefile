# Var
github_account = YoanRenard-awin

install_project_darwin:
	git clone git@github.com:$(github_account)/awin-darwin.git sites/darwin.affiliatewindow.com
	cd sites/darwin.affiliatewindow.com; composer install

install_project_services:
	git clone git@github.com:$(github_account)/awin-services.git sites/awin-services
	cd sites/awin-services composer install

install_project_localization:
	git clone git@github.com:$(github_account)/awin-localization.git sites/localization

install_project_images:
	git clone git@github.com:$(github_account)/awin-images.git sites/images

install_project_site2:
	git clone git@github.com:$(github_account)/awin-site2.git sites/site2

install_projects: install_project_darwin install_project_services install_project_localization install_project_images install_project_site2
	install_project_darwin
	install_project_services
	install_project_localization
	install_project_images
	install_project_site2

reset_projects: install_projects
	rm -fr sites/*
	install_projects

install_roles:
	ansible-galaxy install elao.mysql-server -p provisioning/roles

install_requirements: install_roles install_projects
	install_roles
	install_projects
