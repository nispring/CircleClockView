//
//  DALabeledCircularProgressView.m
//  DACircularProgressExample
//
//  Created by Josh Sklar on 4/8/14.
//  Copyright (c) 2014 Shout Messenger. All rights reserved.
//

#import "DALabeledCircularProgressView.h"

@implementation DALabeledCircularProgressView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initializeLabel];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initializeLabel];
    }
    return self;
}


#pragma mark - Internal methods

/**
 Creates and initializes
 -[DALabeledCircularProgressView progressLabel].
 */
- (void)initializeLabel
{
    // 1.Middle lable
    self.progressLabel = [[UILabel alloc] init];
    self.progressLabel.textAlignment = NSTextAlignmentCenter;
    self.progressLabel.textColor = [UIColor whiteColor];
    self.progressLabel.backgroundColor = [UIColor clearColor];
    
    // 2.Top lable
    self.topLabel = [[UILabel alloc] init];
    self.topLabel.textColor = [UIColor whiteColor];
    self.topLabel.textAlignment = NSTextAlignmentCenter;
    self.topLabel.font = [UIFont systemFontOfSize:22.f];
    
    // 3.Bottom label
    self.bottomLabel = [[UILabel alloc] init];
    self.bottomLabel.textColor = [UIColor whiteColor];
    self.bottomLabel.font = [UIFont systemFontOfSize:20.f];
    self.bottomLabel.textAlignment = NSTextAlignmentCenter;
    
    // 4.Add subview
    [self addSubview:self.topLabel];
    [self addSubview:self.progressLabel];
    [self addSubview:self.bottomLabel];
    
    // 5.Layout subview
    [self.topLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.progressLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.bottomLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_progressLabel]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_progressLabel)]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.progressLabel attribute:NSLayoutAttributeCenterY multiplier:1.f constant:0.f]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.topLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.progressLabel attribute:NSLayoutAttributeTop multiplier:1.f constant:- 4.f]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_topLabel]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_topLabel)]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_bottomLabel]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_bottomLabel)]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.bottomLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.progressLabel attribute:NSLayoutAttributeBottom multiplier:1.f constant:0.f]];
}

@end
