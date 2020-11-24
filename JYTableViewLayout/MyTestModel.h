//
//  TestModel.h
//  LWEducation
//
//  Created by QS_Jey on 2020/11/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyTestModel : NSObject

@property (nonatomic, readwrite, copy) NSString *name;
@property (nonatomic, readwrite, copy) NSString *orderId;
@property (nonatomic, readwrite, strong) NSURL *headImgUrl;
@property (nonatomic, readwrite, copy) NSString *address;
/// 用户性别 0 - 男 1 - 女
@property (nonatomic, readwrite, copy) NSString *phone;
@property (nonatomic, readwrite, assign) NSInteger likesNum;
@property (nonatomic, readwrite, copy) NSString *dataTime;
@property (nonatomic, readwrite, copy) NSString *arrivalTime;
@property (nonatomic, readwrite, assign) float orderPrice;
@property (nonatomic, readwrite, copy) NSString *beizhu;

@property (nonatomic, assign) float cellHeight;

@end

NS_ASSUME_NONNULL_END
