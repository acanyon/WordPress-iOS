#import <UIKit/UIKit.h>
#import "Category.h"

@interface WPCategoryTree : NSObject

@property (nonatomic, strong) Category *parent;
@property (nonatomic, strong) NSMutableArray *children;

- (id)initWithParent:(Category *)parent;
- (NSArray *)getAllObjects;
- (void)getChildrenFromObjects:(NSArray *)collection;

@end
