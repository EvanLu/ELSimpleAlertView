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

/**
 *  show default alert view with cancel/confirm buttons
 *
 *  @param promptMessage:      messages that you'd like to display
 *  @param title:              title of alert view
 *  @param cancelButtonTitle:  title of cancel button
 *  @param confirmButtonTitle: title of confirm button
 *  @param cancelButtonBlock:  pass a block to function if you need to do something after cancel button pressed, could be nil.
 *  @param confirmButtonBlock: pass a block to function if you need to do something after confirm button pressed, could be nil.
 *  @param blockArgument       pass the parameter that used in callback function, could be nil.
 */
-(void)showAlertViewWithDefaultStyle:(NSString *)promptMessage
                               title:(NSString *)title
                   cancelButtonTitle:(NSString *)cancelButtonTitle
                  confirmButtonTitle:(NSString *)confirmButtonTitle
          cancelButtonActionCallback:(actionBlock)cancelButtonBlock
         confirmButtonActionCallback:(actionBlock)confirmButtonBlock
                       blockArgument:(id)blockArgument;


/**
 *  show default alert view with only cancel button
 *
 *  @param promptMessage:      messages that you want to display
 *  @param title:              title of alert view
 *  @param confirmButtonTitle: title of confirm button
 *  @param confirmButtonBlock: pass a block to function if you need to do something after cancel button pressed, could be nil.
 *  @param argument            pass the parameter that used in callback function, could be nil.
 */
-(void)showAlertViewDefaultStyleOnlyCancelButton:(NSString *)promptMessage
                                           title:(NSString *)title
                               cancelButtonTitle:(NSString *)cancelButtonTitle
                      cancelButtonActionCallback:(actionBlock)cancelButtonBlock
                                   blockArgument:(id)blockArgument;
@end
