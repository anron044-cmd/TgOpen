#import <UIKit/UIKit.h>

static const BOOL kEveryLaunch = YES;

__attribute__((constructor))
static void openChannel(void) {
    NSUserDefaults *d = [NSUserDefaults standardUserDefaults];
    if (!kEveryLaunch) {
        if ([d boolForKey:@"tgShown"]) return;
        [d setBool:YES forKey:@"tgShown"];
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)),
                   dispatch_get_main_queue(), ^{
        NSURL *u = [NSURL URLWithString:@"https://t.me/Artem21FF"];
        [[UIApplication sharedApplication] openURL:u options:@{} completionHandler:nil];
    });
}
