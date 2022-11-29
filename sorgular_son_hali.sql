-- soru1:ID si 1 olan müşterinin adres bilgilerini getirin.
SELECT * FROM addresses
WHERE customers_id = 1 ; 

-- soru2:müşterilerin adı,soyadı ve email adreslerini getiren sorgu
SELECT name,surname,email FROM customers;

-- soru3:Takipçileri 10000 ve 50000 arasında olan satıcıların şirket isimleri,raitingleri listelensin
SELECT company_name,rating,follower_count FROM sellers 
WHERE follower_count BETWEEN 10000 and 50000;

-- soru4:Sepetteki ürünlere ait ürün adetlerini,toplam fiyatlarını gösteren,toplam maliyetlerine göre büyükten küçüğe doğru sıralayan bir sorgu yazalım
SELECT quantity,total_price,quantity*total_price as ToplamMaliyet FROM shopping_basket
ORDER BY ToplamMaliyet DESC ;


-- soru5:Kodu 1 olan üründen toplam kaç tane sipariş verilmiştir?
SELECT id,quantity FROM product_orders 
WHERE id = 1 ;

-- soru6:Kodu 1 olan ürünler arasından stokta kırmızı renkte olan ürünleri gösterelim.
SELECT name,product_colors_id FROM products
WHERE id = 1 ;

-- soru7:Sepet tutarı 500 ve 500 ün altında olan kaç adet ürün var ve bu ürünler nedir?
SELECT products_id,quantity,total_price FROM shopping_basket
WHERE total_price <= 500 ;

-- soru8:%25 ve %50 indirim uygulanan ürünleri yazalım.
SELECT name,discount_amount FROM discounts,products
WHERE discount_amount IN(0.25,0.50);

-- soru9:Farklı satıcıların sattığı aynı ürünlerin listesi
select distinct(products_id),sellers_id,unit_price from product_sellers
where products_id = 1 ;


-- soru10:İade edilen ürünlerin kodu 5 olan ürünleri ve iade tarihlerini gösterelim
SELECT product_orders_id,return_date,return_reason FROM returns
where product_orders_id = 1;

-- soru11:Marka adı 'T' ile başlayan satıcıların isimleri,adresleri ve emaillerini gösterin.
SELECT id,company_name,address,email FROM sellers
WHERE company_name LIKE 't%';

-- soru12:Müşteri tablosunda ismi 'Emre' olan müşterilere ait email ve telefon nosunu gösteren tabloları belirleyelim
select name,email,phone from customers
where name='emre'

-- soru13:Ankara şehirine ait siparişlerini gösterelim.
SELECT * FROM payments
WHERE addresses_id = 2 ;


-- soru14:Sipariş tablosu tarih bilgisi içerisinde '2022' geçen siparişleri getir.
select * from orders 
where delivery_date between '2022-01-01' and '2022-12-31';

-- soru15:Kredi kartı ile yapılan ödemenin kart bilgilerini getirin.
select * from payment_value 
where payment_information_id=1;
