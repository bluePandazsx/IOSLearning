//
//  ALin.m
//  MiaowShow
//
//  Created by bluePanda on 17/2/10.
//  Copyright © 2017年 ALin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TabBarItem2.h"


@implementation TabBarItem2



- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"dddddddddddddddddddddddd");
    UIImage *bgImage = [UIImage imageNamed:@"card_bg_big_55"];
    UIImageView* imgView = [[UIImageView alloc] initWithImage:bgImage];
    [self.view addSubview:imgView];
    [imgView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        //make.center.equalTo(self.view);
    }];
    
    self.navigationItem.title = @"朋友圈";

}

@end
