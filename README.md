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


## Screenshot
<img src="https://cloud.githubusercontent.com/assets/1875330/10304665/1f253256-6c4e-11e5-9555-5bbb1e275dd4.png" width="250" height="159" />
<img src="https://cloud.githubusercontent.com/assets/1875330/10304666/1f26835e-6c4e-11e5-8815-838c5f07e049.png" width="250" height="159" />


## License
ELSimpleAlertView is available under the MIT license. See the LICENSE file for more info.
