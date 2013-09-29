#import "CCMenuItemToggle+CocosBuilder.h"

@implementation CCMenuItemToggle(CocosBuilder)

-(NSMutableArray*)subItems
{
    if (_subItems==nil) {
        
        _subItems = [[NSMutableArray alloc] init];
    }
    return _subItems;
}
-(void)addChild:(CCNode *)node z:(NSInteger)z tag:(NSInteger)aTag
{
    if (![node isKindOfClass:[CCMenuItem class]]) {
        
        CCLOG(@"The Child  Of CCBMenuItemToggle Must Be The Subclass of CCMenuItem ! ");
        
        return;
    }
    [super addChild:node z:z tag:aTag];
    [node setPosition:CGPointMake([self position].x, [self position].y)];
    node.visible = NO;
    
    [self.subItems addObject:node];
    
    NSUInteger currentIndex = self.selectedIndex;
    
    _selectedIndex = NSUIntegerMax;
    
    self.selectedIndex = currentIndex;
}

-(void)setSelectedIndex:(NSUInteger)index
{
    if( index != _selectedIndex &&  index<_subItems.count ) {
        if( _currentItem ){
            _currentItem.visible = NO;
            
        }
        CCMenuItem *item = [_subItems objectAtIndex:index];
        //CGSize s = [item contentSize];
        
        //[self setContentSize: s];
        item.position = ccp([self position].x,[self position].y);
        item.visible = YES;
        _currentItem = item;
        
        _selectedIndex=index;
        
    }
    
}
@end;