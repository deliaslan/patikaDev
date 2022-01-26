//
//  main.swift
//  Fonksiyonlar
//
//  Created by Adem Deliaslan on 26.01.2022.
//

import Foundation

//Parametre almadan yazılan fonksiyon

func toplama(){
    var sayi1 = 4
    var sayi2 = 5
    
    print(sayi1+sayi2)
}

toplama()

//Parametre alarak yazılan fonksiyon

func toplama(sayi1: Int, sayi2: Int){
    print(sayi1+sayi2)
    
}

toplama(sayi1: 12, sayi2: 32)


// Değer döndüren fonksiyon yazımı

func toplama(sayi1:Int,sayi2:Int,sayi3:Int) -> Int {
    return sayi1+sayi2+sayi3
}

let sonuc = toplama(sayi1: 3, sayi2: 3, sayi3: 2)

print(sonuc)

// Parametrelerin hangileri olduğunu her seferinde belirtmek istemediğimiz foksiyon yazımı

func toplamaIsimsizParametre(_ sayi1:Int,_ sayi2:Int) -> Int{
    sayi1+sayi2
    //eğer fonksiyon tek satırdan oluşuyorsa return demeye gerek yok
}

let sonuc2 = toplamaIsimsizParametre(12, 5)
print(sonuc2)
