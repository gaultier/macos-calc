#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate> {
  NSInteger sliderValue;
}

@property(weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSSlider *slider;
@property(weak) IBOutlet NSTextField *label;
@property (weak) IBOutlet NSButton *incrementButton;
@property (weak) IBOutlet NSButton *decrementButton;

- (IBAction)decrement:(id)sender;
- (IBAction)increment:(id)sender;
- (void)sliderValueChanged;
- (void)updateLabel;
@end
