//
//  QGSecondViewController.m
//  iosZH2014
//
//  Created by PPKE-IMAC-4 on 2014.05.23..
//  Copyright (c) 2014 Quintz Gábor. All rights reserved.
//

#import "QGSecondViewController.h"
#import "Albums.h"
#import "Photo.h"


@interface QGSecondViewController ()
@property (strong, nonatomic) NSMutableData *data;
@end

@implementation QGSecondViewController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
    static NSString *simpleTableIdentifier = @"elem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [[[self.adatok objectForKey:@"albums"] objectAtIndex:indexPath.row] objectForKey:@"albumName"];
    return cell;
     */
    return nil;
 }


- (void)download{
    NSURL *url = [NSURL URLWithString:jsonFile];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:60];
    [NSURLConnection connectionWithRequest:request delegate:self];
}

- (void)downloadWithBlocks{
    NSURL *url = [NSURL URLWithString:jsonFile];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:60];
    
    NSOperationQueue *bgQueue = [[NSOperationQueue alloc] init];
    
    [NSURLConnection sendAsynchronousRequest:request queue:bgQueue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {

        if(connectionError){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:connectionError.localizedDescription delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Retry", nil];
            [alert show];
        } else {
           
            NSError *e = nil;
            NSMutableDictionary *adatok = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: &e];
            NSLog(@"%@", adatok);
            
            if (!adatok) {
                NSLog(@"Error parsing JSON: %@", e);
            } else {
                for(NSDictionary *album in [adatok objectForKey:@"albums"]) {
                    NSLog(@"Item: %@", [album objectForKey: @"albumName"]);
                    
                   // Albums *al = [[Albums alloc] init];
                    /*
                    al.id = [album objectForKey: @"albumId"];
                    al.name = [album objectForKey: @"albumName"];
                    NSLog(@"%@", al);
                    for (NSDictionary *_photo in [album objectForKey:@"albumPhotos"]){
                        Photo *ph = [[Photo alloc] init];
                        ph.path = [_photo objectForKey:@"bundlePath"];
                        ph.id = [_photo objectForKey:@"photoId"];
                        ph.desc = [_photo objectForKey:@"photoDescription"];
                        [al addNewRelationshipObject:ph];
                    }
                    NSLog(@"%@", al);
                     */
                    
                }
            }
            dispatch_async(dispatch_get_main_queue(), ^{
               // self.imview.image = img;
               // self.scroll.contentSize = CGSizeMake(img.size.width, img.size.height);
               // self.imview.frame= CGRectMake(0, 0, img.size.width, img.size.height);
            });
            
        }
    }];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self downloadWithBlocks];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark NSURLConnectionDataDelegate

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)dataRecived{
    NSLog(@"data recived %@", dataRecived);
    if(!self.data) self.data = [NSMutableData data];
    [self.data appendData:dataRecived];
    
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSLog(@"finish");
    //self.imview.image = [UIImage imageWithData:self.data];
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"error: %@", error);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:error.localizedDescription delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Retry", nil];
    [alert show];
}

#pragma mark -
#pragma mark UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(alertView.cancelButtonIndex == buttonIndex){
        NSLog(@"ez van");
    } else {
        [self download];
    }
}

@end
