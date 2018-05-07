
//
//  CommonCellTableViewCell.m
//  内蒙大数据
//
//  Created by andyXu on 2018/2/9.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "CommonCellTableViewCell.h"

#import "CommonCellModel.h"
@interface CommonCellTableViewCell()
@property(nonatomic,strong)UILabel* leftLable;
@property(nonatomic,strong)UILabel* rightLable;
@property(nonatomic,strong)UIView* lineView;

@end
@implementation CommonCellTableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
                      reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}

- (void)makeUI{
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    self.leftLable = [MyController createLabelWithFrame:self.contentView.frame Font:13 Text:nil];
    self.leftLable.textColor = [MyController colorWithHexString:CFontColor1];
//    self.leftLable.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.leftLable];
    
    [self.leftLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(15);
//        make.width.mas_offset(80);
    }];
    
    self.rightLable = [MyController createLabelWithFrame:self.contentView.frame Font:13 Text:nil];
    self.rightLable.textColor = [MyController colorWithHexString:CFontColor2];
    self.rightLable.numberOfLines = 1;
//    self.rightLable.textAlignment = NSTextAlignmentLeft;
    self.rightLable.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.contentView addSubview:self.rightLable];
    
    [self.rightLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.leftLable.mas_right).mas_offset(6);
        make.top.mas_equalTo(self.leftLable);
        make.right.mas_equalTo(-10);
    }];
    
    self.lineView = [MyController viewWithFrame:self.contentView.frame];
    self.lineView.backgroundColor = [MyController colorWithHexString:CLineColor];
    [self.contentView addSubview:self.lineView];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self.rightLable.mas_bottom).mas_offset(15);
        make.height.mas_offset(0.5);
    }];
    
    self.hyb_lastViewInCell = self.lineView;
    self.hyb_bottomOffsetToCell = 0;
}

- (void)configCellWithModel:(CommonCellModel *)model {
    self.leftLable.text = model.leftTit;
    
    self.rightLable.text = model.rightTit;
}

@end
