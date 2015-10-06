//
//  ELSimpleAlertView.h
//  UnitTestProject
//
//  Created by LuEvan on 2015/8/5.
//  Copyright © 2015年 LuEvan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ actionBlock)(id);

@interface ELSimpleAlertView : UIViewController <UIAlertViewDelegate>

-(void)showAlertViewWithDefaultStyle:(NSString *)promptMessage
                               title:(NSString *)title
                   cancelButtonTitle:(NSString *)cancelButtonTitle
                  confirmButtonTitle:(NSString *)confirmButtonTitle
          cancelButtonActionCallback:(actionBlock)cancelButtonBlock
         confirmButtonActionCallback:(actionBlock)confirmButtonBlock
                       blockArgument:(id)blockArgument;

-(void)showAlertViewDefaultStyleOnlyCancelButton:(NSString *)promptMessage
                                           title:(NSString *)title
                               cancelButtonTitle:(NSString *)cancelButtonTitle
                      cancelButtonActionCallback:(actionBlock)cancelButtonBlock
                                   blockArgument:(id)blockArgument;
@end
