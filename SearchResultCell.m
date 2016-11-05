//
//  SearchResultCell.m
//  StoreSearch
//
//  Created by Doan Phuong on 11/5/16.
//  Copyright © 2016 Phuong Doan. All rights reserved.
//

#import "SearchResultCell.h"

@implementation SearchResultCell


//The awakeFromNib method is called immediately after this cell object has been loaded from the nib.
- (void)awakeFromNib {
    [super awakeFromNib];
    
    
    //That’s very easy to do because all table view cells have a selectedBackgroundView property. The view from that property is placed on top of the cell’s background, but below the other content, when the cell is selected.
    UIView *selectedView = [[UIView alloc] initWithFrame:CGRectZero];
    selectedView.backgroundColor = [UIColor colorWithRed:20/255.0f green:160/255.0f blue:160/255.0f alpha:0.5f];
    self.selectedBackgroundView = selectedView;
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
