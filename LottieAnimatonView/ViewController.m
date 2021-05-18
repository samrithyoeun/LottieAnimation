//
//  ViewController.m
//  LottieAnimatonView
//
//  Created by Samrith Yoeun on 7/5/21.
//

#import "ViewController.h"
#import <Lottie/Lottie.h>
#import "UIColor+ColorEx.h"

@interface ViewController () <UITextFieldDelegate>
@property (strong, nonatomic) UITextField *textField;
@property (strong, nonatomic) UIButton *button;
@property (strong, nonatomic) LOTAnimationView *animationView;

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  
  self.view.backgroundColor = [UIColor colorWithHex:0x17B3D6 alpha:1];
  
  UITextField *textField = [UITextField new];
  
  UIColor *color = [UIColor whiteColor];
  textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"paste the URL then click APPLY to preview animation" attributes:@{NSForegroundColorAttributeName: color}];
                                                                                                                
  textField.font = [UIFont systemFontOfSize:13];
  UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, textField.frame.size.height)];
  leftView.backgroundColor = textField.backgroundColor;
  textField.leftView = leftView;
  textField.leftViewMode = UITextFieldViewModeAlways;
  
  [self.view addSubview:textField];
  
  textField.translatesAutoresizingMaskIntoConstraints = NO;
  [textField.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-10].active = YES;
  [textField.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant: 10].active = YES;
  [textField.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant: 10].active = YES;
  [textField.heightAnchor constraintEqualToConstant:40].active = YES;
  
  textField.delegate = self;
  textField.borderStyle = UITextBorderStyleLine;
  textField.textColor = UIColor.whiteColor;
  
  self.textField = textField;
  
  UIButton *button = [UIButton new];
  [self.view addSubview:button];
  
  button.translatesAutoresizingMaskIntoConstraints = NO;
  [button.trailingAnchor constraintEqualToAnchor:self.textField.trailingAnchor].active = YES;
  [button.topAnchor constraintEqualToAnchor:self.textField.bottomAnchor constant:10].active = YES;
  [button.heightAnchor constraintEqualToConstant:35].active = YES;
  [button.widthAnchor constraintEqualToConstant:80].active = YES;
  
  
  
  button.backgroundColor = UIColor.redColor;
  button.titleLabel.font = [UIFont systemFontOfSize:12];
  [button addTarget:self action:@selector(buttonDidTapped) forControlEvents:UIControlEventTouchUpInside];
  [button setTitle:@"APPLY" forState:UIControlStateNormal];
  button.layer.cornerRadius = 5;
  self.button = button;
    
}

-(void)buttonDidTapped {
  [self.textField resignFirstResponder];
  [self.animationView removeFromSuperview];
  
  LOTAnimationView *animationView = [[LOTAnimationView alloc]initWithContentsOfURL:[[NSURL alloc]initWithString: self.textField.text]];
  animationView.frame = self.view.bounds;
  animationView.contentMode = UIViewContentModeScaleAspectFit;
  
  [self.view addSubview:animationView];
  self.animationView = animationView;
  [self.animationView setLoopAnimation:YES];
  [self.animationView play];
  
  [self.view bringSubviewToFront:self.textField];
  [self.view bringSubviewToFront:self.button];
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
  textField.text = @"";
  return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
  [self buttonDidTapped];
  return YES;
}


@end

