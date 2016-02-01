//
//  JYZTextView.h
//  JYZTextView
//
//  Created by dbjyz on 16/2/1.
//  Copyright © 2016年 dbjyz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JYZTextView : UITextView

@property (nonatomic, strong) UILabel * placeHolderLabel;

@property (nonatomic, copy) NSString * placeholder;

@property (nonatomic, strong) UIColor * placeholderColor;


/**
 *  检测当输入时改变字体颜色
 *
 *  @param notification 监测
 */
- (void)textChanged:(NSNotification * )notification;
@end
