//
//  LeaderboardScene.m
//  Swimmy Fish
//
//  Created by Ryan Wahle on 12/10/14.
//  Copyright (c) 2014 Ryan Wahle. All rights reserved.
//

#import "LeaderboardScene.h"
#import "MainMenuScene.h"

#import <Social/Social.h>

@implementation LeaderboardScene
{
    NSArray *highScoresArray;
    BOOL isShowingScores_1_5;
    
    SKSpriteNode *button_1_5;
    SKSpriteNode *button_6_10;
    
    SKSpriteNode *button_1_5_Selected;
    SKSpriteNode *button_6_10_Selected;
    
    SKLabelNode *highScore1;
    SKLabelNode *highScore2;
    SKLabelNode *highScore3;
    SKLabelNode *highScore4;
    SKLabelNode *highScore5;
    SKLabelNode *highScore6;
    SKLabelNode *highScore7;
    SKLabelNode *highScore8;
    SKLabelNode *highScore9;
    SKLabelNode *highScore10;
    
    SKSpriteNode *twitter1;
    SKSpriteNode *twitter2;
    SKSpriteNode *twitter3;
    SKSpriteNode *twitter4;
    SKSpriteNode *twitter5;
    SKSpriteNode *twitter6;
    SKSpriteNode *twitter7;
    SKSpriteNode *twitter8;
    SKSpriteNode *twitter9;
    SKSpriteNode *twitter10;
}

- (void)didMoveToView:(SKView *)view {
    // Setup Leaderboard Background //
    
    SKSpriteNode *leaderboardBackground = [SKSpriteNode spriteNodeWithImageNamed:@"Leaderboard"];
    leaderboardBackground.position = CGPointMake(CGRectGetMidX(self.view.frame), CGRectGetMidY(self.view.frame));
    [self addChild:leaderboardBackground];

    
    
    // Load Buttons //
    
    button_1_5 = [SKSpriteNode spriteNodeWithImageNamed:@"Leaderboard-Button-1-5"];
    button_1_5_Selected = [SKSpriteNode spriteNodeWithImageNamed:@"Leaderboard-Button-1-5-Selected"];
    
    button_1_5.position = CGPointMake(240, 215);
    button_1_5_Selected.position = CGPointMake(240, 215);
    
    button_1_5.yScale = 1.5;
    button_1_5_Selected.yScale = 1.5;
    
    button_6_10 = [SKSpriteNode spriteNodeWithImageNamed:@"Leaderboard-Button-6-10"];
    button_6_10_Selected = [SKSpriteNode spriteNodeWithImageNamed:@"Leaderboard-Button-6-10-Selected"];
    
    button_6_10.position = CGPointMake(370, 215);
    button_6_10_Selected.position = CGPointMake(370, 215);
    
    button_6_10.yScale = 1.5;
    button_6_10_Selected.yScale = 1.5;
    
    button_1_5.zPosition = 99;
    button_1_5_Selected.zPosition = 99;
    
    button_6_10.zPosition = 99;
    button_6_10_Selected.zPosition = 99;
    
    // Load High Score Labels //
    
    highScore1 = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Thin"];
    highScore2 = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Thin"];
    highScore3 = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Thin"];
    highScore4 = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Thin"];
    highScore5 = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Thin"];
    highScore6 = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Thin"];
    highScore7 = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Thin"];
    highScore8 = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Thin"];
    highScore9 = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Thin"];
    highScore10 = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Thin"];
    
    highScore1.text = @"#1\t\t--\t\t\t\tEmpty";
    highScore2.text = @"#2\t\t--\t\t\t\tEmpty";
    highScore3.text = @"#3\t\t--\t\t\t\tEmpty";
    highScore4.text = @"#4\t\t\t--\t\t\t\tEmpty";
    highScore5.text = @"#5\t\t--\t\t\t\tEmpty";
    highScore6.text = @"#6\t\t\t--\t\t\t\tEmpty";
    highScore7.text = @"#7\t\t--\t\t\t\tEmpty";
    highScore8.text = @"#8\t\t--\t\t\t\tEmpty";
    highScore9.text = @"#9\t\t--\t\t\t\tEmpty";
    highScore10.text = @"#10\t\t--\t\t\t\tEmpty";
    
    highScore1.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    highScore2.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    highScore3.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    highScore4.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    highScore5.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    highScore6.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    highScore7.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    highScore8.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    highScore9.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    highScore10.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    
    highScore1.zPosition = 99;
    highScore2.zPosition = 99;
    highScore3.zPosition = 99;
    highScore4.zPosition = 99;
    highScore5.zPosition = 99;
    highScore6.zPosition = 99;
    highScore7.zPosition = 99;
    highScore8.zPosition = 99;
    highScore9.zPosition = 99;
    highScore10.zPosition = 99;
    
    highScore1.position = CGPointMake(160, 160);
    highScore2.position = CGPointMake(160, 130);
    highScore3.position = CGPointMake(160, 100);
    highScore4.position = CGPointMake(160, 70);
    highScore5.position = CGPointMake(160, 40);
                           
    highScore6.position = CGPointMake(160, 160);
    highScore7.position = CGPointMake(160, 130);
    highScore8.position = CGPointMake(160, 100);
    highScore9.position = CGPointMake(160, 70);
    highScore10.position = CGPointMake(160, 40);


    
    // Setup the twitter links //
    
    twitter1 = [SKSpriteNode spriteNodeWithImageNamed:@"Twitter"];
    twitter2 = [SKSpriteNode spriteNodeWithImageNamed:@"Twitter"];
    twitter3 = [SKSpriteNode spriteNodeWithImageNamed:@"Twitter"];
    twitter4 = [SKSpriteNode spriteNodeWithImageNamed:@"Twitter"];
    twitter5 = [SKSpriteNode spriteNodeWithImageNamed:@"Twitter"];
    twitter6 = [SKSpriteNode spriteNodeWithImageNamed:@"Twitter"];
    twitter7 = [SKSpriteNode spriteNodeWithImageNamed:@"Twitter"];
    twitter8 = [SKSpriteNode spriteNodeWithImageNamed:@"Twitter"];
    twitter9 = [SKSpriteNode spriteNodeWithImageNamed:@"Twitter"];
    twitter10 = [SKSpriteNode spriteNodeWithImageNamed:@"Twitter"];
    
    twitter1.position = CGPointMake(120, 160);
    twitter2.position = CGPointMake(120, 130);
    twitter3.position = CGPointMake(120, 100);
    twitter4.position = CGPointMake(120, 70);
    twitter5.position = CGPointMake(120, 40);
    
    twitter6.position = CGPointMake(120, 160);
    twitter7.position = CGPointMake(120, 130);
    twitter8.position = CGPointMake(120, 100);
    twitter9.position = CGPointMake(120, 70);
    twitter10.position = CGPointMake(120, 40);
    
    twitter1.anchorPoint = CGPointMake(0, 0);
    twitter2.anchorPoint = CGPointMake(0, 0);
    twitter3.anchorPoint = CGPointMake(0, 0);
    twitter4.anchorPoint = CGPointMake(0, 0);
    twitter5.anchorPoint = CGPointMake(0, 0);
    twitter6.anchorPoint = CGPointMake(0, 0);
    twitter7.anchorPoint = CGPointMake(0, 0);
    twitter8.anchorPoint = CGPointMake(0, 0);
    twitter9.anchorPoint = CGPointMake(0, 0);
    twitter10.anchorPoint = CGPointMake(0, 0);
    
    twitter1.yScale = .2;
    twitter2.yScale = .2;
    twitter3.yScale = .2;
    twitter4.yScale = .2;
    twitter5.yScale = .2;
    twitter6.yScale = .2;
    twitter7.yScale = .2;
    twitter8.yScale = .2;
    twitter9.yScale = .2;
    twitter10.yScale = .2;
    
    twitter1.xScale = .2;
    twitter2.xScale = .2;
    twitter3.xScale = .2;
    twitter4.xScale = .2;
    twitter5.xScale = .2;
    twitter6.xScale = .2;
    twitter7.xScale = .2;
    twitter8.xScale = .2;
    twitter9.xScale = .2;
    twitter10.xScale = .2;
    
    twitter1.zPosition = 99;
    twitter2.zPosition = 99;
    twitter3.zPosition = 99;
    twitter4.zPosition = 99;
    twitter5.zPosition = 99;
    twitter6.zPosition = 99;
    twitter7.zPosition = 99;
    twitter8.zPosition = 99;
    twitter9.zPosition = 99;
    twitter10.zPosition = 99;
    
    
    
    
    // Get the high scores //
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    highScoresArray = [userDefaults arrayForKey:@"highScores"];
    NSInteger scoreIndex = 0;
    
    NSLog(@"array count = %ld", highScoresArray.count);
    
    for (NSDictionary *scoreEntry in highScoresArray) {
        scoreIndex++;
        
        NSNumber *scoreNumber = [scoreEntry objectForKey:@"score"];
        NSString *scoreUsername = [scoreEntry objectForKey:@"username"];
        
        SKLabelNode *labelNode;
        
        //NSLog(@"Rank #%ld\t%ld\t%@", (long)scoreIndex, (long)scoreNumber.integerValue, scoreUsername);
        
        switch (scoreIndex) {
            case 1:
                labelNode = highScore1;
                break;
            case 2:
                labelNode = highScore2;
                break;
            case 3:
                labelNode = highScore3;
                break;
            case 4:
                labelNode = highScore4;
                break;
            case 5:
                labelNode = highScore5;
                break;
            case 6:
                labelNode = highScore6;
                break;
            case 7:
                labelNode = highScore7;
                break;
            case 8:
                labelNode = highScore8;
                break;
            case 9:
                labelNode = highScore9;
                break;
            case 10:
                labelNode = highScore10;
                break;
            default:
                break;
        }
        
        labelNode.text = [NSString stringWithFormat:@"#%ld          %ld\t\t%@", (long)scoreIndex, (long)scoreNumber.integerValue, scoreUsername];
    }
    
    
    // Initially show scores 1 - 5 //
    
    [self setupScores_1_5];
}

- (void)removeButtonsAndScoresFromParent {
    [button_1_5 removeFromParent];
    [button_1_5_Selected removeFromParent];
    
    [button_6_10 removeFromParent];
    [button_6_10_Selected removeFromParent];
    
    [highScore1 removeFromParent];
    [highScore2 removeFromParent];
    [highScore3 removeFromParent];
    [highScore4 removeFromParent];
    [highScore5 removeFromParent];
    [highScore6 removeFromParent];
    [highScore7 removeFromParent];
    [highScore8 removeFromParent];
    [highScore9 removeFromParent];
    [highScore10 removeFromParent];
    
    [twitter1 removeFromParent];
    [twitter2 removeFromParent];
    [twitter3 removeFromParent];
    [twitter4 removeFromParent];
    [twitter5 removeFromParent];
    [twitter6 removeFromParent];
    [twitter7 removeFromParent];
    [twitter8 removeFromParent];
    [twitter9 removeFromParent];
    [twitter10 removeFromParent];
    
}

- (void)setupScores_1_5 {
    isShowingScores_1_5 = YES;
    
    [self removeButtonsAndScoresFromParent];
    
    [self addChild:button_1_5_Selected];
    [self addChild:button_6_10];

    [self addChild:highScore1];
    [self addChild:highScore2];
    [self addChild:highScore3];
    [self addChild:highScore4];
    [self addChild:highScore5];
    
    switch (highScoresArray.count) {
        case 10:
        case 9:
        case 8:
        case 7:
        case 6:
        case 5:
            [self addChild:twitter5];
        case 4:
            [self addChild:twitter4];
        case 3:
            [self addChild:twitter3];
        case 2:
            [self addChild:twitter2];
        case 1:
            [self addChild:twitter1];
        default:
            break;
        }
}

- (void)setupScores_6_10 {
    isShowingScores_1_5 = NO;
    
    [self removeButtonsAndScoresFromParent];
    
    [self addChild:button_6_10_Selected];
    [self addChild:button_1_5];
    
    [self addChild:highScore6];
    [self addChild:highScore7];
    [self addChild:highScore8];
    [self addChild:highScore9];
    [self addChild:highScore10];
    
    switch (highScoresArray.count) {
        case 10:
            [self addChild:twitter10];
        case 9:
            [self addChild:twitter9];
        case 8:
            [self addChild:twitter8];
        case 7:
            [self addChild:twitter7];
        case 6:
            [self addChild:twitter6];
        case 5:
        case 4:
        case 3:
        case 2:
        case 1:
        default:
            break;
    }

}

- (void)shareOnTwitterWithScoreRanking:(NSInteger)rank {
    NSDictionary *entryScore = [highScoresArray objectAtIndex:rank - 1];
    
    NSString *username = [entryScore objectForKey:@"username"];
    NSNumber *score = [entryScore objectForKey:@"score"];
    
    NSString *twitterString = [NSString stringWithFormat:@"%@ just got %ld whacks in Swimmy Fish!", username, (long)score.integerValue];
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        SLComposeViewController *tweetViewController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        [tweetViewController setInitialText:twitterString];
        
        [self.view.window.rootViewController presentViewController:tweetViewController animated:YES completion:nil];
    }

}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];

    if (isShowingScores_1_5) {
        if ([twitter1 containsPoint:location]) {
            [self shareOnTwitterWithScoreRanking:1];
        } else if ([twitter2 containsPoint:location]) {
            [self shareOnTwitterWithScoreRanking:2];
        } else if ([twitter3 containsPoint:location]) {
            [self shareOnTwitterWithScoreRanking:3];
        } else if ([twitter4 containsPoint:location]) {
            [self shareOnTwitterWithScoreRanking:4];
        } else if ([twitter5 containsPoint:location]) {
            [self shareOnTwitterWithScoreRanking:5];
        }
    } else {
        if ([twitter6 containsPoint:location]) {
            [self shareOnTwitterWithScoreRanking:6];
        } else if ([twitter7 containsPoint:location]) {
            [self shareOnTwitterWithScoreRanking:7];
        } else if ([twitter8 containsPoint:location]) {
            [self shareOnTwitterWithScoreRanking:8];
        } else if ([twitter9 containsPoint:location]) {
            [self shareOnTwitterWithScoreRanking:9];
        } else if ([twitter10 containsPoint:location]) {
            [self shareOnTwitterWithScoreRanking:10];
        }
    }
    
    if ([button_1_5_Selected containsPoint:location]) {
        [self setupScores_1_5];
    } else if ([button_6_10_Selected containsPoint:location]) {
        [self setupScores_6_10];
    } else {
        [self.view presentScene:[MainMenuScene sceneWithSize:self.size] transition:[SKTransition doorsCloseHorizontalWithDuration:1]];
    }
}

@end
