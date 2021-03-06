//
//  LDHisReasonsViewController.h
//  Looking Down
//
//  Created by Austin Feight on 1/9/14.
//  Copyright (c) 2014 Lost in Flight Studios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cell.h"

@interface LDHisReasonsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *reasonsTable;
@property (strong, nonatomic) NSMutableArray *reasons;
@property (strong, nonatomic) Cell *selectedCell;

- (IBAction)refresh:(id)sender;

@end
