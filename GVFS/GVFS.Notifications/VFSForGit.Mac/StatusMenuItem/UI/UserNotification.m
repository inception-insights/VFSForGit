#import <Cocoa/Cocoa.h>
#import "UserNotification.h"

@interface UserNotification ()

@property (copy) NSString *title;
@property (copy) NSString *message;

@end

// Placholder class for actually displaying
// notifications.
// TODO : Hook this up with message listener
// to display notifications.
@implementation UserNotification

- (id) initWithInfo:(NSDictionary *) info
{
    if (self = [super init])
    {
        self.title = [info objectForKey:@"Title"];
        self.message = [info objectForKey:@"Message"];
    }
    
    return self;
}

- (void) display
{
    NSUserNotification *notification = [[NSUserNotification alloc] init];
    notification.title = self.title;
    notification.informativeText = self.message;
    notification.soundName = NSUserNotificationDefaultSoundName;
    
    [[NSUserNotificationCenter defaultUserNotificationCenter]
        deliverNotification:notification];
}

@end
