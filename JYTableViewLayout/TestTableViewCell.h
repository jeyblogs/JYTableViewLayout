//
//  TestTableViewCell.h
//  LWEducation
//
//  Created by QS_Jey on 2020/11/23.
//

#import <UIKit/UIKit.h>
#import "MyTestModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TestTableViewCell : UITableViewCell

@property (nonatomic, strong)MyTestModel *dataModel;

+ (TestTableViewCell *)cellWithTableView:(UITableView *)table;

@end

NS_ASSUME_NONNULL_END
