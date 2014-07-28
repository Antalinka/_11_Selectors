//
//  AppDelegate.m
//  _11_Selectors
//
//  Created by Exo-terminal on 3/16/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import "AppDelegate.h"
#import "GRObject.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
   /* GRObject* obj = [[GRObject alloc]init];
    
    
    SEL selector1 = @selector(testMethod);
//    SEL selector2 = @selector(testMethod:);
//    SEL selector3 = @selector(testMethod:parameter2:);
    
    [self performSelector:selector1];
    [obj performSelector:selector1];
//    [self performSelector:@selector(testMethodParameter1:)withObject:[NSNumber numberWithInt:11]];
    
    NSString* a = NSStringFromSelector(selector1);// создает строку из селекторв
    SEL sel = NSSelectorFromString(a);// создает селектор из строки
    
    
    NSString* secret = [obj performSelector:@selector(superSecretText)];
    
     NSLog(@"%@",secret);
    
//    [self performSelector:selector2 withObject:@"testString"];
//    [self performSelector:selector3 withObject:@"string1" withObject:@"string2"];
//    [self performSelector:selector1 withObject:nil afterDelay:5.f];
    
//    [self performSelector:@selector(testMethod)];
    */
    
//    NSString* string = [self testMethodParameter1:3 parameter2:3.4f parameter3:5.5f];
//    NSLog(@"%@",string);
    SEL selector = @selector(testMethodParameter1:parameter2:parameter3:);
    NSMethodSignature* signature = [AppDelegate instanceMethodSignatureForSelector:selector];
    NSInvocation* invocation = [NSInvocation invocationWithMethodSignature:signature];
    
    [invocation setTarget:self];
    [invocation setSelector:selector];
    
    NSInteger iVar = 3;
    CGFloat iFloat = 3.2f;
    double iDouble = 5.5f;
    
    NSInteger* p1 = &iVar;
    CGFloat* p2 = &iFloat;
    double* p3 = &iDouble;
    
    [invocation setArgument:p1 atIndex:2];
    [invocation setArgument:p2 atIndex:3];
    [invocation setArgument:p3 atIndex:4];
    
    [invocation invoke];

    __unsafe_unretained NSString* string = nil;
//    NSString** p4 = &string;
    
    [invocation getReturnValue:&string];
    
    NSLog(@"%@",string);
    
    return YES;
}
-(void)testMethod{
    NSLog(@"test Method");
}
-(void)testMethod:(NSString*) string{
    NSLog(@"test Method: %@",string);
}
-(void)testMethod:(NSString*) string parameter2:(NSString*)string2{
    NSLog(@"test Method:parameter2 %@, %@",string,string2);
}
-(NSString*)testMethodParameter1:(NSInteger)intValue parameter2:(CGFloat) floatValue parameter3:(double) doubleValue{
    return [NSString stringWithFormat:@"testMethodParameter1: %d,parameter2: %f,parameter3:%f",intValue, floatValue, doubleValue];
    
}- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
