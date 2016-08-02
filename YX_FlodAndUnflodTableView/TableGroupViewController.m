//
//  TableGroupViewController.m
//  YX_FlodAndUnflodTableView
//
//  Created by yang on 16/8/2.
//  Copyright © 2016年 poplary. All rights reserved.
//

#import "TableGroupViewController.h"

@interface TableGroupViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSArray *firArr;
@property(nonatomic, strong) NSArray *sectionArr;
@property(nonatomic) BOOL index;
@property(nonatomic, strong) NSMutableArray *saveIndexArr;
@end

@implementation TableGroupViewController

-(NSArray *)sectionArr{
    if (_sectionArr == nil) {
        _sectionArr = [[NSArray alloc]initWithObjects:
                       @[@"qq",@"ww",@"dd"],
                       @[@"34",@"35"],
                       @[@"//",@"##",@"&*"],
                       nil];
    }
    return _sectionArr;
}
-(NSMutableArray *)saveIndexArr{
    if (_saveIndexArr == nil) {
        _saveIndexArr = [NSMutableArray array];
    }
    return _saveIndexArr;
}
-(UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.sectionArr.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    if ([[self.saveIndexArr objectAtIndex:section] isEqualToString:@"1"]) {
        
        return [[self.sectionArr objectAtIndex:section] count];
    }else{
        return 0;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [[self.sectionArr objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    return cell;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    for (int i = 0; i<self.sectionArr.count; i++) {
       
        [self.saveIndexArr addObject:@"0"];
      
    }
    [self.view addSubview:self.tableView];
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 40)];
    view.backgroundColor = [UIColor grayColor];
    UIButton *btn = [[UIButton alloc]initWithFrame:view.frame];
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTag:section];
    [view addSubview:btn];
    return view;
}
-(void)click:(UIButton *)sender{
    
    if ([[self.saveIndexArr objectAtIndex:sender.tag]isEqualToString:@"0"]) {
        [self.saveIndexArr replaceObjectAtIndex:sender.tag withObject:@"1"];
    }else if([[self.saveIndexArr objectAtIndex:sender.tag]isEqualToString:@"1"]){
        [self.saveIndexArr replaceObjectAtIndex:sender.tag withObject:@"0"];
    }
    
    [self.tableView reloadData];


    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
