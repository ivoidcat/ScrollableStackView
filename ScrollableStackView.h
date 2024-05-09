//
//  ScrollableStackView.h
//  UniversalApp
//
//  Created by voidcat on 2023/11/18.
//  Copyright © 2023 voidcat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CYUIScrollView.h"
NS_ASSUME_NONNULL_BEGIN

@interface ScrollableStackView : UIView

// MARK: - Properties

@property (nonatomic, strong) CYUIScrollView *scrollView;
@property (nonatomic, strong) UIStackView *stackView;

// MARK: - Life Cycle

- (void)didMoveToSuperview;

// MARK: - Actions

- (void)addView:(UIView *)view;
- (void)insertView:(UIView *)view atIndex:(NSInteger)index;
- (void)removeView:(UIView *)view;

// MARK: - Configuration

@property (nonatomic) CGFloat spacing;
@property (nonatomic) UIStackViewAlignment alignment;
@property (nonatomic) UIStackViewDistribution distribution;

@property (nonatomic) BOOL showsVerticalScrollIndicator;
@property (nonatomic) BOOL bounces;
@property(nonatomic, assign) BOOL didSetupConstraints;
@property (nonatomic) UILayoutConstraintAxis direction; // 添加direction属性

@end

NS_ASSUME_NONNULL_END
