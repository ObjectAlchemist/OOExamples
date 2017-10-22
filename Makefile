primary: dependencies project build

project:
	phoenx project build

dependencies:
	carthage update

cleandependencies:
	rm -rf ./Carthage

clean:
	xcrun xcodebuild -alltargets clean

reallyclean:
	killall Xcode || echo ""
	xcrun -k
	xcrun xcodebuild -alltargets clean
	rm -rf "$(getconf DARWIN_USER_CACHE_DIR)/org.llvm.clang/ModuleCache"
	rm -rf "$(getconf DARWIN_USER_CACHE_DIR)/org.llvm.clang.$(whoami)/ModuleCache"
	rm -rf ~/Library/Developer/Xcode/DerivedData/*
	rm -rf ~/Library/Caches/com.apple.dt.Xcode/*

build: clean
	xcrun xcodebuild -scheme OOExamples -project OOExamples.xcodeproj -destination 'platform=iOS Simulator,OS=11.0,name=iPhone 7' build
