-- sorgu1:Müşterilere ait adres bilgilerini getiren sorguyu yazalım.
Select c.name musteri_adi,c.surname musteri_soyadi,ad.title adres_tipi,ad.streets sokak,ci.name sehir_adi From customers c
inner join addresses ad 
on c.id = ad.customers_id
inner join cities ci
on ad.cities_id = ci.id


-- sorgu2:Adresinde 'sokak' ismi geçen adresleri listeleyelim.
Select * From addresses 
Where streets Like '%sokak%'


-- sorgu3:Marka isimlerini alfabetik sıraya göre sıralayalım.
Select * From brands
Order By name 


-- sorgu4:3 nolu satıcıya ait olan en pahalıdan en uyguna sıralayınız.
Select s.company_name,ps.products_id,ps.unit_price From product_sellers ps
inner join sellers s 
on ps.sellers_id = s.id
Where ps.sellers_id = 3
Order By ps.unit_price Desc


-- sorgu5:Satıcıların sattığı ürün sayısına göre büyükten küçüğe sıralayalım.
Select s.company_name,count(ps.products_id) "ürün sayısı" From product_sellers ps
inner join sellers s 
on ps.sellers_id = s.id
Group BY s.company_name
Order By count(ps.products_id) Desc

-- sorgu6:Kodu 1 olan üründen toplam kaç tane sipariş alınmıştır?
Select p.id,p.name,sum(po.quantity) "satılan ürün sayısı"  From product_orders po
inner join products p 
on po.products_id = p.id
Where p.id = 1
Group By p.id,p.name

-- sorgu7:Aynı ürünün en pahalı ve en uygun fiyatları arasındaki farkı veren sorgu
Select p.id as"ürün kodu",(max(ps.unit_price)-min(ps.unit_price)) as "fiyat farkı" From product_sellers ps
inner join products p
on ps.products_id = p.id
inner join sellers s 
on ps.sellers_id = s.id
GROUP BY p.id

--sorgu8: Her kategoride kaç ürün vardır?
select c.id "Kategori numarası", count(p.id) "Ürün sayısı" from categories c
inner join products p
on p.categories_id = c.id
Group by c.id 


--sorgu9:Hangi ürün hangi kategoridedir?
select p.id "ürün numarası", p.name "Ürün Adı", cn.name "kategori adı" from categories c
inner join products p
on p.categories_id = c.id
inner join category_types ct
on c.categories_types_id = ct.id
inner join categories_name cn
on ct.category_name_id = cn.id


--sorgu10: Stok adedi 15 in altında olan ve fiyatı 450 den fazla olan ürünlerin adını, stok adedini ve fiyatını gösteren sorguyu yazınız.
select p.name "ürün adı", ps. quantity "stok adedi", ps.unit_price "ürün fiyatı" from product_sellers ps
inner join products p
on ps.products_id = p.id
where ps.quantity < 15 and ps.unit_price > 450


--sorgu 11: Ankara ve İzmir' de yaşayan müşterileri listeleyelim.
select * from customers cu
inner join addresses a
on cu.id = a.customers_id
inner join cities ci
on a.cities_id = ci.id
where ci.id in (2,4)


--sorgu12: Satıcıları takipçi sayılarına göre büyükten küçüğe sıralayınız.
select company_name "satıcı adı", follower_count "takipçi sayısı", rating from sellers
order by follower_count desc


--sorgu13: Hangi satıcı hangi ürünleri satıyor? 
select ps.products_id "ürün kodu",s.company_name "satıcı adı", p.name "ürün adı" from product_sellers ps
inner join sellers s
on ps.sellers_id = s.id
inner join products p
on ps.products_id = p.id


-- Sorgu 14 indirim kodu %50 olan ürünler ve bu ürünlere ait markalar nelerdir ? 
Select p.id "ürün kodu", d.discount_amount "indirim tutarı", p.name "ürün adı", b.name "marka adı" From discounts d
inner join categories c 
on d.categories_id = c.id
inner join brands b
on d.brands_id = b.id
inner join products p
on p.categories_id = c.id
Where d.discount_amount = 0.50


-- Sorgu 15= müşteri numarası 7 olan kayıtları silen sorguyu yazınız ? 
DELETE FROM customers 
WHERE customers.id = 7


-- Sorgu 16 Trendyolmilla(2) satıcısına ait ürünlerin fiyatları 400 ile 700 arasında olan ürünlerin adı ve fiyatlarını listeleyin ? 
Select ps.sellers_id "Satıcı kodu", s.company_name "Satıcı Adı", p.name "Ürün Adı",ps.unit_price "Fiyat" From product_sellers ps
inner join sellers s 
on ps.sellers_id = s.id
inner join products p
on ps.products_id = p.id
Where ps.sellers_id = 2 and ps.unit_price BETWEEN 400 and 700


--sorgu17: Veritabanına kayıtlı olan ürünlere ait ürün id, ürünün markası, ürünün satıcısı ve kategorisini gösteren listeyi oluşturunuz.
select ps.products_id "ürün kodu", p.name "ürün adı", s.company_name "satıcı adı", b.name "ürün markası",cn.name "kategori adı" from product_sellers ps
inner join sellers s
on ps.sellers_id = s.id
full outer join brand_sellers bs
on s.id = bs.brands_id
left join brands b
on bs.brands_id = b.id
inner join products p
on ps.products_id = p.id
inner join categories_name cn
on p.categories_id = cn.id


--sorgu 18: İndirim kodu 1 olan ürünlerin marka adlarını sıralayınız.
select d.id "indirim kodu", d.discount_amount "indirim tutarı", p.name "ürün adı", b.name "marka adı" from discounts d
inner join brand_discount bd
on d.brands_id = bd.brands_id
inner join brands b
on bd.brands_id = b.id
inner join products p
on b.id = p.brands_id
where d.id = 1


--sorgu19: T ile başlayan ülkelere ait sipariş, satıcı ve ödeme bilgilerini listeleyin.
Select c.name "ülke adı", ord.id "sipariş numarası", ps.products_id "ürün kodu", s.company_name "satıcı adı", ps.unit_price "ürün fiyatı", ps.quantity "ürün adedi", ord.delivery_date "teslimat tarihi", pi.description "ödeme bilgisi", sc.company_name "kargo firması", sc.shipping_time "kargolama tarihi", sc.shipping_price "kargo ücreti" from countries c
inner join cities ci
on c.id = ci.countries_id
full outer join addresses a
on ci.id = a.cities_id
full outer join payments p
on a.id = p.addresses_id
inner join payment_information pi
on p.payment_information_id = pi.id
inner join orders ord
on p.orders_id = ord.id
inner join product_sellers ps
on ord.product_sellers_id = ps.id
inner join sellers s
on ps.sellers_id = s.id
inner join shipping_company sc
on ord.shipping_company_id = sc.id
where c.name like 't%'


--sorgu20: Bir siparişte kaç satıcı var?
select po.orders_id "Siparis numarası", count(s.id) "Satıcı sayısı" from product_orders po
inner join products p
on po.products_id = p.id
inner join product_sellers ps
on p.id = ps.products_id
inner join sellers s
on ps.sellers_id = s.id
Group by po.orders_id 



