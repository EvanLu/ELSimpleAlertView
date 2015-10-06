//
//  ViewController.m
//  ELSimpleAlertView
//
//  Created by LuEvan on 2015/8/5.
//  Copyright © 2015年 EvanLu. All rights reserved.
//

#import "ViewController.h"
#import "ELSimpleAlertView.h"

@interface ViewController ()

@property ELSimpleAlertView *alertView;
@property UIButton *button1;
@property UIButton *button2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //init ELSimpleAlertView
    _alertView = [[ELSimpleAlertView alloc] init];
    
    // create buttons programmatically
    _button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    [_button1 addTarget:self
               action:@selector(showAlertView)
     forControlEvents:UIControlEventTouchUpInside];
    [_button1 setTitle:@"Show Alert View 1" forState:UIControlStateNormal];
    _button1.frame = CGRectMake(0, 0, 250, 50.0);
    _button1.center = self.view.center;
    [self.view addSubview:_button1];
    
    _button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    [_button2 addTarget:self
               action:@selector(showAlertViewOnlyConfirmButton)
     forControlEvents:UIControlEventTouchUpInside];
    [_button2 setTitle:@"Show Alert View 2" forState:UIControlStateNormal];
    _button2.frame = CGRectMake(_button1.frame.origin.x, _button1.frame.origin.y + 70, 250, 50);
    [self.view addSubview:_button2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showAlertView{
    //callback function which changes title of button1 after confirm button pressed
    void (^myblockToChangeButtonTitle)(UIButton*) = ^void(UIButton *button){
        [button setTitle:@"Title changed" forState:UIControlStateNormal];
    };
    [_alertView showAlertViewWithDefaultStyle:@"Hey there"
                                        title:@"Title"
                            cancelButtonTitle:@"Cancel"
                           confirmButtonTitle:@"Confirm"
                   cancelButtonActionCallback:nil
                  confirmButtonActionCallback:myblockToChangeButtonTitle
                                blockArgument:_button1];
}

-(void)showAlertViewOnlyConfirmButton{
    void (^myblockToChangeButtonTitle)(UIButton*) = ^void(UIButton *button){
        [button setTitle:@"Title changed" forState:UIControlStateNormal];
    };
    [_alertView showAlertViewDefaultStyleOnlyCancelButton:@"Hey there"
                                                    title:@"Title"
                                        cancelButtonTitle:@"OK"
                               cancelButtonActionCallback:myblockToChangeButtonTitle
                                            blockArgument:_button2];

}

@end
