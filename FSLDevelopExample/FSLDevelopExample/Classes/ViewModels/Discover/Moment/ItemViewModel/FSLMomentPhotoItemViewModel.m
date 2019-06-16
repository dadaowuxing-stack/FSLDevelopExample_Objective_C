//
//  FSLMomentPhotoItemViewModel.m
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2017/7/12.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//  配图中单张图片的视图模型

#import "FSLMomentPhotoItemViewModel.h"


@implementation FSLMomentPhotoItemViewModel

- (instancetype)initWithPicture:(FSLPicture *)picture
{
    if(self = [super init])
    {
        self.picture = picture;
    }
    
    return self;
}

@end
