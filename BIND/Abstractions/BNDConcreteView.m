//
//  BNDConcreteView.m
//  BIND
//
//  Created by Marko Hlebar on 27/10/2014.
//  Copyright (c) 2014 Marko Hlebar. All rights reserved.
//


#import "BNDConcreteView.h"
#import "BNDBinding.h"

#define BND_VIEW_IMPLEMENTATION(__CLASS_NAME__) \
@implementation __CLASS_NAME__ \
@synthesize viewModel = _viewModel; \
- (void)setViewModel:(id <BNDViewModel> )viewModel { \
    [self willChangeValueForKey:@"viewModel"]; \
    _viewModel = viewModel; \
    [self didChangeValueForKey:@"viewModel"]; \
    for (BNDBinding *binding in self.bindings) { \
        [binding bindLeft:self withRight:self]; \
    } \
    [self viewDidUpdateViewModel:viewModel]; \
} \
- (void)viewDidUpdateViewModel:(id <BNDViewModel> )viewModel { \
} \
@end

BND_VIEW_IMPLEMENTATION(BNDTableViewCell)

BND_VIEW_IMPLEMENTATION(BNDView)

BND_VIEW_IMPLEMENTATION(BNDViewController)

#pragma mark - Platform Specific

#if TARGET_OS_IPHONE

BND_VIEW_IMPLEMENTATION(BNDCollectionViewCell)

#endif
