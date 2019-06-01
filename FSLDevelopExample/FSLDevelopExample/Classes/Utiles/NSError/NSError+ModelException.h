//
//  NSError+ModelException.h
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/1.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError (ModelException)
// Creates a new error for an exception that occured during updating an
// MTLModel.
//
// exception - The exception that was thrown while updating the model.
//             This argument must not be nil.
//
// Returns an error that takes its localized description and failure reason
// from the exception.
+ (instancetype)fsl_modelErrorWithException:(NSException *)exception;
@end
