//
//  ViewController.m
//  GLDataStoreDemo
//
//  Created by hyq on 15/12/1.
//  Copyright © 2015年 Grey. All rights reserved.
//

#import "ViewController.h"
#import "User.h"

#define kName @"name"
#define kAge  @"age"
#define kSkills @"skills"
#define kExperience1 @"experience1"
#define kExperiences @"experiences"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /*
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *name = [userDefault objectForKey:kName];
    if (name) {
        [self normalUserdefaultTestRead];
    }else{
        NSLog(@"......None Data in UserDefault ......");
        [self normalUserdefaultTestWrite];
        [self normalUserdefaultTestRead];
    }
     */
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *name = [userDefault objectForKey:@"user"];
    if(!name){
        [self customObjectTestWrite];
    }else{
        [self customObjectTestRead];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)normalUserdefaultTestWrite{
    
    //build test data
    NSString *name = @"Grey.luo";
    NSNumber *age = @18;
    NSArray *skills = @[@"扯蛋",@"寻蛋",@"生蛋"];
    NSDictionary *experience1 = @{@"content":@"嵌入式开发",@"address":@"成都青羊"};
    NSDictionary *experience2 = @{@"content":@"iOS开发",@"address":@"成都高新"};
    NSDictionary *experience3 = @{@"content":@"全栈开发",@"address":@"成都高新区"};
    NSArray *experiences = @[experience1,experience2,experience3];
    
    //存入数据
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:name forKey:kName];
    [userDefault setObject:age forKey:kAge];
    [userDefault setObject:skills forKey:kSkills];
    [userDefault setObject:experience1 forKey:kExperience1];
    [userDefault setObject:experiences forKey:kExperiences];
    [userDefault synchronize];//同步写入磁盘
    
}

- (void)normalUserdefaultTestRead{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *name = [userDefault objectForKey:kName];
    NSNumber *age = [userDefault objectForKey:kAge];
    NSArray *skills = [userDefault objectForKey:kSkills];
    NSDictionary *experience1 = [userDefault objectForKey:kExperience1];
    NSArray *experiences  = [userDefault objectForKey:kExperiences];
    
    NSLog(@"name : %@",name);
    NSLog(@"age : %@",age);
    NSLog(@"skills : %@",[skills description]);
    NSLog(@"experience1 : %@",[experience1 description]);
    NSLog(@"experiences : %@",[experiences description]);
    
}


- (void)customObjectTestWrite{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    User *user = [[User alloc]init];
    user.name = @"Grey.luo";
    user.age = 18;
    user.skills = @[@"扯蛋",@"寻蛋",@"生蛋"];
    
    NSDictionary *experience1 = @{@"content":@"嵌入式开发",@"address":@"成都青羊"};
    NSDictionary *experience2 = @{@"content":@"iOS开发",@"address":@"成都高新"};
    NSDictionary *experience3 = @{@"content":@"全栈开发",@"address":@"成都高新区"};

    NSArray *experiences = @[experience1,experience2,experience3];
    user.experience1 = experience1;
    user.experiences = experiences;
    
    NSData *userData = [NSKeyedArchiver archivedDataWithRootObject:user];
    [userDefault setObject:userData forKey:@"user"];
    [userDefault synchronize];
}


- (void)customObjectTestRead{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    NSData *data = [userDefault objectForKey:@"user"];
    User *user = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    [user description];
    
}
@end
