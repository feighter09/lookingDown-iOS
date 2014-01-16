//
//  LDUtility.m
//  Looking Down
//
//  Created by Austin Feight on 1/15/14.
//  Copyright (c) 2014 Lost in Flight Studios. All rights reserved.
//

#import "LDUtility.h"

@implementation LDUtility

+ (void)initNav:(UIViewController *)SELF {
  UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
  [titleView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"titleBar.png"]]];
  [SELF.navigationItem setTitleView:titleView];
}

@end
