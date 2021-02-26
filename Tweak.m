#import <Foundation/Foundation.h>
#import <substrate.h>

static void blah(NSObject *self, SEL _cmd) {
}

__attribute__((constructor)) static void loadTweak(int __unused argc, char __unused **argv, char __unused **envp) {
    // When selector is NULL and pointer to place orig is NULL, substitute 2.0.8 crashes
    // EXC_BAD_ACCESS (SIGSEGV)
    MSHookMessageEx([NSObject class], @selector(doesNotExist), (IMP)&blah, NULL);
}
