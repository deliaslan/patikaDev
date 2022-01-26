//cmd+shift+7 ile seçilenleri komut satırına alabiliriz

for i in 1...100 { //for(int i = 0; i<= 100; i++)
    print("Sayı: \(i)")
}

//100 ü  dahil etmeden nasıl yapılıyor kısmı ..<
for i in 1..<100 { //for(int i = 0; i< 100; i++)
    print("Sayı: \(i)")
}



//while kullanımı
var i = 1
while i<100{
    print("NUmber \(i)")
    //2 değer artarak devam eder. Not: i++ çalışmaz
    i += 2
}


//bir dizi içerisindeki değerleri for döngüsü ile yazdırma
//python kullanımı ile aynı
var sayilar = [1,2,3,4,5,6,7,8,9]

for sayi in sayilar{
    print(sayi)
}

//index değerleri ile birlikte yazdırmak için enumarated kullanımı

for (indeksDegeri, sayi) in sayilar.enumerated(){
    print("\(indeksDegeri) - \(sayi)")
}
