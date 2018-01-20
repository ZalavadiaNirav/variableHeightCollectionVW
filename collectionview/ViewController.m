//
//  ViewController.m
//  collectionview
//
//  Created by Nirav Zalavadia on 20/01/18.
//  Copyright © 2018 CNSoftNetIndiaPvtLTD. All rights reserved.
//

#import "ViewController.h"
#import "customCell.h"

@interface ViewController ()
{
    NSArray *imageArr;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _collectionVw.delegate=self;
    _collectionVw.dataSource=self;
      NSDictionary *imageDict1=[NSDictionary dictionaryWithObjectsAndKeys:@"Image1",@"name",@"100",@"height",nil];
      NSDictionary *imageDict2=[NSDictionary dictionaryWithObjectsAndKeys:@"Image2",@"name",@"84",@"height",nil];
      NSDictionary *imageDict3=[NSDictionary dictionaryWithObjectsAndKeys:@"Image3",@"name",@"120",@"height",nil];
      NSDictionary *imageDict4=[NSDictionary dictionaryWithObjectsAndKeys:@"Image4",@"name",@"150",@"height",nil];
      NSDictionary *imageDict5=[NSDictionary dictionaryWithObjectsAndKeys:@"Image5",@"name",@"84",@"height",nil];
    imageArr=[NSArray arrayWithObjects:imageDict1,imageDict2,imageDict3,imageDict4,imageDict5,nil];

    [_collectionVw reloadData];
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    float height=[[[imageArr objectAtIndex:indexPath.row] objectForKey:@"height"] floatValue];
    return CGSizeMake(((self.view.frame.size.width/2)-20),(height+52));
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [imageArr count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
     [_collectionVw registerNib:[UINib nibWithNibName:@"customCell" bundle:nil] forCellWithReuseIdentifier:@"customCellID"];
    customCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"customCellID"
                                                           forIndexPath:indexPath];
    
    cell.backgroundColor=[UIColor grayColor];
    NSString *imgStr=[NSString stringWithFormat:@"%@",[[imageArr objectAtIndex:indexPath.item] objectForKey:@"name"]];
    cell.growableImg.image=[UIImage imageNamed:imgStr];
//    [cell layoutIfNeeded];

    [cell.growableImg layoutSubviews];
    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
