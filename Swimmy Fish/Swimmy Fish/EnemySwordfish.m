//
//  EnemySwordfish.m
//  Swimmy Fish
//
//  Created by Ryan Wahle on 12/2/14.
//  Copyright (c) 2014 Ryan Wahle. All rights reserved.
//

#import "EnemySwordfish.h"
#import "GameScene.h"

@implementation EnemySwordfish

- (id)initWithSwordfish {
    self = [super initWithImageNamed:@"Swordfish"];
    
    self.physicsBody = [SKPhysicsBody bodyWithTexture:self.texture size:self.size];
    self.physicsBody.categoryBitMask = enemyCategory;
    self.physicsBody.dynamic = NO;
    self.physicsBody.mass = 0;
    self.physicsBody.allowsRotation = NO;
    
    SKAction *moveAcrossScreen = [SKAction moveBy:CGVectorMake( -1000, 0) duration:15];
    SKAction *removeSelf = [SKAction performSelector:@selector(removeSelfFromScene) onTarget:self];
    
    [self runAction:[SKAction sequence:@[moveAcrossScreen, removeSelf]]];
    
    return self;
}

-(void)removeSelfFromScene {
    [self removeFromParent];
}


@end
