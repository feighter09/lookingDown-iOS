//
//  LDHerReasonsViewController.m
//  Looking Down
//
//  Created by Austin Feight on 1/10/14.
//  Copyright (c) 2014 Lost in Flight Studios. All rights reserved.
//

#import "LDHerReasonsViewController.h"

#import <Parse/Parse.h>
#import "MBProgressHUD.h"
#import "LDUtility.h"

static Cell *blankCell = nil;

@interface LDHerReasonsViewController ()

@end

@implementation LDHerReasonsViewController

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
}

- (IBAction)refresh:(id)sender {
  [self loadReasons];
}

#pragma mark - Table View Datasource

- (void)loadReasons {
  PFQuery *query = [PFQuery queryWithClassName:@"HerReason"];
  [MBProgressHUD showHUDAddedTo:self.view animated:YES];
  [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [self setReasons:[NSMutableArray arrayWithArray:objects]];
  }];
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
  
	[tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects: indexPath, nil] withRowAnimation:UITableViewRowAnimationMiddle];
}

@end
