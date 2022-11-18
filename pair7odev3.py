
dersSayisi = int(input("Ders sayisini giriniz: "))

kalanDers = 0
gecenDers = 0

kalanDerslerOrtalama = []
gecenDerslerOrtalama = []


for i in range(dersSayisi):
    print(f"{i+1}. dersin sonuclari:")
    vizeSonuc = float(input("Vize Sonuc: "))
    finalSonuc = float(input("Final Sonuc: "))
    ortalama = vizeSonuc*0.4 + finalSonuc*0.6
    if ortalama<50:
        kalanDers+=1
        kalanDerslerOrtalama.append(ortalama)
    else:
        gecenDers+=1
        gecenDerslerOrtalama.append(ortalama)

print(f"Kalan Ders Sayisi: {kalanDers} , Gecen Ders Sayisi: {gecenDers}")
print(f"Kalan Derslerde Ortalama: {kalanDerslerOrtalama} , Gecen Derslerde Ortalama: {gecenDerslerOrtalama}")

