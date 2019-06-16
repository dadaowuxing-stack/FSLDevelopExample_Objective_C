//
//  FSLMomentPhotoItemViewModel.h
//  FSLDevelopExample
//
//  Created by senba on 2017/7/12.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSLMomentCommentItemViewModel.h"

@interface FSLMomentPhotoItemViewModel : NSObject

/// picture
@property (nonatomic, readwrite, strong) FSLPicture *picture;


/// init
- (instancetype)initWithPicture:(FSLPicture *)picture;

@end
