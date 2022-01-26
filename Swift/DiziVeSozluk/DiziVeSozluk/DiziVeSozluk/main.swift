//
//  main.swift
//  DiziVeSozluk
//
//  Created by Adem Deliaslan on 26.01.2022.
//

import Foundation

//dizi tanımlama ve direkt eleman ekleme
var arr = ["Elma", "Muz", "Çilek"]

//boş dizi tanımlama ve initialize edilmiş yani RAM bellekte de yer almasını sağlama
var arr2 = [Float]()

//Initialize edilmeden yani RAM de yer kaplamadan tanımlanması
var arr3: Array<Float>

//Initialize edilerek tanımlama yani RAM de yer alması
var arr4: Array<Float> = []

arr2.append(3)
arr2.append(5)
arr2.append(14)
arr2.append(38)

print("arr2: \(arr2)")

//initalize edilmediğinde burada değer ataması yapılamaz.
//arr3.append(2.0)
//print(arr3)

arr4.append(3.6)
print(arr4)


//arrayden eleman silme yöntemleri

//hangi indis silinecek belirtiyoruz
arr2.remove(at: 2)
////ilk elemanı siler
//arr2.removeFirst()
////son elemanı siler
//arr2.removeLast()
////tüm elemanları siler
//arr2.removeAll()

print("arr2: \(arr2)")


//son elemanı listeden alıp sonra listeden silme popLast
let lastItem = arr2.popLast()

print("lastItem: \(lastItem)")
print("arr2: \(arr2)")


//DICTIONARY KISMI
//sözlük tanımlama yöntemleri
var dict = ["Adem" : 54, "Çiğdem" : 51, "Kerem" : 15, "Şebnem" : 22]

var dict2 = [String: Float]()

var dict3: Dictionary<String, Double>

//sözlüğe eleman ekleme
dict2["pi"] = 3.14
dict2["G"] = 9.8

//sözlüğü yazdırıken
print(dict2)
//sözlükten bir key e ait değeri yazdırıken
print(dict2["pi"])


//sözlükteki eleman sayısını yazdırma
print("Elaman sayısı: \(dict2.count)") //count özelliği ile

//sözlükten silme işlemleri
dict2.removeValue(forKey: "pi")

print(dict2)

dict2["G"] = nil //null demektir

print(dict2)

dict2["K"] = 22.7
print(dict2)



//sözlükten tüm elemanları silme işlemi
dict2.removeAll()

print(dict2)
