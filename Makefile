compile:
	cd playground && flutter build web --no-tree-shake-icons

deploy:
	cd playground && firebase deploy

compile_and_deploy:	compile deploy

build_brick:
	dart run tool/generator/main.dart