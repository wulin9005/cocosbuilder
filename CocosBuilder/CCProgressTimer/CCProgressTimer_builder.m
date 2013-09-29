//
//  CCProgressTimer_builder.m
//  CCProgressTimer
//
//  Created by Dell on 13-9-6.
//
//

#import "CCProgressTimer_builder.h"

@implementation CCBProgressTimer

@synthesize frontSpriteFrame;
@synthesize displayFrame;
@synthesize percentage;
@synthesize xDst;
@synthesize yDst;

- (id) init
{
    self = [super init];
    if (!self) return NULL;
    self.percentage = 100.0f;
    return self;
}
-(void) setFrontSpriteFrame:(CCSpriteFrame *)newFrontSpriteFrame
{
    if(![newFrontSpriteFrame texture]){
        NSLog(@"----------->front 信息为空 返回");
        return ;
    }
    if(!backgroundSprite){
        return;
    }
    
    CCSprite* front;
    
    if(!(front =[CCSprite spriteWithSpriteFrame:newFrontSpriteFrame])){
        return;
    }
    
    frontSpriteFrame = newFrontSpriteFrame;
    
    if(!progressTimer){
        progressTimer = [CCProgressTimer progressWithSprite:front];
        [progressTimer setType:kCCProgressTimerTypeBar];
        [progressTimer setMidpoint:CGPointMake(0, 1)];
        [progressTimer setBarChangeRate:CGPointMake(1, 0)];
        
        [progressTimer setAnchorPoint:CGPointMake(0.0f, 0.5f)];
        
        [backgroundSprite addChild:progressTimer];
    }
    else{
        [progressTimer setSprite:front];
        
    }
    [progressTimer setPercentage:[self percentage]];
    [progressTimer setPosition:CGPointMake(0.0f, backgroundSprite.contentSize.height  * 0.5f)];
    progressTimerPoint = progressTimer.position;
}

-(void)setDisplayFrame:(CCSpriteFrame *)newdisplayFrame{
    displayFrame = newdisplayFrame;
    if(!backgroundSprite){
        backgroundSprite = [CCSprite spriteWithSpriteFrame:newdisplayFrame];
        [backgroundSprite setAnchorPoint:CGPointMake(0, 0)];
        [backgroundSprite setPosition:CGPointMake(0,0)];
        [self addChild:backgroundSprite];
    }
    else{
        [backgroundSprite setDisplayFrame:newdisplayFrame];
    }
    [self setBackgroundSpriteScale];
    
}

//更改前景图片的位置  x
-(void)setXDst:(float)newxDst{
    if(!progressTimer){
        return ;
    }
    xDst=newxDst;
    [progressTimer setPosition:CGPointMake(progressTimerPoint.x + xDst , progressTimer.position.y)];
}
//y
-(void) setYDst:(float)newyDst
{
    if(!progressTimer){
        return ;
    }
    yDst=newyDst;
    [progressTimer setPosition:CGPointMake(progressTimer.position.x,progressTimerPoint.y + yDst)];
}

-(void) setPercentage:(float)newpercentage
{
    if(!progressTimer){
        return ;
    }
    percentage = newpercentage;
    [progressTimer setPercentage:newpercentage];
}

-(void) setContentSize:(CGSize)contentSize
{
    [super setContentSize:contentSize];
    [self setBackgroundSpriteScale];
}

-(void) setBackgroundSpriteScale{
    if(backgroundSprite){
        [backgroundSprite setScaleX:self.contentSize.width / backgroundSprite.contentSize.width];
        [backgroundSprite setScaleY:self.contentSize.height / backgroundSprite.contentSize.height];
    }
}

@end
