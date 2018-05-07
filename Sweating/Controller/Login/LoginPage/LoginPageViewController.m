//
//  LoginPageViewController.m
//  LOVOL
//
//  Created by andyXu on 2018/4/24.
//  Copyright © 2018年 AndyXu. All rights reserved.
//

#import "LoginPageViewController.h"

@interface LoginPageViewController ()
@property(nonatomic,strong)UIImageView* zhIV;
@property(nonatomic,strong)UITextField* zhTF;
@property(nonatomic,strong)UIView* zhLine;

@property(nonatomic,strong)UIImageView* pwIV;
@property(nonatomic,strong)UITextField* pwTF;
@property(nonatomic,strong)UIView* pwLine;

@property(nonatomic,strong)UIButton* loginBtn;
@end

@implementation LoginPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"登录";
    self.view.backgroundColor = [MyController colorWithHexString:CNavBgColor];
    [self makeUI];
}

/**
 创建登录页面
 */
- (void)makeUI {
    self.pwLine = [MyController viewWithFrame:self.view.frame];
    self.pwLine.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.pwLine];
    
    [self.pwLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.centerY.mas_equalTo(self.view.mas_centerY);
        make.height.mas_offset(0.5);
    }];
    
    self.pwTF = [MyController createTextFieldWithFrame:self.view.frame placeholder:@"密码" passWord:YES leftImageView:nil rightImageView:nil Font:16];
    self.pwTF.textColor = [UIColor whiteColor];
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:@"密码" attributes:
                                      @{NSForegroundColorAttributeName:[UIColor whiteColor],
                                        NSFontAttributeName:self.pwTF.font
                                        }];
    self.pwTF.attributedPlaceholder = attrString;
    [self.view addSubview:self.pwTF];
    
    [self.pwTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.pwLine.mas_left).mas_offset(40);
        make.right.mas_equalTo(self.pwLine.mas_right).mas_offset(-10);
        make.bottom.mas_equalTo(self.pwLine.mas_top);
        make.height.mas_offset(30);
    }];
    
    self.pwIV = [MyController createImageViewWithFrame:self.view.frame ImageName:@"个人中心-选中"];
    [self.view addSubview:self.pwIV];
    
    [self.pwIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.pwTF.mas_left).mas_offset(-12);
        make.centerY.mas_equalTo(self.pwTF.mas_centerY);
        make.height.mas_offset(16);
        make.width.mas_offset(16);
    }];
    
    
    self.zhLine = [MyController viewWithFrame:self.view.frame];
    self.zhLine.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.zhLine];
    
    [self.zhLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.pwLine);
        make.right.mas_equalTo(self.pwLine);
        make.bottom.mas_equalTo(self.pwLine.mas_top).mas_offset(-65);
        make.height.mas_offset(0.5);
    }];
    
    self.zhTF = [MyController createTextFieldWithFrame:self.view.frame placeholder:@"账号" passWord:NO leftImageView:nil rightImageView:nil Font:16];
    NSAttributedString *attrString1 = [[NSAttributedString alloc] initWithString:@"账号" attributes:
                                      @{NSForegroundColorAttributeName:[UIColor whiteColor],
                                        NSFontAttributeName:self.zhTF.font
                                        }];
    self.zhTF.attributedPlaceholder = attrString1;
    self.zhTF.textColor = [UIColor whiteColor];
    [self.view addSubview:self.zhTF];
    
    [self.zhTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.zhLine.mas_left).mas_offset(40);
        make.right.mas_equalTo(self.zhLine.mas_right).mas_offset(-10);
        make.bottom.mas_equalTo(self.zhLine.mas_top);
        make.height.mas_offset(30);
    }];
    
    self.zhIV = [MyController createImageViewWithFrame:self.view.frame ImageName:@"个人中心-选中"];
    [self.view addSubview:self.zhIV];
    
    [self.zhIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.zhTF.mas_left).mas_offset(-12);
        make.centerY.mas_equalTo(self.zhTF.mas_centerY);
        make.height.mas_offset(16);
        make.width.mas_offset(16);
    }];
    
    self.loginBtn = [MyController createButtonWithFrame:self.view.frame ImageName:nil Target:self Action:@selector(loginBtnClick) Title:@"登录"];
    [self.loginBtn setTitleColor:[MyController colorWithHexString:CNavBgColor] forState:UIControlStateNormal];
    [self.loginBtn setBackgroundColor:[UIColor whiteColor]];
    self.loginBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:self.loginBtn];
    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.pwLine);
        make.right.mas_equalTo(self.pwLine);
        make.top.mas_equalTo(self.pwLine.mas_bottom).mas_offset(40);
        make.height.mas_offset(42);
    }];
    
}

/**
 登录响应
 */
- (void)loginBtnClick {
//    [requestService postCityMemoryWithPageIndex:@"0" pageSize:@"10" year:@"1950" complate:^(id responseObject) {
//        DLog(@"%@",responseObject[@"data"]);
//    } failure:^(NSError *error) {
//
//    }];
    [(AppDelegate *)[UIApplication sharedApplication].delegate setRootVC];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
