//
//  RecipesTableViewDataSource.m
//  Recipe App
//
//  Created by Jason Kupiec on 4/6/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RecipesTableViewDataSource.h"
#import "RARecipes.h"

static NSString * const cellIdentifier = @"identifier";

@implementation RecipesTableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [RARecipes count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.textLabel.text = [RARecipes titleAtIndex:indexPath.row];
    
    return cell;
}




@end
