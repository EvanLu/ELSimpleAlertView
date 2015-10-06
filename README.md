## ELSimpleAlertView
Easy way to use UIAlertView/UIAlertController in appropriate iOS version

## Installation
```Objective-C
#import "ELSimpleAlertView.h"
```

## Usage - Show Default Alert View
```Objective-C
ELSimpleAlertView *alertView = [[ELSimpleAlertView alloc] init];
[alertView showAlertViewWithDefaultStyle:@"Hey there"
                                   title:@"Title"
                       cancelButtonTitle:@"Cancel"
                      confirmButtonTitle:@"Confirm"
              cancelButtonActionCallback:nil
             confirmButtonActionCallback:nil
                           blockArgument:nil];
```

Or see the "ViewController.m" for more example

## License
ELSimpleAlertView is available under the MIT license. See the LICENSE file for more info.
