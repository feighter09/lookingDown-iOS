//
//  Cell.h
//  ExpandingCells
//
//  Created by work on 1/7/13.
//  Copyright (c) 2013 sbyrd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Cell : UITableViewCell

@property (nonatomic) NSInteger index;
@property (nonatomic) CGFloat height;

@property (nonatomic, strong)	IBOutlet UILabel *cellTitle;
@property (strong, nonatomic) IBOutlet UITextView *descriptionView;
@property (strong, nonatomic) NSString *description;

-(int)getHeight;
-(void)expand;
-(void)contract;

@end
