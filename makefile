PACKAGES := $(wildcard packages/*)
FEATURES := $(wildcard packages/features/*)

clean:
	flutter clean
	for package in $(PACKAGES); do \
		cd $${package}; \
		flutter clean; \
		cd ../../; \
	done

	for feature in $(FEATURES); do \
		cd $${feature}; \
		flutter clean; \
		cd ../../../; \
	done

get:
	flutter pub get
	for package in $(PACKAGES); do \
		cd $${package}; \
		flutter pub get; \
		cd ../../; \
	done

	for feature in $(FEATURES); do \
		cd $${feature}; \
		flutter pub get; \
	done