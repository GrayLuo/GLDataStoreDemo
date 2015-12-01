//
//  User.h
//  GLDataStoreDemo
//
//  Created by hyq on 15/12/1.
//  Copyright © 2015年 Grey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject<NSCoding>

@property (nonatomic,strong) NSString *name;
@property (nonatomic)  int age;
@property (nonatomic,strong) NSArray *skills;
@property (nonatomic,strong) NSDictionary *experience1;
@property (nonatomic,strong) NSArray *experiences;

- (void)description;
@end
