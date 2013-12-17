//
//  Config.m
//  Teleton
//
//  Created by Javi on 10/24/13.
//  Copyright (c) 2013 Javi. All rights reserved.
//

#import "Config.h"


@interface Config ()

@property (nonatomic, strong) NSDictionary *contents;

@end

@implementation Config

+ (Config *)instance
{
    static Config *sharedInstance = nil;
    static dispatch_once_t onceToken = 0;
    dispatch_once(&onceToken, ^{
        sharedInstance = [Config new];
        [sharedInstance loadContents];
    });
    return sharedInstance;
}

- (NSString *)shareMessage
{
    return [self.contents objectForKey:@"ShareMessage"];
}

- (NSURL *)shareURL
{
    NSString *stringURL = [self.contents objectForKey:@"ShareURL"];
    return [NSURL URLWithString:stringURL];
}

- (NSString *)textNumber
{
    return [self.contents objectForKey:@"TextNumber"];
}

- (NSString *)bitsNumber
{
    return [self.contents objectForKey:@"BitsNumber"];
}

- (NSArray *)callOptions
{
    NSDictionary *callNumbersDict = [self.contents objectForKey:@"CallNumbers"];
    return [callNumbersDict.allKeys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSNumber *n1 = obj1;
        NSNumber *n2 = obj2;
        return n1.floatValue > n2.floatValue;
    }];
}

- (NSArray *)bitsOptions
{
   return [self.contents objectForKey:@"BitsAmounts"];
}

- (NSString *)callNumberForOption:(NSString *)option
{
    NSDictionary *callNumbersDict = [self.contents objectForKey:@"CallNumbers"];
    return [callNumbersDict objectForKey:option];
}

- (NSURL *)websiteURL
{
    NSString *stringURL = [self.contents objectForKey:@"WebsiteURL"];
    return [NSURL URLWithString:stringURL];
}

- (NSURL *)sistarbancURL
{
    NSString *stringURL = [self.contents objectForKey:@"SistarbancURL"];
    return [NSURL URLWithString:stringURL];
}

#pragma mark - Private
- (void)loadContents
{
    NSString *path =[[NSBundle mainBundle] pathForResource:@"Teleton" ofType:@"plist"];
    self.contents = [NSDictionary dictionaryWithContentsOfFile:path];
}

@end
