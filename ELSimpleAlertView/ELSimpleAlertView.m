//
//  ELSimpleAlertView.m
//  UnitTestProject
//
//  Created by LuEvan on 2015/8/5.
//  Copyright © 2015年 LuEvan. All rights reserved.
//

#import "ELSimpleAlertView.h"

@interface ELSimpleAlertView ()

@property (copy) actionBlock cancelButtonActionBlock;
@property (copy) actionBlock confirmButtonActionBlock;
@property id blockArgument;

@end

@implementation ELSimpleAlertView

-(id)init{
    self = [super init];
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//----------------------------------------------------
#pragma mark handler
//----------------------------------------------------
#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
-(void)showAlertViewWithDefaultStyle:(NSString *)promptMessage
                               title:(NSString *)title
                   cancelButtonTitle:(NSString *)cancelButtonTitle
                  confirmButtonTitle:(NSString *)confirmButtonTitle
          cancelButtonActionCallback:(actionBlock)cancelButtonBlock
         confirmButtonActionCallback:(actionBlock)confirmButtonBlock
                       blockArgument:(id)blockArgument;
{
    if (object_getClassName(@"UIAlertController") != nil) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                                 message:promptMessage preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action)
        {
            if (cancelButtonBlock) cancelButtonBlock(blockArgument);
        }];
        
        UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:confirmButtonTitle
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction *action)
        {
            if (confirmButtonBlock) confirmButtonBlock(blockArgument);
            
        }];
        
        [alertController addAction:cancelAction];
        [alertController addAction:confirmAction];
        
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController
                                                                                    animated:YES completion:nil];
    }
    else {
        _cancelButtonActionBlock = confirmButtonBlock;
        _confirmButtonActionBlock = confirmButtonBlock;
        _blockArgument = blockArgument;
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                            message:promptMessage
                                                           delegate:self
                                                  cancelButtonTitle:cancelButtonTitle
                                                  otherButtonTitles:confirmButtonTitle, nil];
        
        alertView.alertViewStyle = UIAlertControllerStyleActionSheet;
        [alertView show];
    }
}

-(void)showAlertViewDefaultStyleOnlyCancelButton:(NSString *)promptMessage
                                           title:(NSString *)title
                               cancelButtonTitle:(NSString *)cancelButtonTitle
                      cancelButtonActionCallback:(actionBlock)cancelButtonBlock
                                   blockArgument:(id)blockArgument;
{
    if (object_getClassName(@"UIAlertController") != nil) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                                 message:promptMessage preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:cancelButtonTitle
                                                                style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction *action)
                                        {
                                            if (cancelButtonBlock) cancelButtonBlock(blockArgument);
                                            
                                        }];
        
        [alertController addAction:confirmAction];
        
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController
                                                                                     animated:YES completion:nil];
    }
    else {
        _cancelButtonActionBlock = cancelButtonBlock;
        _blockArgument = blockArgument;
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                            message:promptMessage
                                                           delegate:self
                                                  cancelButtonTitle:cancelButtonTitle
                                                  otherButtonTitles:nil];
        
        alertView.alertViewStyle = UIAlertControllerStyleActionSheet;
        [alertView show];
    }
}

#pragma GCC diagnostic pop
//----------------------------------------------------
#pragma mark alert view delegate
//----------------------------------------------------

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == [alertView cancelButtonIndex])
    {
        if(_cancelButtonActionBlock) _cancelButtonActionBlock(_blockArgument);
    }
    else
    {
        if(_confirmButtonActionBlock) _confirmButtonActionBlock(_blockArgument);
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
