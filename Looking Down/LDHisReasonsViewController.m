//
//  LDHisReasonsViewController.m
//  Looking Down
//
//  Created by Austin Feight on 1/9/14.
//  Copyright (c) 2014 Lost in Flight Studios. All rights reserved.
//

#import "LDHisReasonsViewController.h"
#import <Parse/Parse.h>
#import "MBProgressHUD.h"
#import "LDUtility.h"

static Cell *blankCell = nil;

@interface LDHisReasonsViewController ()

@end

@implementation LDHisReasonsViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [LDUtility initNav:self];
  
  [_reasonsTable setDataSource:self];
  [_reasonsTable setDelegate:self];
  [_reasonsTable setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
  [self loadReasons];
  
  _selectedCell = [[[NSBundle mainBundle] loadNibNamed:@"ExpandingCell" owner:self options:nil] objectAtIndex:0];
  blankCell = _selectedCell;
  [blankCell setIndex:-1];
  
  [self.tabBarController.view setBackgroundColor:[UIColor clearColor]];
}

- (IBAction)refresh:(id)sender {
  [self loadReasons];
}

#pragma mark - Table View Datasource

- (void)loadReasons {
  [self setReasons:[NSMutableArray arrayWithArray:@[@{@"text": @"Dummy data", @"longText": @"This is a lot of longer text to show the dynamically expanding cells. They're really cool."}, @{@"text": @"To fill", @"longText": @"This is less text for a different size."}, @{@"text": @"The rows", @"longText": @"This is less text for a different size."}, @{@"text": @"Dummy data", @"longText": @"This is less text for a different size."}, @{@"text": @"To fill", @"longText": @"This is less text for a different size."}, @{@"text": @"The rows", @"longText": @"This is less text for a different size."}, @{@"text": @"Dummy data", @"longText": @"This is less text for a different size."}, @{@"text": @"Dummy data", @"longText": @"This is less text for a different size."}]]];
}

- (void)setReasons:(NSMutableArray *)reasons {
  _reasons = reasons;
  [_reasonsTable reloadData];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [_reasons count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	if ([indexPath row] == [_selectedCell index]) {
		return [_selectedCell getHeight];
	}
	
	return [blankCell getHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  Cell *cell = [[[NSBundle mainBundle] loadNibNamed:@"ExpandingCell" owner:self options:nil] objectAtIndex:0];
  [cell setIndex:indexPath.row];
  [cell.cellTitle setText:[[_reasons objectAtIndex:indexPath.row] objectForKey:@"text"]];
  [cell.cellTitle setFont:[UIFont fontWithName:@"Helvetica" size:17]];
  [cell setDescription:[[_reasons objectAtIndex:indexPath.row] objectForKey:@"longText"]];
  
  [cell setBackgroundColor:[UIColor clearColor]];
  [cell setSelectionStyle:UITableViewCellSelectionStyleNone];

  return cell;
}

#pragma mark - Table View Delegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	Cell *cell = (Cell*)[tableView cellForRowAtIndexPath:indexPath];
	
	if(_selectedCell.index >= 0) {
		[_selectedCell contract];
	}
	
  if (_selectedCell.index != indexPath.row) {
    [cell expand];
    [self setSelectedCell:cell];
  } else {
    [_selectedCell setIndex:-1];
  }
  
	[tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
}

@end
