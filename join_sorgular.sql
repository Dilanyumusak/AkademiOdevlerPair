-- Sorgu1 ülke,şehir,adres
Select * From countries c
left join cities ci
on c.id = ci.countries_id
full outer join addresses a
on ci.countries_id = a.cities_id


-- Sorgu2 product, product_orders, orders
Select * from products p
inner join product_orders pro
on p.id = pro.products_id
inner join orders ord
on pro.orders_id = ord.id


-- Sorgu3 shopping_basket, products, discounts
Select * from discounts d
right join shopping_basket sb
on d.id = sb.discounts_id
full outer join products p
on sb.products_id = p.id


-- Sorgu4 orders, shipping_company
Select * from orders ord
inner join shipping_company sc
on ord.shipping_company_id = sc.id


-- Sorgu5 products, product_pictures
Select * from product_pictures pp
left join products p
on pp.products_id = p.id


-- Sorgu6 brands, brand_discount, discounts
Select * from brands b
left join brand_discount bd
on b.id = bd.brands_id
full outer join discounts d
on bd.discounts_id = d.id


-- Sorgu7 adres,payments,orders
Select * from brands b
left join brand_discount bd
on b.id = bd.brands_id
full outer join discounts d
on bd.discounts_id = d.id


-- Sorgu8 orders, shipping_company
Select * from orders ord
right join shipping_company sc
on ord.shipping_company_id = sc.id


-- Sorgu9 orders, customers
Select * from orders ord
left join customers cu
on ord.customers_id = cu.id


-- Sorgu10 categories_name, category_types
select ct.id,ct.name,cn.name from category_types ct
inner join categories_name cn
on ct.category_name_id = cn.id


-- Sorgu11 products, product_pictures, product_colors, product_orders
Select p.name ürün_adı,pp.file_name dosya_adı,pp.file_path dosya_yolu,pc.name as renk from products p
inner join product_pictures pp
on p.id = pp.products_id
inner join product_colors pc
on p.product_colors_id = pc.id
inner join product_orders po
on po.products_id = p.id;


-- Sorgu12 brands, products, brand_discount
Select * from products p
left join brands br
on p.brands_id = br.id
full outer join brand_discount bd
on br.id = bd.brands_id


-- Sorgu13 product_orders, returns
Select * from product_orders po
left join returns re
on re.product_orders_id = po.id


-- Sorgu14 sellers, product_sellers
select s.company_name, s.address, s.phone from sellers s
inner join product_sellers ps
on s.id = ps.sellers_id


-- Sorgu15 sellers, brand_sellers
select * from sellers s
full outer join brand_sellers bs
on s.id = bs.sellers_id



