//
//  Cell.m
//  ExpandingCells
//
//  Created by work on 1/7/13.
//  Copyright (c) 2013 sbyrd. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(int)getHeight {
	return [self frame].size.height;
}

-(void)expand {
  CGRect oldFrame = [self frame];
  _height = _descriptionView.contentSize.height + 44;
  
  [self setFrame:CGRectMake(	oldFrame.origin.x,
                            oldFrame.origin.y,
                            oldFrame.size.width,
                            _height)];
}

-(void)contract {
	CGRect oldFrame = [self frame];
	_height = 44;
  
	[self setFrame:CGRectMake(  oldFrame.origin.x,
                            oldFrame.origin.y,
                            oldFrame.size.width,
                            _height)];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
	[super setSelected:selected animated:animated];
}

- (void)setDescription:(NSString *)description {
//  _description = description;
  [_descriptionView setText:description];
  [_descriptionView sizeToFit];
}

@end
