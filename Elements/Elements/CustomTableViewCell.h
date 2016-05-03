//
//  customCell.h
//  Elements
//
//  Created by Mulkey, Rodrigo S. on 5/3/16.
//  Copyright © 2016 Mulkey, Rodrigo S. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *itemTitleLabel;
@property (nonatomic, strong) IBOutlet UILabel *itemDescriptionLabel;
@property (nonatomic, strong) IBOutlet UIImageView *itemImageView;

@end
