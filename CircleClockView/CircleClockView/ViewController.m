//
//  ViewController.m
//  CircleClockView
//
//  Created by GXY on 15/11/18.
//  Copyright © 2015年 Tangxianhai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet CircleClockView *circleV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.circleV.progress = 0.3f;
    self.circleV.weight = 56.2;
    self.circleV.bmi = 26.1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
