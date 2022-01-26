//
//  main.swift
//  Operatorler
//
//  Created by Adem Deliaslan on 26.01.2022.
//

import Foundation

//Unary operatörler : Tek değerler kullanılan operatörler Örn: !x değil anlamında
//Binary operatörler : İki değerle kullanılan operatörler Örn: x+y gibi +,-,/,*
//Ternary operatörler : Üç değerle kullanılan operatörler Örn: x ? y : z

//MARK - Atama operatörü(=)

let x = 10
var y = 5
y = x
print(y)


//MARK - Aritmetik Operatörler

print(3+2)
print(5-3)
print(9*3)
print(8/2)
print(15%4)
print(15%5)

print("Kodlu" + "yoruz")

//MARK - Bileşik Atama Operatörleri(+=, -=, *=, /=)

var t = 3
t += 2
print(t)

//MARK - Karşılaştırma Operatörleri

print(7 == 7)

print(7 < 3)

print( 8 >= 8)

print(5 <= 1)

if "x" == "x"{
    print("Eşitlik doğrudur")
}
else{
    print("Eşitlik yanlış")
}

//MARK - Koşul Operatörleri(x ? y : z)

"x" == "x" ? print("Eşitlik doğru") : print("Eşitlik yanlış")
