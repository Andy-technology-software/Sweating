//
//  CommonCellTableViewCell.h
//  内蒙大数据
//
//  Created by andyXu on 2018/2/9.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CommonCellModel;
@interface CommonCellTableViewCell : UITableViewCell
- (void)configCellWithModel:(CommonCellModel *)model;

@end
