//
//  ALin.m
//  MiaowShow
//
//  Created by bluePanda on 17/2/10.
//  Copyright © 2017年 ALin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TabBarItem4.h"


@implementation TabBarItem4



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *bgImage = [UIImage imageNamed:@"card_bg_big_52"];
    UIImageView* imgView = [[UIImageView alloc] initWithImage:bgImage];
    [self.view addSubview:imgView];
    [imgView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        //make.center.equalTo(self.view);
    }];
    
    self.navigationItem.title = @"设置";
    
}

@end
