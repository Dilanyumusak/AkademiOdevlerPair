file=open("sample.txt","a")

k=[]

try:
    sayi=int(input("Çalışan sayısını giriniz."))
    print(sayi)

    for i in range(sayi):

        isim=str(input())
        soyisim=str(input())
        maas=float(input())
        k.append(f"{isim} {soyisim} - {maas}\n")
        file.write(k[i])

except ValueError:
    print("HATALI DEĞER GİRDİNİZ..")
except NameError:
    print("HATALI DEĞER GİRDİNİZ..")
except:
    print("HATALI DEĞER GİRDİNİZ..")
finally:
    print("Try except bloğu sona erdi..")

file.close()