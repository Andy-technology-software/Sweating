//
//  AppDelegate.h
//  Sweating
//
//  Created by andyXu on 2018/5/7.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MainTabBarController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    RDVTabBarController *tabBarController;
}
@property (strong, nonatomic)UIViewController *viewController;
@property (strong, nonatomic)UIWindow *window;
@property (strong, nonatomic) MainTabBarController *mainTabBar;


@end

