//
//  ViewController.h
//  collectionview
//
//  Created by Nirav Zalavadia on 20/01/18.
//  Copyright © 2018 CNSoftNetIndiaPvtLTD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionVw;

@end

