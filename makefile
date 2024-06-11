#Makefile

ios_release_store:
	@echo "Use XCode!!!"

android_apk_dev:
	fvm flutter build apk --flavor dev -t lib/main_dev.dart

android_aab_prod:
	fvm flutter build appbundle --flavor prod -t lib/main_prod.dart

android_apk_prod:
	fvm flutter build apk --flavor prod -t lib/main_prod.dart

generate_app_icons:
	fvm flutter pub run flutter_launcher_icons:main

generate_flavors:
	fvm flutter pub run flutter_flavorizr

#generate_hive_models:
#	@echo "type `fvm flutter packages pub run build_runner build`"

# generate_splash:
# 	fvm flutter pub run flutter_native_splash:create

ios_clean_up:
	rm -rf ios/Pods && rm -rf ios/Podfile.lock; fvm flutter pub get; cd ios && pod install --repo-update && cd ..

fpg:
	fvm flutter pub get

format:
	 dart fix --apply && dart format .

#clean_up_gradle_cache:
 	# ./gradlew --stop; rm -rf ~/.gradle/caches/

# isar_build:
# 	fvm flutter pub run build_runner build