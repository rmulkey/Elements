//
//  ViewController.m
//  Elements
//
//  Created by Mulkey, Rodrigo S. on 5/3/16.
//  Copyright © 2016 Mulkey, Rodrigo S. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


#pragma mark - TableView Delegates

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Create and reuse cell
    
    static NSString *CellIdentifier = @"customCell";
    
    CustomTableViewCell *cell = [tableView
                         dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[CustomTableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier];
    }
    
    //Populating cell
    
    cell.itemTitleLabel.text = @"Test";
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.0f;
}

// Adding a tableView Header

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 55.0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 25, self.itemsTableView.bounds.size.width, 20)];
    
    label.backgroundColor = [UIColor clearColor];
    label.font = [label.font fontWithSize:15];
    label.text = @"List of Items";
    label.textAlignment = NSTextAlignmentCenter;
    
    UIView *sectionHeader = [[UIView alloc] init];
    sectionHeader.backgroundColor = [UIColor lightGrayColor];
    [sectionHeader addSubview:label];
    
    return sectionHeader;
    
}

@end
