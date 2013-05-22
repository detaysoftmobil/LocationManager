//
//  InfoCell.m
//  LocationManager
//
//  Created by Tahir Öz on 3/17/13.
//
//

#import "InfoCell.h"

@implementation InfoCell
@synthesize myField;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
