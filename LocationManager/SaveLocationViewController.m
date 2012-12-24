//
//  SaveLocationViewController.m
//  LocationManager
//
//  Created by Tahir on 11/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SaveLocationViewController.h"
#import "SaveCell.h"


@interface SaveLocationViewController ()

@end

@implementation SaveLocationViewController
@synthesize titleTextfield,telephoneTextfield,emailTextfield;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    titleTextfield.delegate = self;
    telephoneTextfield.delegate = self;
    emailTextfield.delegate = self;

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma Table View Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
// Return the number of rows in the section.
return 4;
}
/*
 - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
 // Return the number of sections.
 return 1;
 }*/


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

static NSString *CellIdentifier = @"Cell";


SaveCell *cell = (SaveCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
if (cell == nil) {
    //  cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        NSArray *toplevel = [[NSBundle mainBundle] loadNibNamed:@"SaveCell" owner:nil options:nil];
		
        for( id currentObject in toplevel){
			
            if ([currentObject isKindOfClass:[UITableViewCell class]]) {
                cell = (SaveCell *) currentObject;
                break;
            }
        }
    
}

 if(indexPath.row == 0)
{
       cell.title.text = @"Red";
    cell.icon.image = [UIImage imageNamed:@"red.png"];
}
    else if (indexPath.row == 1)
{
        cell.title.text = @"Blue";    
        cell.icon.image = [UIImage imageNamed:@"blue.png"];
}
    else if (indexPath.row == 2)
{
        cell.title.text = @"Green";
        cell.icon.image = [UIImage imageNamed:@"green.png"];
}
    else if(indexPath.row == 3)
{
        cell.title.text = @"Yellow";
        cell.icon.image = [UIImage imageNamed:@"yellow.png"];
}

return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {


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
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
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

#pragma Textfield - 
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField.returnKeyType == UIReturnKeyDefault) {
        [textField resignFirstResponder];
    }
    return true;
}


@end
