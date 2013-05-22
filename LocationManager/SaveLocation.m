//
//  SaveLocation.m
//  LocationManager
//
//  Created by Tahir Öz on 3/17/13.
//
//

#import "SaveLocation.h"
#import "InfoCell.h"

@interface SaveLocation ()

@end

@implementation SaveLocation

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    //  	return [list count];
    return 6;
}

// - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
// // Return the number of sections.
// return 2;
// }

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
	
    InfoCell *cell = (InfoCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
       // cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        NSArray *toplevel = [[NSBundle mainBundle] loadNibNamed:@"InfoCell" owner:nil options:nil];
		
		for( id currentObject in toplevel){
			
			if ([currentObject isKindOfClass:[InfoCell class]]) {
				cell = (InfoCell *) currentObject;
				break;
			}
		}
    }

    switch (indexPath.row) {
        case 0:
            cell.myField.placeholder = @"Title";
            break;
        case 1:
            cell.myField.placeholder = @"Adress";
            break;
        case 2:
            cell.myField.placeholder = @"Telephone";
            break;
        case 3:
            cell.bounds = CGRectMake(0, 0, 320, 120);
            cell.myField.placeholder = @"Notes";
            break;
        case 4:
            cell.myField.placeholder = @"Color";
            break;
        case 5:
            cell.myField.placeholder = @"Photo";
            break;
            
        default:
            break;
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
   
    
}
@end
