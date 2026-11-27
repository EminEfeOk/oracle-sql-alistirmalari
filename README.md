# Oracle SQL Alıştırmaları / Oracle SQL Exercises

[Türkçe](#türkçe) · [English](#english)

## Türkçe

Bu repo, Oracle SQL dersinde işlenen konular için yazdığım örnek sorguları ve alıştırma çözümlerimi içeriyor. Bazı alıştırmalar üzerinde çalışmaya devam ediyorum.

| Şema | İçerik |
| --- | --- |
| `egitim` | Personel, yönetici ve konum sorguları. Tablo oluşturma, view, indeks ve kısıt örnekleri. |
| `test` | Öğrenci ve ürün sorguları. Tablo oluşturma ve değiştirme, view, kısıtlar, `SAVEPOINT` ve `ROLLBACK` alıştırmaları. |
| `northwind` | Müşteri, sipariş ve çalışan sorguları. Alt sorgular, sipariş verisinden tablo oluşturma ve view alıştırmaları. |

Sorgularda `JOIN`, `GROUP BY`, toplama fonksiyonları, `EXISTS` ve `WITH` örnekleri var. Kısıt alıştırmaları `PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL` ve `CHECK` konularını kapsıyor.

Dosya adının başı, sorgunun hangi şemaya ait olduğunu gösterir. Çalıştırmak istediğin sorguyu ilgili tabloların bulunduğu bir Oracle deneme ortamında tek tek çalıştırabilirsin. Bazı örnekler veri veya tablo yapısını değiştirir. Bazıları da Oracle'ın verdiği hataları göstermek için yazıldı.

## English

This repository contains example queries I wrote for my Oracle SQL course and my solutions to practice exercises. Some exercises are still in progress.

| Schema | Contents |
| --- | --- |
| `egitim` | Queries about employees, managers, and locations. Examples of table creation, views, indexes, and constraints. |
| `test` | Student and product queries. Exercises on creating and altering tables, views, constraints, `SAVEPOINT`, and `ROLLBACK`. |
| `northwind` | Customer, order, and employee queries. Exercises on subqueries, creating a table from order data, and views. |

The queries demonstrate `JOIN`, `GROUP BY`, aggregate functions, `EXISTS`, and `WITH`. The constraint exercises cover `PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`, and `CHECK`.

The filename prefix identifies the schema for each script. Run statements individually in an Oracle practice environment that has the required tables. Some examples modify data or table definitions. Others deliberately trigger Oracle errors to show how constraints and transactions behave.
