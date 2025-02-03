debug:
ifeq ($(OS),Windows_NT)
	cd src-tauri/lovely-injector/crates/lovely-win && cargo build --release && cd $(CURDIR) && cargo tauri dev
else
	clear
	RUST_LOG=debug cd src-tauri/lovely-injector/crates/lovely-mac && rm -f ../../target/release/liblovely.d* && SKIP_BUILD_SCRIPT=1 cargo build --release && cd $(CURDIR) && cargo tauri dev
endif

release:
ifeq ($(OS),Windows_NT)
	cd src-tauri/lovely-injector/crates/lovely-win && set SKIP_BUILD_SCRIPT=1 && cargo build --release && cd $(CURDIR) && cargo tauri build
else
	clear
	cd src-tauri/lovely-injector/crates/lovely-mac && rm -f ../../target/release/liblovely.d* && SKIP_BUILD_SCRIPT=1 MACOSX_DEPLOYMENT_TARGET=11.0 cargo build --release && cd $(CURDIR) && cargo tauri build --verbose
	# cd src-tauri/lovely-injector/crates/lovely-mac && rm -f ../../target/release/liblovely.d* && cd $(CURDIR) && cargo tauri build --verbose
endif

clean:
	cd ./src-tauri && cargo clean
ifeq ($(OS),Windows_NT)
	cd ./src-tauri/lovely-injector/crates/lovely-win && cargo clean
else
	cd ./src-tauri/lovely-injector/crates/lovely-mac && cargo clean
endif
