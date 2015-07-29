//: Playground - noun: a place where people can play

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
    
    return result}


var aaa:uint64 = 0

 aaa = UInt64(UInt8(decodeBCD(0b00011000)))*100000000
 aaa = aaa + (UInt64(UInt8(decodeBCD(0b00110000))))*1000000
 aaa = aaa + (UInt64(UInt8(decodeBCD(0b00001000))))*10000
 aaa = aaa + (UInt64(UInt8(decodeBCD(0b01100101))))*100
 aaa = aaa + UInt64(UInt8(decodeBCD(0b01000001)))

var newint: UInt8 = 0
newint = encodeBCD(38)
var str: String

str = String(newint, radix:2)


var source: [UInt8] = [0b01000001,0b01100101,0b00001000,0b00110000,0b00011000]

var a = 73
a = (a - (a % 10))/10




