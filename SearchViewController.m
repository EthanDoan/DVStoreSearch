//
//  SearchViewController.m
//  StoreSearch
//
//  Created by Doan Phuong on 11/5/16.
//  Copyright © 2016 Phuong Doan. All rights reserved.
//

#import "SearchViewController.h"

#import "SearchResult.h"
#import "SearchResultCell.h"

static NSString * const SearchResultCellIdentifier = @"SearchResultCell";
static NSString * const NothingFoundCellIdentifier = @"NothingFoundCell";

@interface SearchViewController () <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>
{
    NSMutableArray *_searchResults;


}

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    
    [self.searchBar becomeFirstResponder];
    
    /*
     The UINib class is used to load nibs. Here you tell it to load the nib you just created (note that you don’t specify the .xib file extension). Then you ask the table view to register this nib for the reuse identifier “SearchResultCell”.
     */
    UINib *cellNib = [UINib nibWithNibName:SearchResultCellIdentifier bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:SearchResultCellIdentifier];
    
    self.tableView.rowHeight = 80;
    
    cellNib = [UINib nibWithNibName:NothingFoundCellIdentifier bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:NothingFoundCellIdentifier];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_searchResults == nil) {
        return 0;
    } else if ([_searchResults count] == 0) {
        return 1;
    } else {
        return [_searchResults count];
    
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
    SearchResultCell *cell = (SearchResultCell *)[tableView dequeueReusableCellWithIdentifier:SearchResultCellIdentifier];
    
    if ([_searchResults count] == 0) {
        return [tableView dequeueReusableCellWithIdentifier: NothingFoundCellIdentifier forIndexPath:indexPath];
    } else {
        SearchResultCell *cell = (SearchResultCell *)[tableView dequeueReusableCellWithIdentifier:SearchResultCellIdentifier forIndexPath:indexPath];
        
        SearchResult *searchResult = _searchResults[indexPath.row];
        cell.nameLabel.text = searchResult.name;
        cell.artistNameLabel.text = searchResult.artistName;
        
        return cell;
        
    }
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([_searchResults count] == 0) {
        return nil;
    } else {
        return indexPath;
    }
}


#pragma mark - UISearchBarDelegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [_searchBar resignFirstResponder];
    
    _searchResults = [NSMutableArray arrayWithCapacity:10];
    
    if (![searchBar.text isEqualToString:@"Justin bieber"]) {
        for (int i = 0; i < 3; i++) {
            SearchResult *searchResult = [[SearchResult alloc] init];
            searchResult.name = [NSString stringWithFormat:@"Fake Result %d for", i];
            searchResult.artistName = searchBar.text;
            
            [_searchResults addObject:searchResult];
        }
    }
    
    
    [_tableView reloadData];
    
    
}

//searchBar delegate -> search bar is attached on top of the screen
- (UIBarPosition)positionForBar:(id<UIBarPositioning>)bar {
    return  UIBarPositionTopAttached;
}











@end
