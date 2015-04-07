//
//  RecipesTableViewDataSource.h
//  Recipe App
//
//  Created by Jason Kupiec on 4/6/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecipesTableViewDataSource : NSObject <UITableViewDataSource>

- (void)registerTableView:(UITableView *)tableView;

-(CGFloat)heightForIndexPath:(NSIndexPath *)indexPath;

@end
