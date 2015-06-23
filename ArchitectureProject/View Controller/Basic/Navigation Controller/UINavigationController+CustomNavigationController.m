//
//  UINavigationController+CustomNavigationController.m
//  ArchitectureProject
//
//  Created by guoshencheng on 6/23/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "UINavigationController+CustomNavigationController.h"
#import "UIScreen+Utility.h"

@implementation UINavigationController (CustomNavigationController)

- (void)cubeRightPushViewController:(UIViewController *)viewController {
    CATransition *transition = [CATransition animation];
    transition.duration = 0.5f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = @"cube";
    transition.subtype = kCATransitionFromRight;
    [self.view.layer addAnimation:transition forKey:nil];
    [self pushViewController:viewController animated:NO];
}

- (void)cubeLeftPopViewController {
    CATransition *transition = [CATransition animation];
    transition.duration = 0.5f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = @"cube";
    transition.subtype = kCATransitionFromLeft;
    [self.view.layer addAnimation:transition forKey:nil];
    [self popToRootViewControllerAnimated:NO];
}

- (void)presentPushViewController:(UIViewController *)viewController {
    CATransition *transition = [CATransition animation];
    transition.duration = 0.5f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionMoveIn;
    transition.subtype = kCATransitionFromTop;
    [self.view.layer addAnimation:transition forKey:nil];
    [self pushViewController:viewController animated:NO];
}

- (void)fadePushViewController:(UIViewController *)viewController {
    CATransition *transition = [CATransition animation];
    transition.duration = 0.2f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    [self.view.layer addAnimation:transition forKey:nil];
    [self pushViewController:viewController animated:NO];
}

- (void)fadePopViewController {
    CATransition *transition = [CATransition animation];
    transition.duration = 0.2f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    [self.view.layer addAnimation:transition forKey:nil];
    [self popViewControllerAnimated:NO];
}

- (void)pushViewControllerFromRight:(UIViewController*)viewController {
    CATransition *transtion = [CATransition animation];
    transtion.duration = 0.2;
    transtion.type = kCATransitionMoveIn;
    transtion.subtype = kCATransitionFromRight;
    [self.view.layer addAnimation:transtion forKey:kCATransition];
    [self pushViewController:viewController animated:NO];
}

- (void)zoomInPushController:(UIViewController *)controller {
    UIView *whiteView = [[UIView alloc] initWithFrame:[UIScreen bounds]];
    whiteView.backgroundColor = [UIColor whiteColor];
    UIGraphicsBeginImageContextWithOptions(self.view.frame.size, YES, 1);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.view.layer renderInContext:context];
    CGImageRef cgimage = UIGraphicsGetImageFromCurrentImageContext().CGImage;
    UIImage *image = [[UIImage alloc] initWithCGImage:cgimage];
    UIGraphicsEndImageContext();
    
    UIImageView *currentVCViewScreenShot = [[UIImageView alloc] initWithImage:image];
    currentVCViewScreenShot.alpha = 1;
    controller.view.alpha = 0;
    [self.view addSubview:whiteView];
    [self.view addSubview:currentVCViewScreenShot];
    [self pushViewController:controller animated:NO];
    CGAffineTransform t = currentVCViewScreenShot.transform;
    
    [UIView animateWithDuration:0.2 animations:^{
        currentVCViewScreenShot.alpha = 0;
        currentVCViewScreenShot.transform = CGAffineTransformScale(t, 1.8, 1.8);
    } completion:^(BOOL finished) {
        controller.view.alpha = 1;
        [currentVCViewScreenShot removeFromSuperview];
        [whiteView removeFromSuperview];
    }];
}

- (void)zoomOutPopController:(UIViewController *)controller andView:(UIView *)view andFrame:(CGRect)frame {
    UIView *whiteView = [[UIView alloc] initWithFrame:view.frame];
    whiteView.backgroundColor = [UIColor whiteColor];
    UIView *blackView = [[UIView alloc] initWithFrame:[UIScreen bounds]];
    blackView.backgroundColor = [UIColor blackColor];
    blackView.alpha = 1;
    [self.view addSubview:blackView];
    [self.view addSubview:whiteView];
    [self.view addSubview:view];
    [self popViewControllerAnimated:NO];
    
    CGAffineTransform t = view.transform;
    CGFloat scaleX = (CGFloat)frame.size.width / view.frame.size.width;
    CGFloat scaleY = (CGFloat)frame.size.height / view.frame.size.height;
    
    [UIView animateWithDuration:0.2 animations:^{
        view.transform = CGAffineTransformScale(t, scaleX, scaleY);
        view.frame = frame;
        whiteView.frame = frame;
        view.alpha = 0;
        blackView.alpha = 0;
    } completion:^(BOOL finished) {
        [blackView removeFromSuperview];
        [whiteView removeFromSuperview];
        [view removeFromSuperview];
    }];
}


@end
