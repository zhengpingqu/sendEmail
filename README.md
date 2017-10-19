# sendEmail
iOS  调用系统邮箱发邮件（带附件）
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
