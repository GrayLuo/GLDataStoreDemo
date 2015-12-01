//
//  User.m
//  GLDataStoreDemo
//
//  Created by hyq on 15/12/1.
//  Copyright © 2015年 Grey. All rights reserved.
//

#import "User.h"

@implementation User
- (id)initWithCoder:(NSCoder *)coder{
    self = [super init];
    if (self) {
        _name = [coder decodeObjectForKey:@"name"];
        _age = [coder decodeIntForKey:@"age"];
        _skills = [coder decodeObjectForKey:@"skills"];
        _experience1 = [coder decodeObjectForKey:@"experience1"];
        _experiences = [coder decodeObjectForKey:@"experiences"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder{
    [coder encodeObject:_name forKey:@"name"];
    [coder encodeInt:_age forKey:@"age"];
    [coder encodeObject:_skills forKey:@"skills"];
    [coder encodeObject:_experience1 forKey:@"experience1"];
    [coder encodeObject:_experiences forKey:@"experiences"];
}

- (void)description{
    NSLog(@"name : %@",_name);
    NSLog(@"age : %d",_age);
    NSLog(@"skills : %@",[_skills description]);
    NSLog(@"experience1 : %@",[_experience1 description]);
    NSLog(@"experiences : %@",[_experiences description]);
}
@end

