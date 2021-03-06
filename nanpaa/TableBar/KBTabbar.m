//
//  KBTabbar.m
//  KBTabbarController
//
//  Created by kangbing on 16/5/31.
//  Copyright © 2016年 kangbing. All rights reserved.
//

#import "KBTabbar.h"

@implementation KBTabbar


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = RGB(37, 41, 75);
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:[UIImage imageNamed:@"plusButtnNormo"] forState:UIControlStateNormal];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notic:) name:@"changePlusBtnImg" object:nil];
        btn.bounds = CGRectMake(0, 0, 64, 64);
        self.centerBtn = btn;
        [self addSubview:btn];
        
 
        
    }
    return self;
}

- (void)layoutSubviews
{
    
    [super layoutSubviews];
    
    self.centerBtn.center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.3);
    
    int index = 0;
    CGFloat wigth = self.bounds.size.width / 3;

    for (UIView* sub in self.subviews) {
        
        if ([sub isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            sub.frame = CGRectMake(index * wigth - 5, self.bounds.origin.y + 5, wigth, self.bounds.size.height - 2);
            
            index++;
            
            if (index == 1) {
                index++;
            }
        }
    }
}



- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    if (self.isHidden == NO) {
        
        CGPoint newPoint = [self convertPoint:point toView:self.centerBtn];
        
        if ( [self.centerBtn pointInside:newPoint withEvent:event]) {
            return self.centerBtn;
        }else{
            
            return [super hitTest:point withEvent:event];
        }
    }
    
    else {
        return [super hitTest:point withEvent:event];
    }
}

- (void)notic:(NSNotification *)notfica {
    NSString *change = notfica.object;
    if ([change isEqualToString:@"Yes"]) {
        [self.centerBtn setBackgroundImage:[UIImage imageNamed:@"plusBtnImg"] forState:UIControlStateNormal];
    }else{
        [self.centerBtn setBackgroundImage:[UIImage imageNamed:@"plusButtnNormo"] forState:UIControlStateNormal];
    }

}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:@"changePlusBtnImg"];
}
@end
