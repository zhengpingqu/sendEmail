//
//  ViewController.m
//  SendEmail
//
//  Created by 曲正平 on 2017/10/19.
//  Copyright © 2017年 曲正平. All rights reserved.
//

#import "ViewController.h"
#import <MessageUI/MessageUI.h>
@interface ViewController ()<MFMailComposeViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor greenColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    if(![MFMailComposeViewController canSendMail]) return;
    MFMailComposeViewController *vc = [[MFMailComposeViewController alloc] init];
    //设置邮件主题
    [vc setSubject:@"测试会议"];
    //设置邮件内容
    [vc setMessageBody:@"开会" isHTML:NO];
    //设置收件人列表
    [vc setToRecipients:@[@"test@qq.com"]];
    //设置抄送人列表
    [vc setCcRecipients:@[@"test1@qq.com"]];

    //设置代理
    
    UIImage *viewImage = [UIImage imageNamed:@"test.png"];
    NSData *imageData = UIImageJPEGRepresentation(viewImage, 1);
    //发送附件
    [vc addAttachmentData:imageData mimeType:@"image/jpg" fileName:@"test"];
    [vc setMessageBody:@"对账单" isHTML:NO];
    
    vc.mailComposeDelegate = self;
    //显示控制器
    [self presentViewController:vc animated:YES completion:nil];
    
}


- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    [controller dismissViewControllerAnimated:YES completion:nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
