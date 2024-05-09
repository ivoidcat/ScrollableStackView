#import <UIKit/UIKit.h>
#import "ScrollableStackView.h"

@interface ScrollableStackView()

@end


@implementation ScrollableStackView

// MARK: - Properties

- (CYUIScrollView *)scrollView {
  if (!_scrollView) {
    _scrollView = [[CYUIScrollView alloc] initWithFrame:CGRectZero];
    _scrollView.backgroundColor = [UIColor clearColor];
    _scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    _scrollView.layoutMargins = UIEdgeInsetsZero;
  }
  return _scrollView;
}

- (UIStackView *)stackView {
  if (!_stackView) {
    _stackView = [[UIStackView alloc] initWithFrame:CGRectZero];
    _stackView.translatesAutoresizingMaskIntoConstraints = NO;
    _stackView.axis = self.direction;
    _stackView.alignment = UIStackViewAlignmentFill;
    _stackView.distribution = UIStackViewDistributionFill;
  }
  return _stackView;
}

// MARK: - Life Cycle

- (void)didMoveToSuperview {
  [super didMoveToSuperview];
  
  self.translatesAutoresizingMaskIntoConstraints = NO;
  self.clipsToBounds = YES;
  
  [self addSubview:self.scrollView];
  [self.scrollView addSubview:self.stackView];
  
  [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {

  [super updateConstraints];

  if (!self.didSetupConstraints) {

      [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
      }];
      
      if (self.direction == UILayoutConstraintAxisHorizontal) {
        // 水平方向
        [self.stackView mas_makeConstraints:^(MASConstraintMaker *make) {
          make.edges.equalTo(self.scrollView);
          make.height.equalTo(self.scrollView);
        }];

      } else {
        // 垂直方向(默认)

          
          [self.stackView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.scrollView);
            make.width.equalTo(self.scrollView);
          }];
      }
      
    
    self.didSetupConstraints = YES;
  }

}

// MARK: - Actions

- (void)addView:(UIView *)view {
  [self.stackView addArrangedSubview:view];
}

- (void)insertView:(UIView *)view atIndex:(NSInteger)index {
  [self.stackView insertArrangedSubview:view atIndex:index];
}

- (void)removeView:(UIView *)view {
  [self.stackView removeArrangedSubview:view];
}

// MARK: - Configuration

- (CGFloat)spacing {
  return self.stackView.spacing;
}

- (void)setSpacing:(CGFloat)spacing {
  self.stackView.spacing = spacing;
}

- (UIStackViewAlignment)alignment {
  return self.stackView.alignment;
}

- (void)setAlignment:(UIStackViewAlignment)alignment {
  self.stackView.alignment = alignment;
}

- (UIStackViewDistribution)distribution {
  return self.stackView.distribution;
}

- (void)setDistribution:(UIStackViewDistribution)distribution {
  self.stackView.distribution = distribution;
}

- (BOOL)showsVerticalScrollIndicator {
  return self.scrollView.showsVerticalScrollIndicator;
}

- (void)setShowsVerticalScrollIndicator:(BOOL)showsVerticalScrollIndicator {
  self.scrollView.showsVerticalScrollIndicator = showsVerticalScrollIndicator;
}

- (BOOL)bounces {
  return self.scrollView.bounces;
}

- (void)setBounces:(BOOL)bounces {
  self.scrollView.bounces = bounces;
}

@end
