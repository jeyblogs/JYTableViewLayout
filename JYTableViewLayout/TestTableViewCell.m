//
//  TestTableViewCell.m
//  LWEducation
//
//  Created by QS_Jey on 2020/11/23.
//

#import "TestTableViewCell.h"
//#import "MyControl.h"
//#import "UILabel+ChangeLineSpaceAndWordSpace.h"
#import <Masonry.h>

@interface TestTableViewCell ()
@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UILabel *phone;
@property (nonatomic, strong) UILabel *address;
@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, strong) UILabel *timeL;
@property (nonatomic, strong) UILabel *likeL;

@end

@implementation TestTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"TestClassCell";
    TestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[TestTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}
- (id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initUI];
    }
    return self;
}
- (void)setDataModel:(MyTestModel *)dataModel
{
    _dataModel = dataModel;
    _name.text = dataModel.name;
    _phone.text = dataModel.phone;
    _address.text = dataModel.address;
    _timeL.text = dataModel.dataTime;
//    [UILabel changeLineSpaceForLabel:_address WithSpace:5.0];
    _likeL.text = [NSString stringWithFormat:@"👍 %ld", dataModel.likesNum];
    [self layoutIfNeeded];
    if(self.dataModel.cellHeight == 0){
        [self layoutIfNeeded]; // 这里必须加, 因为这里是获取高度,相当于布局得刷新一遍
        self.dataModel.cellHeight = CGRectGetMaxY(_timeL.frame) + 15;
    }
}
- (void)layoutSubviews{
    [_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.mas_equalTo(15);
    }];
    [_phone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_name).offset(0);
        make.left.equalTo(_name.mas_right).offset(30);
        make.width.mas_equalTo(120);
    }];
    [_address mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_name).offset(0);
        make.top.equalTo(_name.mas_bottom).offset(10);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width - 120);
    }];
    [_timeL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_name).offset(0);
        make.top.equalTo(_address.mas_bottom).offset(10);
    }];
    [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.address).offset(-10);
        make.right.mas_equalTo(-15);
        make.width.mas_equalTo(80);
    }];
    [_likeL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_timeL.mas_top);
        make.right.mas_equalTo(-15);
    }];
    [super layoutSubviews];
}

- (void)setIndexPath:(NSIndexPath *)indexPath rowsInSection:(NSInteger)rows {
    
}
- (void)initUI {
    _name = [[UILabel alloc] init];
//    _name.backgroundColor = kRGB(220, 220, 220);
    _name.textColor = [UIColor redColor];
    _name.font = [UIFont fontWithName:@"HiraginoSans-W3"size:12+3];
    _name.lineBreakMode = NSLineBreakByWordWrapping;
    [self.contentView addSubview:_name];
    
    _phone = [[UILabel alloc] init];
    _phone.textColor = [UIColor blackColor];
//    _phone.backgroundColor = [UIColor lightGrayColor];
    _phone.font = [UIFont fontWithName:@"HiraginoSans-W3"size:12+3];
    _phone.lineBreakMode = NSLineBreakByWordWrapping;
    _phone.adjustsFontSizeToFitWidth = YES;
    _phone.numberOfLines = 0;
//    _phone.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:_phone];
    
    _address = [[UILabel alloc] init];
    _address.textColor = [UIColor blackColor];
    _address.font = [UIFont fontWithName:@"HiraginoSans-W3"size:14];
    _address.lineBreakMode = NSLineBreakByWordWrapping;
    _address.adjustsFontSizeToFitWidth = YES;
    _address.numberOfLines = 0;
    [self.contentView addSubview:_address];
    
//    _btn = [MyControl createButtonWithTitel:@"接单" titelColor:[UIColor orangeColor] titelFont:15];
//    _btn.backgroundColor = kRGB(200, 200, 200);
//    [_btn.layer setCornerRadius:5.0];
//    _btn.layer.borderColor = [[UIColor blackColor] CGColor];//设置边框颜色
//    _btn.layer.borderWidth = 1.0f;//设置边框颜色
//    [[_btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
//        NSLog(@"click-%@",x);
////        [self.cellViewModel.operationCmd execute:self.cellViewModel];
//    }];
//    [self.contentView addSubview:_btn];
    
    _timeL = [[UILabel alloc] init];
    _timeL.textColor = [UIColor grayColor];
    _timeL.font = [UIFont fontWithName:@"HiraginoSans-W3"size:13];
    [self.contentView addSubview:_timeL];
    
    _likeL = [[UILabel alloc] init];
//    _likeL.textColor = [UIColor blueColor];
//    _likeL.backgroundColor = [UIColor lightGrayColor];
    _likeL.font = [UIFont fontWithName:@"HiraginoSans-W3"size:13];
    _likeL.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:_likeL];
}
@end
