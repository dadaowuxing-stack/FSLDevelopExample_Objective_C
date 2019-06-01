//
//  FSLConstInline.h
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/1.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#ifndef FSLConstInline_h
#define FSLConstInline_h

/// 网络图片的占位图片
static inline UIImage *FSLWebImagePlaceholder(){
    return [UIImage imageNamed:@"placeholder_image"];
}

/// 网络头像
static inline UIImage *FSLWebAvatarImagePlaceholder(){
    return [UIImage imageNamed:@"DefaultProfileHead_66x66"];
}

/// 适配
static inline CGFloat FSLPxConvertToPt(CGFloat px){
    return ceil(px * [UIScreen mainScreen].bounds.size.width/414.0f);
}


/// 辅助方法 创建一个文件夹
static inline void FSLCreateDirectoryAtPath(NSString *path){
    BOOL isDir = NO;
    BOOL isExist = [[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDir];
    if (isExist) {
        if (!isDir) {
            [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
            [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
        }
    } else {
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    }
}
/// 微信重要数据备份的文件夹路径，通过NSFileManager来访问
static inline NSString *FSLWeChatDocDirPath(){
    return [FSLDocumentDirectory stringByAppendingPathComponent:FSL_WECHAT_DOC_NAME];
}
/// 通过NSFileManager来获取指定重要数据的路径
static inline NSString *FSLFilePathFromWeChatDoc(NSString *filename){
    NSString *docPath = FSLWeChatDocDirPath();
    FSLCreateDirectoryAtPath(docPath);
    return [docPath stringByAppendingPathComponent:filename];
}

/// 微信轻量数据备份的文件夹路径，通过NSFileManager来访问
static inline NSString *FSLWeChatCacheDirPath(){
    return [FSLCachesDirectory stringByAppendingPathComponent:FSL_WECHAT_CACHE_NAME];
}
/// 通过NSFileManager来访问 获取指定轻量数据的路径
static inline NSString *FSLFilePathFromWeChatCache(NSString *filename){
    NSString *cachePath = FSLWeChatCacheDirPath();
    FSLCreateDirectoryAtPath(cachePath);
    return [cachePath stringByAppendingPathComponent:filename];
}



#endif /* FSLConstInline_h */
