//
//  AppDelegate+AppService.h
//  Sweating
//
//  Created by andyXu on 2018/5/7.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (AppService)
+ (AppDelegate *)shareAppDelegate;
-(void)initWindow;
- (void)setRootVC;
- (void)setLoginRoot;
@end
