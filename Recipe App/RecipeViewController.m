//
//  RecipeViewController.m
//  Recipe App
//
//  Created by Jason Kupiec on 4/6/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RecipeViewController.h"
#import "RecipesTableViewDatasource.h"
#import "RARecipes.h"
#import "RecipeDetailViewController.h"

@interface RecipeViewController () <UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) RecipesTableViewDataSource *dataSource;

@end

@implementation RecipeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"All-Time Best Recipes";
    
    self.dataSource = [RecipesTableViewDataSource new];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    [self.dataSource registerTableView:self.tableView];
    self.tableView.dataSource = self.dataSource;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [self.dataSource heightForIndexPath:indexPath];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    RecipeDetailViewController *viewController = [RecipeDetailViewController new];
    viewController.recipeIndex = indexPath.row;
    [self.navigationController pushViewController:viewController animated:YES];
    
}

@end
