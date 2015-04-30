//
//  FSContantsTableViewController.m
//  私人通讯录(FS)
//
//  Created by 樊樊帅 on 15/4/27.
//  Copyright (c) 2015年 樊樊帅. All rights reserved.
//

#import "FSContantsTableViewController.h"
#import "FSAddViewController.h"
#import "FSContantTableViewCell.h"
#import "FSEditViewController.h"

#define FSContantsFilePath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"contants.data"]

//添加git

@interface FSContantsTableViewController () <UIActionSheetDelegate, FSAddViewControllerDeldgate, FSEditViewControllerDelegate>

@property (strong, nonatomic) NSMutableArray *contants;

@end

@implementation FSContantsTableViewController

- (NSMutableArray *)contants {
    if (_contants == nil) {
        _contants = [NSKeyedUnarchiver unarchiveObjectWithFile:FSContantsFilePath];
        if (_contants == nil) {
            _contants = [NSMutableArray array];
        }
    }
    return _contants;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight = 44;
}

//注销点击
- (IBAction)logOutClick:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"确定注销？" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"注销" otherButtonTitles:nil, nil];
    [actionSheet showInView:self.view];
}

#pragma mark UIActionSheet代理方法
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

//添加点击
- (IBAction)addClick:(id)sender {
    [self performSegueWithIdentifier:@"jumpToAdd" sender:nil];
}

//即将跳转
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"jumpToAdd"]) {
        FSAddViewController *addVc = segue.destinationViewController;
        addVc.delegate = self;
    } else if ([segue.identifier isEqualToString:@"jumpToEdit"]) {
//        NSLog(@"%@", [(FSContantTableViewCell *)sender contant]);
        FSEditViewController * editVc = segue.destinationViewController;
        editVc.contant = sender;
        editVc.delegate = self;
    }
}

#pragma mark FSEditViewController代理方法
- (void)editViewController:(FSEditViewController *)editViewController didEditContant:(FSContant *)contant {
    [self.tableView reloadData];
    //保存联系人列表
    [NSKeyedArchiver archiveRootObject:_contants toFile:FSContantsFilePath];
}

#pragma mark FSAddViewController代理方法
- (void)addViewController:(FSAddViewController *)addViewController addContant:(FSContant *)contant {
    //添加一行
    [self.contants addObject:contant];
    [self.tableView reloadData];
    
    //保存联系人列表
    [NSKeyedArchiver archiveRootObject:_contants toFile:FSContantsFilePath];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.contants.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FSContantTableViewCell *cell = [FSContantTableViewCell contantTableViewCellWithTableView:tableView];
    
    cell.contant = _contants[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"jumpToEdit" sender:_contants[indexPath.row]];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
