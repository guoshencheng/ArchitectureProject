//
//  DemoOneViewController.m
//  ArchitectureProject
//
//  Created by guoshencheng on 6/23/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "DemoOneViewController.h"
#import "UINavigationController+CustomNavigationController.h"
#import "DemoTwoViewController.h"

@implementation DemoOneViewController

+ (instancetype)create {
    return [[DemoOneViewController alloc] initWithNibName:@"DemoOneViewController" bundle:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    //    label.text = NSLocalizedString(@"author", nil);
    //    [self.view addSubview:label];
    [[ApiService serviceWithDelegate:self] sendJSONRequest:[ApiRequest requestForTestServer]];
    [self toast:@"completecompletecompletecompletecompletecompletecompletecomplete" complete:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)service:(ApiService *)service didFinishRequest:(ApiRequest *)request withResponse:(ApiResponse *)response {
    NSLog(@"%@", response);
}

- (IBAction)didClickPushViewControllerButton:(id)sender {
    [self.navigationController cubeRightPushViewController:[DemoTwoViewController create]];
}

@end
