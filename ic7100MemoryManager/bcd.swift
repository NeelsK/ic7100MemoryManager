//
//  bdc.swift
//  ic7100Mem
//
//  Created by Neels Kriek on 29/07/2015.
//  Copyright (c) 2015 Neels Kriek. All rights reserved.
//
//  BCD structure is: Most significant nibble, then least significant nibble, i.e.
//  
//  0b00011000 := 0001(1) 1000(8) = 18
//  since only numbers 1 to 9 can be encoded, the largest BCD byte is:
//  0b10011001 = 1001(9) 1001(9) = 153


import Foundation

func decodeBCD(Byte: UInt8) ->UInt8 {
    var nibble2: UInt8 = 0
    var nibble1: UInt8 = 0
    var result: UInt8 = 0
    
    nibble1 = Byte >> 4
    result = nibble1 * 10
    nibble2 = Byte << 4
    nibble2 = nibble2 >> 4
    result = result + nibble2
    
    return result
}

func encodeBCD(Byte: UInt8) ->UInt8 {
    var nibble2: UInt8 = 0
    var nibble1: UInt8 = 0
    var result: UInt8 = 0
    
    if Byte > 153 { //BCD cannot be greater than 0b10011001, i.e. d153, which translates to BCD 99
        return 0
    }
    if Byte > 9 {
        nibble1 = (Byte - (Byte % 10))/10
        nibble2 = (Byte % 10) << 4
        result = nibble1 ^ nibble2
    }
    if Byte < 10 {
        result = Byte
    }
    
    return result
}
