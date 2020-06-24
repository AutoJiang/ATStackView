//
//  ATStack.m
//  Demo
//
//  Created by jiang aoteng on 2019/11/4.
//  Copyright © 2019 jiang aoteng. All rights reserved.
//

#import "UIView+ATStack.h"
#import "ATStack+Private.h"

static NSString *kATStackRunLoopBeforeWaiting = @"kATStackRunLoopBeforeWaiting";
@interface ATStack()

@property(nonatomic, assign) CFRunLoopObserverCallBack block;
@end

@interface ATStack()<ATStackInfoDelegate>

@end

@implementation ATStack

+ (void)initialize
{
    if (self == [ATStack class]) {
        CFRunLoopRef runloop = CFRunLoopGetMain();
        CFRunLoopObserverRef observer;
        observer = CFRunLoopObserverCreate(CFAllocatorGetDefault(),
                                           kCFRunLoopBeforeWaiting | kCFRunLoopExit,
                                           true,      // repeat
                                           0,  //before CATransaction(2000000)
                                           &runLoopObserverCallback, NULL);
        CFRunLoopAddObserver(runloop, observer, kCFRunLoopCommonModes);
        CFRelease(observer);
    }
}

- (instancetype)initWithView:(UIView*)view inset:(UIEdgeInsets)inset
{
    self = [super init];
    if (self) {
        self.view = view;
        self->inset = inset;
        self->arrangedSubviewsHead = [[NSMutableArray alloc] init];
        self->arrangedSubviewsCenter = [[NSMutableArray alloc] init];
        self->arrangedSubviewsTail = [[NSMutableArray alloc] init];
        view.stack = self;
        view.info.delegate = self;
        [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(runLoopBeforeWaiting) name:kATStackRunLoopBeforeWaiting object:nil];
    }
    return self;
}

static void runLoopObserverCallback(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info){
    [NSNotificationCenter.defaultCenter postNotificationName:kATStackRunLoopBeforeWaiting object:nil];
}

-(void)dealloc{
    [NSNotificationCenter.defaultCenter removeObserver:self name:kATStackRunLoopBeforeWaiting object:nil];
}

-(void)runLoopBeforeWaiting{
    if (self.isNeedLayout) {
        [self layoutFrame];
    }
}

-(UIView*)addArrangedSubview:(UIView*)view position:(ATStackViewPosition)position{
    switch (position) {
        case ATStackViewPositionHead:
            [self->arrangedSubviewsHead addObject:view];
            break;
        case ATStackViewPositionCenter:
            [self->arrangedSubviewsCenter addObject:view];
            break;
        case ATStackViewPositionTail:
            [self->arrangedSubviewsTail addObject:view];
            break;
        default:
            break;
    };
    [self.view addSubview:view];
    self.isNeedLayout = true;
    return view;
}

-(UIView*)addArrangedSubview:(UIView*)view{
    return [self addArrangedSubview:view position:ATStackViewPositionHead];
}

-(UIView*)addArrangedSubviewCenter:(UIView*)view{
    return [self addArrangedSubview:view position:ATStackViewPositionCenter];
}

-(UIView*)addArrangedSubviewTail:(UIView*)view{
    return [self addArrangedSubview:view position:ATStackViewPositionTail];
}

-(void)addSpacing:(CGFloat)spacing{
    [self addSpacing:spacing position:ATStackViewPositionHead];
}

-(void)addSpacing:(CGFloat)spacing position:(ATStackViewPosition)position{
    UIView *v;
    if(position == ATStackViewPositionHead){
        v = [self->arrangedSubviewsHead lastObject];
    }else if(position == ATStackViewPositionCenter){
        v = [self->arrangedSubviewsCenter lastObject];
    }else if(position == ATStackViewPositionTail){
        v = [self->arrangedSubviewsTail lastObject];
    }
    if(v){
        v.info.space = spacing;
    }
    self.isNeedLayout = true;
}

-(void)removeArrangedSubview:(UIView*)view{
    [self->arrangedSubviewsHead removeObject:view];
    [self->arrangedSubviewsCenter removeObject:view];
    [self->arrangedSubviewsTail removeObject:view];
    for (UIView *subView in self.view.subviews) {
        if ([subView isEqual:view]) {
            return [view removeFromSuperview];
        }
    }
    self.isNeedLayout = true;
}

-(void)removeLastObjectWithPositon:(ATStackViewPosition)position{
    UIView *v;
    if(position == ATStackViewPositionHead){
        v = [self->arrangedSubviewsHead lastObject];
    }else if(position == ATStackViewPositionCenter){
        v = [self->arrangedSubviewsCenter lastObject];
    }else if(position == ATStackViewPositionTail){
        v = [self->arrangedSubviewsTail lastObject];
    }
    [self removeArrangedSubview:v];
}

-(void)removeFisrstObjectWithPositon:(ATStackViewPosition)position{
    UIView *v;
    if(position == ATStackViewPositionHead){
        v = [self->arrangedSubviewsHead firstObject];
    }else if(position == ATStackViewPositionCenter){
        v = [self->arrangedSubviewsCenter firstObject];
    }else if(position == ATStackViewPositionTail){
        v = [self->arrangedSubviewsTail firstObject];
    }
    [self removeArrangedSubview:v];
}

-(void)removeobjectAtIndex:(NSUInteger)index positon:(ATStackViewPosition)position{
    UIView *v;
    if(position == ATStackViewPositionHead){
        v = [self->arrangedSubviewsHead objectAtIndex:index];
    }else if(position == ATStackViewPositionCenter){
        v = [self->arrangedSubviewsCenter objectAtIndex:index];
    }else if(position == ATStackViewPositionTail){
        v = [self->arrangedSubviewsTail objectAtIndex:index];
    }
    [self removeArrangedSubview:v];
}

-(void)removeAll{
    [self removeAllWithPositon:ATStackViewPositionHead];
    [self removeAllWithPositon:ATStackViewPositionCenter];
    [self removeAllWithPositon:ATStackViewPositionTail];
}

-(void)removeAllWithPositon:(ATStackViewPosition)position{
    if(position == ATStackViewPositionHead){
        [self->arrangedSubviewsHead removeAllObjects];
    }else if(position == ATStackViewPositionCenter){
        [self->arrangedSubviewsCenter removeAllObjects];
    }else if(position == ATStackViewPositionTail){
        [self->arrangedSubviewsTail removeAllObjects];
    }
    self.isNeedLayout = true;
}

-(void)layoutFrame{
    self.isNeedLayout = false;
    if(self->arrangedSubviewsHead.count <= 0 && self->arrangedSubviewsCenter.count <= 0 && self->arrangedSubviewsTail.count <= 0){
        [self addSeparateLine];
        return;
    }
    if(self->arrangedSubviewsHead.count > 0){
        [self layoutHeadFrames];
    }
    if(self->arrangedSubviewsCenter.count > 0){
        [self layoutCenterFrames];
    }
    if(self->arrangedSubviewsTail.count > 0){
        [self layoutTailFrames];
    }
    [self addSeparateLine];
    
}

-(void)addSeparateLine{
    if (self.view.info.separateLine) {
        CGFloat x = self.view.info.separateLine.frame.origin.x;
        CGFloat y = self.view.frame.size.height - self.view.info.separateLine.frame.size.height;
        CGFloat w = self.view.frame.size.width - x - self.view.info.separateLine.frame.origin.y;
        CGFloat h = self.view.info.separateLine.frame.size.height;
        self.view.info.separateLine.frame = CGRectMake(x, y, w, h);
        [self.view addSubview: self.view.info.separateLine];
    }
}

- (CGRect)frame{
    CGFloat x = self.view.frame.origin.x + inset.left;
    CGFloat y = self.view.frame.origin.y + inset.top;
    CGFloat w = self.view.frame.size.width - inset.left - inset.right;
    CGFloat h = self.view.frame.size.height - inset.top - inset.bottom;
    return CGRectMake(x, y, w, h);
}


-(void)layoutHeadFrames{
    
}

-(void)layoutCenterFrames{
    
}

-(void)layoutTailFrames{
    
}

#pragma mark - ATStackInfoDelegate

-(void)stackInfoValueDidChange:(ATStackInfo *)info{
    self.isNeedLayout = true;
}

@end
