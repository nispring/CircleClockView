//
//  CircleClockView.m
//  Effect of pointer ring
//
//  Created by GXY on 15/10/26.
//  Copyright © 2015年 Tangxianhai. All rights reserved.
//

#import "CircleClockView.h"

#define CELLMARKNUM    10 // Number of formats
#define CELLNUM        18 // Total grid number
#define RADIUSOUTSIDE  self.center.x - 35.f // Outer circle radius
#define MAXOFFSETANGLE 180.0f // Plus or minus 360 is a week 180 degrees

@implementation CircleClockView {
    CGContextRef context;
    
    CGFloat maxAngle;
    CGFloat minAngle;
    
    CGFloat scoleNum;
    
    CGFloat weight;
    CGFloat bmi;
    CGFloat progress;
}

#pragma mark - life cycle

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // set background clear
        [self setBackgroundColor:[UIColor clearColor]];
        scoleNum = 1;
        minAngle = -MAXOFFSETANGLE;
        maxAngle = MAXOFFSETANGLE;
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame Weight:(CGFloat)t_weight Bmi:(CGFloat)t_bmi Progress:(CGFloat)t_progress
{
    self = [super initWithFrame:frame];
    if (self) {
        // set background clear
        [self setBackgroundColor:[UIColor clearColor]];
        scoleNum = 1;
        minAngle = -MAXOFFSETANGLE;
        maxAngle = MAXOFFSETANGLE;
        
        weight = t_weight;
        bmi = t_bmi;
        progress = t_progress;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    //get contex
    context = UIGraphicsGetCurrentContext();
    //Drawing instrument panel
    [self setLineMark:CELLNUM*CELLMARKNUM];
    [self drawCircleProgressView];
}

- (void)drawCircleProgressView {
    DALabeledCircularProgressView *daProgressView = [[DALabeledCircularProgressView alloc] initWithFrame:CGRectMake(0, 0, (RADIUSOUTSIDE - 16) *  2, (RADIUSOUTSIDE - 16)*2)];
    daProgressView.center = self.center;
    daProgressView.progressTintColor = [UIColor colorWithRed:252/256.f green:194/256.f blue:48/256.f alpha:1.f];
    daProgressView.trackTintColor = [UIColor whiteColor];
    daProgressView.thicknessRatio = 0.14f;
    daProgressView.progress = progress;
    
    NSString *stringWeight = [NSString stringWithFormat:@"%.1f kg",weight];
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:stringWeight];
    [attributeStr setAttributes:@{
                                   NSFontAttributeName:[UIFont systemFontOfSize:65.f]
                                            } range:NSMakeRange(0, stringWeight.length - 3)];
    [attributeStr setAttributes:@{
                                  NSFontAttributeName:[UIFont systemFontOfSize:26.f]
                                  } range:NSMakeRange(stringWeight.length - 3, 3)];
    daProgressView.progressLabel.attributedText = attributeStr;
    
    daProgressView.bottomLabel.text = [NSString stringWithFormat:@"BMI %1.f / 偏胖",bmi];
    daProgressView.topLabel.text = @"体重";
    
    [self.superview addSubview:daProgressView];
}

#pragma mark - private method
/*
 * parseToX Angle turn arc
 * @angel CGFloat arc
 */
- (CGFloat)transToRadian:(CGFloat)angel
{
    return angel*M_PI/180;
}

/*
 * parseToX According to the angle, the radius of the X coordinates
 * @radius CGFloat radius
 * @angle  CGFloat arc
 */
- (CGFloat) parseToX:(CGFloat) radius Angle:(CGFloat)angle
{
    CGFloat tempRadian = [self transToRadian:angle];
    return radius*cos(tempRadian);
}

/*
 * parseToY According to the angle, the radius of the Y coordinates
 * @radius CGFloat radius
 * @angle  CGFloat arc
 */
- (CGFloat) parseToY:(CGFloat) radius Angle:(CGFloat)angle
{
    CGFloat tempRadian = [self transToRadian:angle];
    return radius*sin(tempRadian);
}

/*
 * setLineMark Marker of scale
 * @labelNum NSInteger Scale number
 */
- (void)setLineMark:(NSInteger)cellNum
{
    CGFloat angelDis = (maxAngle - minAngle)/cellNum; // Each grid arc number
    CGFloat currentAngle;
    CGPoint centerPoint = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    
    for(int i=0;i<=cellNum;i++)
    {
        currentAngle = minAngle + i * angelDis;
        // Draw the color to the scale
        CGContextSetStrokeColorWithColor(context, [[UIColor colorWithRed:1.f green:1.f blue:1.f alpha:0.8f] CGColor]);
        // Draw different length scales
        if(i % CELLMARKNUM == 0)
        {
            CGContextSetLineWidth(context, 3);
            CGContextSetLineCap(context, kCGLineCapButt);
            CGContextMoveToPoint(context,centerPoint.x+[self parseToX:RADIUSOUTSIDE Angle:currentAngle], centerPoint.y+[self parseToY:RADIUSOUTSIDE Angle:currentAngle]);
            CGContextAddLineToPoint(context,centerPoint.x+[self parseToX:RADIUSOUTSIDE - 10 Angle:currentAngle], centerPoint.y+[self parseToY:RADIUSOUTSIDE - 10 Angle:currentAngle]);
            CGContextStrokePath(context);
        } else {
            CGContextSetLineWidth(context, 1);
            CGContextSetLineCap(context, kCGLineCapButt);
            CGContextMoveToPoint(context,centerPoint.x+[self parseToX:RADIUSOUTSIDE Angle:currentAngle], centerPoint.y+[self parseToY:RADIUSOUTSIDE Angle:currentAngle]);
            CGContextAddLineToPoint(context,centerPoint.x+[self parseToX:RADIUSOUTSIDE - 7 Angle:currentAngle], centerPoint.y+[self parseToY:RADIUSOUTSIDE - 7 Angle:currentAngle]);
            CGContextStrokePath(context);
        }
    }
}

@end
