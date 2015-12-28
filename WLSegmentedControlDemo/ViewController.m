//
//  ViewController.m
//  WLSegmentedControlDemo
//
//  Created by Veilly on 15/12/22.
//  Copyright © 2015年 com.zhezhuo. All rights reserved.
//

#import "ViewController.h"
#import "WLSegmentedControl.h"


#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *selectedIndexLabel;
@property (strong, nonatomic) WLSegmentedControl *segmentedControl;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.segmentedControl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showSepLineSwitchTapped:(id)sender {
    self.segmentedControl.hiddenSeparatorLine=![(UISwitch *)sender isOn];
}
- (IBAction)showButtomLineSwitchTapped:(id)sender {
    self.segmentedControl.hiddenButtomLine=![(UISwitch *)sender isOn];
}

- (WLSegmentedControl *)segmentedControl
{
    if (_segmentedControl) {
        return _segmentedControl;
    }
    _segmentedControl = [[WLSegmentedControl alloc] initWithItems:@[@"上衣",@"外套",@"连衣裙",@"裤子",@"鞋子"] andFrame:CGRectMake(0,SCREENHEIGHT/2,SCREENWIDTH,30)];
    _segmentedControl.backgroundColor = [UIColor clearColor];
    __block typeof(self) vc= self;
    _segmentedControl.itemSelectedAtIndex = ^(NSInteger index)
    {
        vc.selectedIndexLabel.text = [NSString stringWithFormat:@"当前选中的是：%ld",(long)index];
    };
    return _segmentedControl;
}
@end
