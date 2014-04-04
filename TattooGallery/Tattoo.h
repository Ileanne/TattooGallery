//
//  Tattoo.h
//  tattooAmesta
//
//  Created by LADEMO on 08/11/13.
//  Copyright (c) 2013 LADEMO. All rights reserved.
//

#import <Foundation/Foundation.h>

//Objeto

@interface Tattoo : NSObject

@property (nonatomic, copy) NSString *tattooName;
@property (nonatomic, copy) NSString *artistName;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, copy) NSString *tattooDescription;
@property (nonatomic, copy) NSString *artistLocation;

@end
