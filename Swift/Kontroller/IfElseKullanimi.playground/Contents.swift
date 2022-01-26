import Darwin
var password = "123456"


//if else kullanımı
if password == "123456" {
    print("Şifre doğru hoşgeldiniz")
}
else if password == "123" {
    print("Şifreniz çok zayıf")
}
else{
    print("Şifre yanlış, tekrar deneyiniz.")
}


//switch case kullanımı
switch password {
case "123":
    print("Şifreniz çok zayıf, lütfen yeni şifre belirleyiniz.")
    
case "123456":
    print("Şifreniz yeterince güvenli. Hoşgeldiniz")
default:
    print("Şifreniz uyuşmuyor")
}


//switch case i enum ile kullanma
enum PasswordOption{
    case zayif
    case dogru
    case uyusmuyor
}

var passwordTwo: PasswordOption = .zayif

switch passwordTwo {
case .zayif:
    print("Şifreniz çok zayıf, lütfen yeni şifre belirleyiniz.")
    
case .dogru:
    print("Şifreniz yeterince güvenli. Hoşgeldiniz")

case .uyusmuyor:
    print("Şifreniz yeterince güvenli. Hoşgeldiniz")

}
