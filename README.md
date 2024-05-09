Example
```
    self.stackView = [[ScrollableStackView alloc] init];
    
    self.stackView.direction = UILayoutConstraintAxisHorizontal;
    [self.stBgView addSubview:self.stackView];
    self.stackView.backgroundColor = KRedColor;
    [self.stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.stBgView);
    }];
    
    for (int i = 0; i < 10; i++) {
        UIView *view = [[UIView alloc] init];
        
        view.backgroundColor = [UIColor redColor];
        [self.stackView addView:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(50, 50));
        }];
    }
```
