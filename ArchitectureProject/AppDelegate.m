//
//  AppDelegate.m
//  ArchitectureProject
//
//  Created by guoshencheng on 6/11/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "AppDelegate.h"
#import "MagicalRecordWorkaround.h"
#import "CoreData+MagicalRecord.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self initCoreDataWithMagicalRecord];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

- (void)initCoreDataWithMagicalRecord {
    [MagicalRecord setShouldAutoCreateManagedObjectModel:NO];
    NSURL *modelUrl = [[NSBundle mainBundle] URLForResource:@"ArchitectureProject" withExtension:@"momd"];
    NSManagedObjectModel *objectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelUrl];
    [NSManagedObjectModel MR_setDefaultManagedObjectModel:objectModel];
    [MagicalRecord setShouldDeleteStoreOnModelMismatch:YES];
    [MagicalRecordWorkaround setupCoreDataStackWithAutoMigratingSqliteStoreNamed:@"ArchitectureProject.sqlite"];
}


@end
