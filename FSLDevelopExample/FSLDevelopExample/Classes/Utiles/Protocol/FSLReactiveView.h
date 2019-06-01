//
//  FSLReactiveView.h
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/1.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
/// A protocol which is adopted by views which are backed by view models.
@protocol FSLReactiveView <NSObject>
/// Binds the given view model to the view.
///
/// viewModel - The view model
- (void)bindViewModel:(id)viewModel;

@end
