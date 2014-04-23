//
//  Fase.m
//  MiniChallange2
//
//  Created by Lucas Mendanha Filardi on 4/23/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "Fase.h"

@interface Fase ()

@property BOOL ContentCreated;

@end

@implementation Fase



-(void)didMoveToView:(SKView *)view
{
    UIPanGestureRecognizer *gesturedrag = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(arrastar:)];
    [[self view] addGestureRecognizer:gesturedrag];
    if (!self.ContentCreated)
    {
        [self createSceneContents];
        self.ContentCreated = YES;
    }
}

-(void)createSceneContents
{
    self.scaleMode =SKSceneScaleModeAspectFit;
    self.backgroundColor = [SKColor whiteColor];
    _vida = 3;
    _pontos = 0;
    [self game];
}
-(void)funcao
{
    SKSpriteNode *equacao = [[SKSpriteNode alloc] initWithImageNamed:@"extra.png"];
    
    int  numero1 =  arc4random() % 10;
    int  numero2 =  arc4random() % 10;
    NSString * sinal =  @"+";
    int  resposta;
    
    if ([sinal  isEqual: @"+"])
    {
        resposta = numero1 + numero2;
    }
    if ([sinal  isEqual: @"-"])
    {
        resposta = numero1 + numero2;
    }
    SKSpriteNode *num1 = [self addnumero:numero1];
    SKSpriteNode *num2 = [self addnumero:numero2];
    SKSpriteNode *sin = [self sinalequa:sinal];
    
    equacao.name=@"Equacao";
    num1.name=@"numero1";
    num2.name=@"numero2";
    sin.name=@"sinal";
    num1.position = CGPointMake(-880,0);
    num2.position = CGPointMake(-350,0);
    sin.position  = CGPointMake(-600,0);
    
    int Fnumber = CGRectGetMidX(self.frame)-50;
    int Bnumber = CGRectGetMaxX(self.frame)-75;
    int Pnumber = (arc4random()%(Bnumber-Fnumber))+Fnumber;
    equacao.position = CGPointMake(Pnumber,CGRectGetMidY(self.frame)*1.5);
    [equacao addChild: num1];
    [equacao addChild: num2];
    [equacao addChild: sin];
    
    SKAction *movimento = [SKAction group:@[
                                            [SKAction moveToX:Pnumber*1.1 duration:7],
                                            [SKAction moveToY:CGRectGetMinY(self.frame)-50 duration:7],
                                            [SKAction scaleXBy:2.0f y:2.0f duration:7]
                                            ]
                           ];
    //equacao.size
    [equacao runAction:[SKAction scaleXBy:0.05f y:0.05f duration:0.0]];
    [self addChild:equacao];
    [equacao runAction:movimento];
}

-(SKSpriteNode *)addnumero:(int)n
{
    SKSpriteNode * numero;
    if (n == 0)
    {
        numero = [[SKSpriteNode alloc] initWithImageNamed:@"0.png"];
    }
    if (n == 1)
    {
        numero = [[SKSpriteNode alloc] initWithImageNamed:@"1.png"];
    }
    if (n == 2)
    {
        numero = [[SKSpriteNode alloc] initWithImageNamed:@"2.png"];
    }
    if (n == 3)
    {
        numero = [[SKSpriteNode alloc] initWithImageNamed:@"3.png"];
    }
    if (n == 4)
    {
        numero = [[SKSpriteNode alloc] initWithImageNamed:@"4.png"];
    }
    if (n == 5)
    {
        numero = [[SKSpriteNode alloc] initWithImageNamed:@"5.png"];
    }
    if (n == 6)
    {
        numero = [[SKSpriteNode alloc] initWithImageNamed:@"6.png"];
    }
    if (n == 7)
    {
        numero = [[SKSpriteNode alloc] initWithImageNamed:@"7.png"];
    }
    if (n == 8)
    {
        numero = [[SKSpriteNode alloc] initWithImageNamed:@"8.png"];
    }
    if (n == 9)
    {
        numero = [[SKSpriteNode alloc] initWithImageNamed:@"9.png"];
    }
    return numero;
}

-(SKSpriteNode *)sinalequa:(NSString *)sin
{
    SKSpriteNode * sinal;
    if ([sin  isEqual: @"+"])
    {
        sinal = [[SKSpriteNode alloc] initWithImageNamed:@"mais.png"];
    }
    if ([sin  isEqual: @"-"])
    {
        sinal = [[SKSpriteNode alloc] initWithImageNamed:@"menos.png"];
    }
    return sinal;
}


-(void)update:(NSTimeInterval)currentTime
{
    [self enumerateChildNodesWithName:@"Equacao" usingBlock:^(SKNode *node, BOOL *stop)
     {
         if ( node.position.y < CGRectGetMinY(self.frame))
         {
             [node removeFromParent];
             _vida --;
             if ( _vida == 0)
             {
                 [self finalderrota];
             }
         }
     }];
}
-(void)vitoria:(int)pontos and:(int)vida
{
    [self funcao];
    [self funcao];
    [self funcao];
    [self funcao];
    [self funcao];
}

-(void)finalderrota
{
    [self funcao];
    [self funcao];
    [self funcao];
    [self funcao];
    [self funcao];
}

-(void)arrastar
{
    
}

-(void)game
{
    SKAction *numero = [SKAction sequence:@[
                                            [SKAction performSelector:@selector(funcao) onTarget:self],
                                            [SKAction waitForDuration:6 withRange:7]
                                            ]
                        ];
    [self runAction:[SKAction repeatAction:numero count:9]];
    [self vitoria:_pontos and:_vida];
}


@end

