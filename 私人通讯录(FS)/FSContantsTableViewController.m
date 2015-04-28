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

//添加git

@interface FSContantsTableViewController () <UIActionSheetDelegate, FSAddViewControllerDeldgate, FSContantTableViewCellDelegate, FSEditViewControllerDelegate>

@property (strong, nonatomic) NSMutableArray *contantCells;

@end

@implementation FSContantsTableViewController

- (NSMutableArray *)contantCells {
    if (_contantCells == nil) {
        _contantCells = [NSMutableArray array];
    }
    return _contantCells;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
        editVc.delegate = self;
        editVc.editingCell = sender;
        editVc.initialContant = [(FSContantTableViewCell *)sender contant];
    }
    
}

#pragma mark FSEditViewController代理方法
- (void)editViewController:(FSEditViewController *)editViewController contantEditWillDone:(FSContantTableViewCell *)cell {
    NSLog(@"xxx");
    [self.tableView reloadData];
}

#pragma mark FSAddViewController代理方法
- (void)addViewController:(FSAddViewController *)addViewController addContant:(FSContant *)contant {
    //添加一行
    FSContantTableViewCell *contantTableViewCell = [FSContantTableViewCell contantTableViewCellWithContant:contant];
    contantTableViewCell.delegate = self;
    [self.contantCells addObject:contantTableViewCell];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.contantCells.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    static NSString *ID = @"Cell";
//    FSContantTableViewCell *contantTableViewCell = [tableView dequeueReusableCellWithIdentifier:ID];
//    if (contantTableViewCell == nil) {
//        contantTableViewCell = [FSContantTableViewCell contantTableViewCellWithName:[_contantCells[indexPath.row] name] phone:[_contants[indexPath.row] phone]];
//    }
//    
//    contantTableViewCell.nameLable.text = [_contants[indexPath.row] name];
//    
//    contantTableViewCell.phoneLable.text = [_contants[indexPath.row] phone];
    
    FSContantTableViewCell *contantTableViewCell = _contantCells[indexPath.row];
    [contantTableViewCell refresh];
//    NSLog(@"yyy");
    return contantTableViewCell;
}

#pragma mark - FSContantTableViewCell代理方法
- (void)contantTableViewCell:(FSContantTableViewCell *)contantTableViewCell clickWithContant:(FSContant *)contant {
//    NSLog(@"%s %@", __func__, contant);
    [self performSegueWithIdentifier:@"jumpToEdit" sender:contantTableViewCell];
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
