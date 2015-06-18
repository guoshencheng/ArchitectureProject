//
//  ViewController.m
//  ArchitectureProject
//
//  Created by guoshencheng on 6/11/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
//    label.text = NSLocalizedString(@"author", nil);
//    [self.view addSubview:label];
    [[ApiService serviceWithDelegate:self] sendJSONRequest:[ApiRequest requestForTestServer]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)service:(ApiService *)service didFinishRequest:(ApiRequest *)request withResponse:(ApiResponse *)response {
    NSLog(@"%@", response);
}

@end
