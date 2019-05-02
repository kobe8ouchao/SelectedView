#define kLJItemWidth 100
#import "SelectedView.h"
@implementation SelectedView    {
    
    UIScrollView *scrollview;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        scrollview = ({
            UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake((self.frame.size.width - kLJItemWidth)/2
                                                                                  , 0, kLJItemWidth, frame.size.height)];
            scroll.backgroundColor = [UIColor clearColor
                                      ];
            scroll.pagingEnabled = YES;
            scroll.clipsToBounds = NO;
            scroll.showsHorizontalScrollIndicator = NO;
            scroll;
        })                                                                                      ;
        self.clipsToBounds = YES;
        NSArray *name = @[@"Vol",@"Chg%",@"PS",@"PE",@"PB"];
       
        UIView *center = [[UIView alloc] initWithFrame:CGRectMake((self.frame.size.width - kLJItemWidth)/2,0,kLJItemWidth,44.0)];
        center.backgroundColor = [UIColor redColor];
        [self addSubview:center];
        [self addSubview:scrollview];
        [self loadImages:name];
        [scrollview setContentOffset:CGPointMake((self.frame.size.width - kLJItemWidth)/2-10, 0)];
    }
    
    return self;
}

-(void)loadImages:(NSArray *)array{
    int index = 0;
    [scrollview.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    for(NSString * name in array){
        UILabel *iv = [[UILabel alloc] initWithFrame:CGRectMake(index * kLJItemWidth, 0, kLJItemWidth, 44)];
        iv.text = name;
        iv.textAlignment = NSTextAlignmentCenter;
        iv.textColor = [UIColor blackColor];
        iv.backgroundColor = [UIColor clearColor];
        [scrollview addSubview:iv];
        index++;
    }
    scrollview.contentSize = CGSizeMake(scrollview.frame.size.width*index, 0);
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *view = [super hitTest:point withEvent:event];
    if ([view isEqual:self])
    {
        for (UIView *subview in scrollview.subviews)
        {
            CGPoint offset = CGPointMake(point.x - scrollview.frame.origin.x + scrollview.contentOffset.x - subview.frame.origin.x,
                                         point.y - scrollview.frame.origin.y + scrollview.contentOffset.y - subview.frame.origin.y);
            
            if ((view = [subview hitTest:offset withEvent:event]))
            {
                return view;
            }
        }
        return scrollview;
    }
    return view;
}

@end
