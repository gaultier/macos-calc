#import "AppDelegate.h"

@implementation AppDelegate

- (void)awakeFromNib {
  sliderValue = 50;

  // Programmatically set two way binding between NSSlider value and
  // delegate sliderValue variable
  [_slider bind:@"value"
         toObject:self
      withKeyPath:@"sliderValue"
          options:@{
            @"NSContinuouslyUpdatesValue" : @YES,
            @"NSAllowsEditingMultipleValuesSelectionBindingOption" : @YES,
            @"NSConditionallySetsEditableBindingOption" : @YES,
            @"NSRaisesForNotApplicableKeysBindingOption" : @YES
          }];

  [self bind:@"sliderValue"
         toObject:_slider
      withKeyPath:@"value"
          options:@{
            @"NSContinuouslyUpdatesValue" : @YES,
            @"NSAllowsEditingMultipleValuesSelectionBindingOption" : @YES,
            @"NSConditionallySetsEditableBindingOption" : @YES,
            @"NSRaisesForNotApplicableKeysBindingOption" : @YES
          }];

  // Programmatically set action method for NSSlider
  [_slider setTarget:self];
  [_slider setAction:@selector(sliderValueChanged)];
}

#pragma mark Action methods

- (IBAction)increment:(id)sender {
  if (sliderValue == 100) {
    return;
  }

  // When changing variable directly explicitly
  // trigger the notification to the observers
  [self willChangeValueForKey:@"sliderValue"];
  sliderValue+=10;
  [self didChangeValueForKey:@"sliderValue"];

  [self updateLabel];
}

- (IBAction)decrement:(id)sender {
  if (sliderValue == 0) {
    return;
  }

  // When changing variable directly explicitly
  // trigger the notification to the observers
  [self willChangeValueForKey:@"sliderValue"];
  sliderValue--;
  [self didChangeValueForKey:@"sliderValue"];

  [self updateLabel];
}

- (void)sliderValueChanged {
  [self updateLabel];
}

- (void)updateLabel {
  [_label setStringValue:[NSString stringWithFormat:@"[%d]", (int)sliderValue]];
}

@end
