#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OpenCVWrapper : NSObject
+ (double)calculateSSIMBetweenImage:(UIImage *)image1 andImage:(UIImage *)image2;
@end

NS_ASSUME_NONNULL_END
