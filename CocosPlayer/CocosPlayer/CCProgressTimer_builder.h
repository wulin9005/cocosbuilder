//
//  CCProgressTimer_builder.h
//  CCProgressTimer
//
//  Created by Dell on 13-9-6.
//
//

#import "cocos2d.h"

@interface CCBProgressTimer : CCLayer
{
    CCSpriteFrame* frontSpriteFrame ;
    CCSpriteFrame* displayFrame;
    CCSprite* backgroundSprite;
    CCProgressTimer* progressTimer;
    CGPoint progressTimerPoint;
    float percentage;
    float xDst;
    float yDst;
}

@property (nonatomic,assign) CCSpriteFrame* frontSpriteFrame;
@property (nonatomic,assign) CCSpriteFrame* displayFrame;

@property(nonatomic,assign) float xDst;
@property(nonatomic,assign) float yDst;
@property(nonatomic,assign) float percentage;



@end
