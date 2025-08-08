compile:
	cd playground && flutter build web --no-tree-shake-icons

deploy:
	cd playground && firebase deploy

compile_and_deploy:	compile deploy

widgetbook:
	cd app && flutter run -d chrome

run_playground:
	cd playground && flutter run -d chrome
