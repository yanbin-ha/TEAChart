//
//  TEAViewController.m
//  TEAChartDemo
//
//  Created by Xhacker on 11/11/2013.
//  Copyright (c) 2013 Xhacker. All rights reserved.
//

#import "TEAViewController.h"

@interface TEAViewController ()

@property (weak, nonatomic) IBOutlet TEABarChart *barChart;
@property (weak, nonatomic) IBOutlet TEAContributionGraph *contributionGraph;
@property (weak, nonatomic) IBOutlet TEAClockChart *clockChart;

@end

@implementation TEAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Line chart, the Storyboard way
    self.barChart.data = @[@3, @1, @4, @1, @5, @9, @2, @6, @5, @3];
    self.barChart.barSpacing = 10;
    self.barChart.barColors = @[[UIColor orangeColor], [UIColor yellowColor], [UIColor greenColor], [UIColor blueColor]];
  
    // Line chart, the code way
    TEABarChart *secondBarChart = [[TEABarChart alloc] initWithFrame:CGRectMake(35, 180, 100, 40)];
    secondBarChart.data = @[@2, @7, @1, @8, @2, @8];
    [self.view addSubview:secondBarChart];
    
    // Contribution graph
    self.contributionGraph.width = 12;
    self.contributionGraph.spacing = 6;
    
    // Clock chart
    self.clockChart.data = @[
        [TEATimeRange timeRangeWithStart:[NSDate date] end:[NSDate dateWithTimeIntervalSinceNow:3600]],
        // ...
    ];
}

#pragma mark - TEAContributionGraphDataSource Methods

- (NSDate *)monthForGraph
{
    return [NSDate date];
}

- (NSInteger)valueForDay:(NSUInteger)day
{
    return day % 6;
}

@end
