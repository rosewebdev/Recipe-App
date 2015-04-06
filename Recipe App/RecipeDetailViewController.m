//
//  RecipeDetailViewController.m
//  Recipe App
//
//  Created by Jason Kupiec on 4/6/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RecipeDetailViewController.h"
#import "RARecipes.h"

static CGFloat margin = 15;

@interface RecipeDetailViewController ()

@end

@implementation RecipeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = [RARecipes titleAtIndex:self.recipeIndex];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:scrollView];
    
    CGFloat topMargin = 20;
    CGFloat heightForDescription = [self heightForDescription:[RARecipes descriptionAtIndex:self.recipeIndex]];
    
    UILabel *description = [[UILabel alloc] initWithFrame:CGRectMake(margin, topMargin, self.view.frame.size.width - 2 * margin, heightForDescription)];
    description.text = [RARecipes descriptionAtIndex:self.recipeIndex];
    description.numberOfLines = 0;
    [scrollView addSubview:description];
    
    CGFloat top = topMargin + heightForDescription + margin * 2;
    
    UILabel *ingredientsTitle = [[UILabel alloc]initWithFrame:CGRectMake(margin, top, self.view.frame.size.width - 2 * margin, 20)];
    ingredientsTitle.text = @"Ingredients";
    ingredientsTitle.font = [UIFont boldSystemFontOfSize:17];
    [scrollView addSubview:ingredientsTitle];
    
    top += 20 + margin;
    
    UILabel *directionsTitle = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, self.view.frame.size.width - 2 * margin, 20)];
    directionsTitle.text = @"Directions";
    directionsTitle.font = [UIFont boldSystemFontOfSize:17];
    [scrollView addSubview:directionsTitle];
    
    top += 20 + margin;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (CGFloat)heightForDescription:(NSString *)description {
    CGRect bounding = [description boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 2 * margin, CGFLOAT_MAX)
                                                options:NSStringDrawingUsesLineFragmentOrigin
                                             attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:17]}
                                                context:nil];
    
    return bounding.size.height;
}

@end
