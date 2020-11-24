//
//  ViewController.m
//  JYTableViewLayout
//
//  Created by QS_Jey on 2020/11/24.
//

#import "ViewController.h"

#import "MJRefreshBackNormalFooter.h"
#import "MJRefreshBackGifFooter.h"
#import "MJRefreshAutoNormalFooter.h"
#import "MJRefreshAutoGifFooter.h"
#import "MJRefreshNormalHeader.h"
#import "MJRefreshGifHeader.h"
#import "TestTableViewCell.h"
#import "CMRequest.h"
#import "MyTestModel.h"
#import "NSObject+YYModel.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    NSInteger page;
}
@property (nonatomic, strong) CMRequest *request;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
//    self.tableView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64 - 49);
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[TestTableViewCell class] forCellReuseIdentifier:@"testcell"];
    _tableView.contentInset  = UIEdgeInsetsMake(0, 0, 0, 0);
    [self.view addSubview:_tableView];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.dataArray = [[NSMutableArray alloc] init];
    self.automaticallyAdjustsScrollViewInsets = NO;

    page = 0;
    [self requestData];
    [self setupRefresh];
}

- (void)setupRefresh
{
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
    }];
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(requestData)];
    
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
    }];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(requestFirstData)];
}
- (void)requestFirstData
{
    page = 0;
    [self.dataArray removeAllObjects];
    [self requestData];
}

- (CMRequest *)request {
    if (!_request) {
        _request = [CMRequest request];
    }
    return _request;
}
- (void)requestData
{
    page ++;
    [self.request POST:@"https://www.fastmock.site/mock/02a133ad9ed94ba5bfb97aff205f75c9/test/banner" parameters:nil success:^(CMRequest *request, NSString *responseString) {
        [self.tableView.mj_footer endRefreshing];
        [self.tableView.mj_header endRefreshing];
        NSData *jsonData = [responseString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error;
        id jsonClass = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
        NSArray *dataList = [[jsonClass objectForKey:@"data"] objectForKey:@"list"];
        NSArray *parsedObjects = [NSArray yy_modelArrayWithClass:[MyTestModel class] json:dataList];
        [self.dataArray  addObjectsFromArray:parsedObjects];
        [self.tableView reloadData];
        
    } failure:^(CMRequest *request, NSError *error) {

    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyTestModel *model = self.dataArray[indexPath.row];
    return model.cellHeight;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TestTableViewCell * cell = [TestTableViewCell cellWithTableView:tableView];
    [cell setDataModel:[self.dataArray objectAtIndex:indexPath.row]];
    return cell;
}
@end

