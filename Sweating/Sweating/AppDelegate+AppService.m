//
//  AppDelegate+AppService.m
//  Sweating
//
//  Created by andyXu on 2018/5/7.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "AppDelegate+AppService.h"

#import "HomepageIndexViewController.h"

#import "NearbyIndexViewController.h"

#import "DynamicIndexViewController.h"

#import "MineIndexViewController.h"

#import "LoginPageViewController.h"
@implementation AppDelegate (AppService)

#pragma mark ————— 初始化window —————
-(void)initWindow{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    [[UIButton appearance] setExclusiveTouch:YES];
    if (@available(iOS 11.0, *)){
        [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    }
    if ([MyController returnStr:[MyController getUserid]].length) {
        [self setRootVC];
    }else {
        [self setLoginRoot];
    }
    
}

+ (AppDelegate *)shareAppDelegate{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (void)setupViewControllers{
    
    HomepageIndexViewController *homepageIndexViewController = [[HomepageIndexViewController alloc] init];
    UINavigationController *pageFirstNavigationController = [[UINavigationController alloc]
                                                             initWithRootViewController:homepageIndexViewController];
    
    NearbyIndexViewController *nearbyIndexViewController = [[NearbyIndexViewController alloc] init];
    UINavigationController *quotationNavigationController = [[UINavigationController alloc]
                                                             initWithRootViewController:nearbyIndexViewController];
    
    DynamicIndexViewController *dynamicIndexViewController = [[DynamicIndexViewController alloc] init];
    UINavigationController *businessIndexNavigationController = [[UINavigationController alloc]
                                                                 initWithRootViewController:dynamicIndexViewController];

    
    MineIndexViewController *mineIndexViewController = [[MineIndexViewController alloc] init];
    UINavigationController *mineIndexNavigationController = [[UINavigationController alloc]
                                                             initWithRootViewController:mineIndexViewController];
    
    tabBarController = [[RDVTabBarController alloc] init];
    [tabBarController.tabBar setHeight:[MyController tabBarHeight]];
    [tabBarController setViewControllers:@[pageFirstNavigationController,quotationNavigationController,
                                           businessIndexNavigationController,mineIndexNavigationController]];
    self.viewController = tabBarController;
    
    [self customizeTabBarForController:tabBarController];
}

- (void)customizeTabBarForController:(RDVTabBarController *)tabBarControllers {
    UIImage *backgroundImage = [UIImage imageNamed:@"矩形-23"];
    UIImage *finishedImage = [UIImage imageNamed:@"tabbar_selected_background"];
    UIImage *unfinishedImage = [UIImage imageNamed:@"tabbar_normal_background"];
    NSArray *tabBarItemImages = @[@"首页",@"文化活动",@"智慧场馆",@"个人中心"];
    //    NSArray *titleArr = @[@"首页",@"文化活动",@"智慧场馆",@"个人中心",@"个人中心"];
    NSInteger index = 0;
    for (RDVTabBarItem *item in [[tabBarControllers tabBar] items]) {
        [item setBackgroundSelectedImage:finishedImage withUnselectedImage:unfinishedImage];
        UIImage *selectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@-选中",
                                                      [tabBarItemImages objectAtIndex:index]]];
        UIImage *unselectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@",
                                                        [tabBarItemImages objectAtIndex:index]]];
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        item.title = @"";
        index++;
        [item setBackgroundSelectedImage:backgroundImage withUnselectedImage:backgroundImage];
        
        item.selectedTitleAttributes=@{NSForegroundColorAttributeName:[MyController colorWithHexString:CNavBgColor]};
        item.unselectedTitleAttributes=@{NSForegroundColorAttributeName:[MyController colorWithHexString:@"525354"]};
        item.titlePositionAdjustment=UIOffsetMake(0, 5);
        [item setBackgroundColor:[MyController colorWithHexString:@"FFFFFF"]];
        
    }
}

- (void)setRootVC{
    [UIView transitionWithView:[UIApplication sharedApplication].keyWindow duration:0.5f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        BOOL oldState = [UIView areAnimationsEnabled];
        [UIView setAnimationsEnabled:NO];
        
        self.window.rootViewController = nil;
        self.viewController = nil;
        [self setupViewControllers];
        [self.window setRootViewController:self.viewController];
        
        [self.window makeKeyAndVisible];
        
        [UIView setAnimationsEnabled:oldState];
    } completion:^(BOOL finished) {
        
    }];
    
}

- (void)setLoginRoot{
    [UIView transitionWithView:[UIApplication sharedApplication].keyWindow duration:0.5f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        BOOL oldState = [UIView areAnimationsEnabled];
        [UIView setAnimationsEnabled:NO];
        
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"userId"];
        [XRQJPush setAlias:@"" AndSeqNum:0];
        [[XRQJPush shareJPushManager] setBadge:0];
        LoginPageViewController* vc = [[LoginPageViewController alloc] init];
        self.window.rootViewController = vc;//[[UINavigationController alloc] initWithRootViewController:vc];
        
        [UIView setAnimationsEnabled:oldState];
    } completion:^(BOOL finished) {
        
    }];
}

@end


