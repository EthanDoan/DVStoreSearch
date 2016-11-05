//
//  SearchResultCell.h
//  StoreSearch
//
//  Created by Doan Phuong on 11/5/16.
//  Copyright © 2016 Phuong Doan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchResultCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *artistNameLabel;
@property (nonatomic, weak) IBOutlet UIImageView *artworkImageView;

@end
