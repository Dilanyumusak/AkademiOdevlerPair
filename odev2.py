#! kullanıcıdan vize ve final notları alacak.
#! vize %40  final %60 etkili olacak
#! vize ve final notları 50.5 gibi ondalıklı sayılar olabilir
#! uygulama ortalamayı hesaplayacak ve ortalamaya göre
#! 0-49 FF
#! 50-60 DD
#! 60-70 CC
#! 70-80 BB
#! 80-100 AA
#! not ortalamasını ve not harfini kullanıcıya gösterecek programı kodlayınız.
# Programımızı geliştirerek ; Girilen her geçilen ve kalınan ders notlarını birer listede tutmanız beklenmektedir.

ders_sayisi = int(input("Öğrencinin ders sayısını giriniz: "))
toplam_gecen_ders_sayisi = 0
toplam_kalan_ders_sayisi = 0
vize = []
final = []
ort = []
gecilen_ders_ort = []
kalınan_ders_ort = []

for i in range(1,ders_sayisi+1): 
    vize_notu = float(input("vize notunu giriniz: "))
    final_notu = float(input("final notunu giriniz: "))
    ortalama_notu = (vize_notu * 0.4 + final_notu * 0.6)
    vize += {vize_notu}
    final += {final_notu}
    ort += {ortalama_notu}
    if ortalama_notu < 50:
        print("KALDINIZ")
        toplam_kalan_ders_sayisi += 1  
        kalınan_ders_ort += {ortalama_notu}  
    else:
        print("GEÇTİNİZ")
        toplam_gecen_ders_sayisi += 1
        gecilen_ders_ort += {ortalama_notu}
        print(f'Vize Notu:{vize_notu}  Final Notu:{final_notu}  Ortalama Notu:{ortalama_notu}')
 
print(f"Toplam geçilen ders sayısı: {toplam_gecen_ders_sayisi}")
print(f"Toplam kalınan ders sayısı: {toplam_kalan_ders_sayisi}")
print(f'Öğrencilerin vize notları: {vize}')
print(f'Öğrencilerin final notları: {final}')
print(f'Öğrencilerin ortalama notları: {ort}')
print(f'Öğrencilerin geçen notları: {gecilen_ders_ort}')
print(f'Öğrencilerin kalan notları: {kalınan_ders_ort}')




