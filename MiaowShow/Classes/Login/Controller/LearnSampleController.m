//
//  ALin.m
//  MiaowShow
//
//  Created by bluePanda on 17/2/10.
//  Copyright © 2017年 ALin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LearnSampleController.h"
#import "MainViewController.h"
#import "TabBarItem1.h"
#import "TabBarItem2.h"
#import "TabBarItem3.h"
#import "TabBarItem4.h"


@interface LearnSampleController()<UITabBarControllerDelegate>


@end

@implementation LearnSampleController

- (void)viewDidLoad
{
    NSLog(@"view did load ........");
    [super viewDidLoad];
    
    
    self.delegate = self;
    
    [self addChildViewController:[[TabBarItem1 alloc] init] imageNamed:@"toolbar_home"];
    [self addChildViewController:[[TabBarItem2 alloc] init] imageNamed:@"toolbar_me"];
    [self addChildViewController:[[TabBarItem3 alloc] init] imageNamed:@"toolbar_home"];
    [self addChildViewController:[[TabBarItem4 alloc] init] imageNamed:@"toolbar_me"];
    

    //[self createTabbar];
    
    //[self createNavigation];
    
}

- (void)addChildViewController:(UIViewController *)childController imageNamed:(NSString *)imageName
{
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childController];
    childController.tabBarItem.image = [UIImage imageNamed:imageName];
    childController.tabBarItem.selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_sel", imageName]];
    // 设置图片居中, 这儿需要注意top和bottom必须绝对值一样大
    childController.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    // 设置导航栏为透明的
    //    if ([childController isKindOfClass:[ProfileController class]]) {
    //        [nav.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    //        nav.navigationBar.shadowImage = [[UIImage alloc] init];
    //        nav.navigationBar.translucent = YES;
    //    }
    [self addChildViewController:nav];
}







#pragma mark - UITabbarDelegate

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    NSLog(@"do select tabBar index");
}


@end
