//
//  SaveLocationViewController.h
//  LocationManager
//
//  Created by Tahir on 11/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SaveLocationViewController : UIViewController<UITableViewDelegate,UITextFieldDelegate>

@property(nonatomic,retain)IBOutlet UITextField *titleTextfield;
@property(nonatomic,retain)IBOutlet UITextField *telephoneTextfield;
@property(nonatomic,retain)IBOutlet UITextField *emailTextfield;

@end
