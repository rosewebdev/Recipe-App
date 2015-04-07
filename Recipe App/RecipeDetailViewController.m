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
    
    self.view.backgroundColor = [UIColor whiteColor];
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
    
    for (int i = 0; i < [RARecipes ingredientCountAtIndex:self.recipeIndex]; i++) {
        UILabel *volume = [[UILabel alloc]initWithFrame:CGRectMake(margin, top, (self.view.frame.size.width - 2 * margin) /4, 20)];
        volume.font = [UIFont boldSystemFontOfSize:17];
        volume.text = [RARecipes ingredientVolumeAtIndex:i inRecipeAtIndex:self.recipeIndex];
        [scrollView addSubview:volume];
        
        UILabel *type = [[UILabel alloc] initWithFrame:CGRectMake(margin + (self.view.frame.size.width - 2 * margin) / 4, top, (self.view.frame.size.width - 2 * margin) * 3 / 4, 20)];
        type.numberOfLines = 0;
        type.font = [UIFont systemFontOfSize:15];
        type.text = [RARecipes ingredientTypeAtIndex:i inRecipeAtIndex:self.recipeIndex];
        [scrollView addSubview:type];
        
        top += (20 + margin);
    }
    top += margin;
    
    UILabel *directionsTitle = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, self.view.frame.size.width - 2 * margin, 20)];
    directionsTitle.text = @"Directions";
    directionsTitle.font = [UIFont boldSystemFontOfSize:17];
    [scrollView addSubview:directionsTitle];
    
    top += 20 + margin;
    
    for (int i = 0; i < [[RARecipes directionsAtIndex:self.recipeIndex] count]; i++) {
        
        CGFloat height = [self heightForDirections:[RARecipes directionsAtIndex:self.recipeIndex][i]];
        
        UILabel *count = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, 30, 20)];
        count.font = [UIFont boldSystemFontOfSize:17];
        count.text = [NSString stringWithFormat:@"%d", i + 1];
        [scrollView addSubview:count];
        
        UILabel *direction = [[UILabel alloc] initWithFrame:CGRectMake(margin + 30, top, (self.view.frame.size.width - 2 * margin - 40), height)];
        direction.numberOfLines = 0;
        direction.text = [RARecipes directionsAtIndex:self.recipeIndex][i];
        
        [scrollView addSubview:direction];
        
        top += (height + margin);
        
    }
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, top + margin);
    
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

- (CGFloat)heightForDirections:(NSString *)description {
    
    CGRect bounding = [description boundingRectWithSize: CGSizeMake(self.view.frame.size.width - 2 * margin - 40, CGFLOAT_MAX)
                                                options: NSStringDrawingUsesLineFragmentOrigin
                                             attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:17]}
                                                context:nil];
    return bounding.size.height;
}

- (CGFloat)heightForDescription:(NSString *)description {
    CGRect bounding = [description boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 2 * margin, CGFLOAT_MAX)
                                                options:NSStringDrawingUsesLineFragmentOrigin
                                             attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:17]}
                                                context:nil];
    
    return bounding.size.height;
}

@end
