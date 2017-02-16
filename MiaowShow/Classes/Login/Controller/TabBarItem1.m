//
//  ALin.m
//  MiaowShow
//
//  Created by bluePanda on 17/2/10.
//  Copyright © 2017年 ALin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TabBarItem1.h"
#import "RNFrostedSidebar.h"
#import "MainViewController.h"


@interface TabBarItem1()<RNFrostedSidebarDelegate>


@end

@implementation TabBarItem1



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *bgImage = [UIImage imageNamed:@"card_bg_big_57"];
    UIImageView* imgView = [[UIImageView alloc] initWithImage:bgImage];
    [self.view addSubview:imgView];
    [imgView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        //make.center.equalTo(self.view);
    }];
    
    [self createNavigation];
    
}


-(void) createNavigation{
    CGRect screenSize = [UIScreen mainScreen].bounds;
    //创建一个导航栏
    //UINavigationBar *navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, screenSize.size.width, 60)];
    
    self.navigationController.navigationBar.backgroundColor = [UIColor greenColor];
    
    //创建一个导航栏集合
    //UINavigationItem *navigationItem = [[UINavigationItem alloc] initWithTitle:nil];
    
    //向导航栏集合中添加横向按钮列表
    NSArray *buttons = [NSArray arrayWithObjects:@"哈哈", @"呵呵", @"嘿嘿", @"咳咳", nil];
    UISegmentedControl* segmentedControl = [[UISegmentedControl alloc] initWithItems:buttons];
    
    //设置横向按钮风格
    segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
    
    //添加按钮响应事件
    [segmentedControl addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventValueChanged];
    
    //把导航栏集合添加入导航栏中，设置动画关闭
    //[self.navigationController.navigationBar pushNavigationItem:navigationItem animated:NO];
    
    //将横向列表添加到导航栏
    self.navigationItem.titleView = segmentedControl;
    
    UIBarButtonItem* leftBarButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"gear"] landscapeImagePhone:[UIImage imageNamed:@"gear"] style:UIBarButtonItemStyleBordered target:self action:@selector(onClickLeftBarButton)];
    
    UIBarButtonItem* rightBarButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"globe"] landscapeImagePhone:[UIImage imageNamed:@"globe"] style:UIBarButtonItemStyleBordered target:self action:@selector(onClickRightBarButton)];
    
    [self.navigationItem setLeftBarButtonItem:leftBarButton];
    [self.navigationItem setRightBarButtonItem:rightBarButton animated:NO];
    
    
}

-(void) buttonAction: (UISegmentedControl *) sender{
    NSLog(@"click index :");
}

-(void) onClickLeftBarButton
{
    NSLog(@"left click index :");
    //显示毛玻璃导航
    NSArray *images = @[
                        [UIImage imageNamed:@"gear"],
                        [UIImage imageNamed:@"globe"],
                        [UIImage imageNamed:@"profile"],
                        [UIImage imageNamed:@"star"],
                        [UIImage imageNamed:@"gear"],
                        [UIImage imageNamed:@"globe"],
                        [UIImage imageNamed:@"profile"],
                        [UIImage imageNamed:@"star"],
                        [UIImage imageNamed:@"gear"],
                        [UIImage imageNamed:@"globe"],
                        [UIImage imageNamed:@"profile"],
                        [UIImage imageNamed:@"star"],
                        ];
    NSArray *colors = @[
                        [UIColor colorWithRed:240/255.f green:159/255.f blue:254/255.f alpha:1],
                        [UIColor colorWithRed:255/255.f green:137/255.f blue:167/255.f alpha:1],
                        [UIColor colorWithRed:126/255.f green:242/255.f blue:195/255.f alpha:1],
                        [UIColor colorWithRed:119/255.f green:152/255.f blue:255/255.f alpha:1],
                        [UIColor colorWithRed:240/255.f green:159/255.f blue:254/255.f alpha:1],
                        [UIColor colorWithRed:255/255.f green:137/255.f blue:167/255.f alpha:1],
                        [UIColor colorWithRed:126/255.f green:242/255.f blue:195/255.f alpha:1],
                        [UIColor colorWithRed:119/255.f green:152/255.f blue:255/255.f alpha:1],
                        [UIColor colorWithRed:240/255.f green:159/255.f blue:254/255.f alpha:1],
                        [UIColor colorWithRed:255/255.f green:137/255.f blue:167/255.f alpha:1],
                        [UIColor colorWithRed:126/255.f green:242/255.f blue:195/255.f alpha:1],
                        [UIColor colorWithRed:119/255.f green:152/255.f blue:255/255.f alpha:1],
                        ];
    
    RNFrostedSidebar *callout = [[RNFrostedSidebar alloc] initWithImages:images selectedIndices:self.optionIndices borderColors:colors];
    //    RNFrostedSidebar *callout = [[RNFrostedSidebar alloc] initWithImages:images];
    callout.delegate = self;
    //    callout.showFromRight = YES;
    [callout show];
    
}

-(void) onClickRightBarButton
{
    NSLog(@"right click index :");
    [self presentViewController:[[MainViewController alloc] init] animated:YES completion:^{
        
    }];
}




#pragma mark - RNFrostedSidebarDelegate

- (void)sidebar:(RNFrostedSidebar *)sidebar didTapItemAtIndex:(NSUInteger)index {
    NSLog(@"Tapped item at index %lu",(unsigned long)index);
    if (index == 3) {
        [sidebar dismissAnimated:YES completion:nil];
    }
}

- (void)sidebar:(RNFrostedSidebar *)sidebar didEnable:(BOOL)itemEnabled itemAtIndex:(NSUInteger)index {
    if (itemEnabled) {
        [self.optionIndices addIndex:index];
    }
    else {
        [self.optionIndices removeIndex:index];
    }
}

@end
