//
//  ViewController.m
//  JYZTextView
//
//  Created by dbjyz on 16/2/1.
//  Copyright © 2016年 dbjyz. All rights reserved.
//

#import "ViewController.h"
#import "JYZTextView.h"
#define kTextBorderColor     RGBCOLOR(227,224,216)

#undef  RGBCOLOR
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

@interface ViewController ()<UITextViewDelegate>
@property(strong, nonatomic)JYZTextView * textView;
@property(strong, nonatomic)UILabel * numLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _textView = [[JYZTextView alloc]initWithFrame:CGRectMake(30, 100, self.view.frame.size.width - 60, 100)];
    _textView.backgroundColor = [UIColor whiteColor];
    _textView.delegate = self;
    _textView.font = [UIFont systemFontOfSize:14.f];
    _textView.textColor = [UIColor blackColor];
    _textView.textAlignment = NSTextAlignmentLeft;
    _textView.placeholder = @"请输入大于10少于300百字的评价";
    [self.view addSubview:_textView];
    
    
    _numLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_textView.frame)-90, CGRectGetMaxY(_textView.frame)+6, 80, 21)];
    _numLabel.textAlignment = NSTextAlignmentRight;
    _numLabel.text = @"300";
    _numLabel.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_numLabel];
    
}

#pragma mark textField的字数限制

//在这个地方计算输入的字数
- (void)textViewDidChange:(UITextView *)textView
{
    NSInteger wordCount = textView.text.length;
    self.numLabel.text = [NSString stringWithFormat:@"%ld/300",(long)wordCount];
    [self wordLimit:textView];
}

#pragma mark 超过300字不能输入
-(BOOL)wordLimit:(UITextView *)text{
    if (text.text.length < 300) {
        NSLog(@"%ld",text.text.length);
        self.textView.editable = YES;
    }
    else{
        self.textView.editable = NO;
        
    }
    return nil;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
