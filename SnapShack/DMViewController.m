//
//  DMViewController.m
//  SnapShack
//
//  Created by Hamdy on 6/5/14.
//  Copyright (c) 2014 Ahmed Hamdy. All rights reserved.
//

#import "DMViewController.h"

@interface DMViewController ()

@end

@implementation DMViewController
@synthesize imageView,shotView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self resignFirstResponder];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)canBecomeFirstResponder
{
    return YES;
}

// Become first responder whenever the view appears
//- (void)viewDidAppear:(BOOL)animated {
//    [super viewDidAppear:animated];
//    [self becomeFirstResponder];
//}

//-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
//
//// //   [[NSNotificationCenter defaultCenter] addObserver:self
////                                             selector:@selector(shake) name:@"shake" object:nil];
//
//    if(event.type == UIEventTypeMotion && event.subtype == UIEventSubtypeMotionShake)
//        NSLog(@"motion Began");
//}
-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    // //   [[NSNotificationCenter defaultCenter] addObserver:self
    //                                             selector:@selector(shake) name:@"shake" object:nil];
    if(event.type == UIEventTypeMotion && event.subtype == UIEventSubtypeMotionShake)
        NSLog(@"motion Ended");
    UIGraphicsBeginImageContext(shotView.bounds.size);
    [shotView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSData * data = UIImagePNGRepresentation(image);
    imageView.image=[UIImage imageWithData:data];
    //[data writeToFile:@"foo.png" atomically:YES];
}
//-(void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event {
////    [[NSNotificationCenter defaultCenter] addObserver:self
////                                             selector:@selector(shake) name:@"shake" object:nil];
//    if(event.type == UIEventTypeMotion && event.subtype == UIEventSubtypeMotionShake)
//        NSLog(@"motion Cancelled");
//}

@end
