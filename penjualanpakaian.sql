/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     07/12/2024 11:31:43                          */
/*==============================================================*/


/*==============================================================*/
/* Table: CUSTOMER                                              */
/*==============================================================*/
create table CUSTOMER 
(
   ID_CUSTOMER          varchar(50)                    not null,
   KODE_PEMESANAN       varchar(50)                    null,
   KODE_PEMBAYARAN      varchar(50)                    null,
   ID_KERANJANG         varchar(50)                    null,
   NAMA_CUSTOMER        varchar(50)                    null,
   ALAMAT               varchar(50)                    null,
   NO_TELPON            varchar(15)                    null,
   constraint PK_CUSTOMER primary key (ID_CUSTOMER)
);

/*==============================================================*/
/* Index: CUSTOMER_PK                                           */
/*==============================================================*/
create unique index CUSTOMER_PK on CUSTOMER (
ID_CUSTOMER ASC
);

/*==============================================================*/
/* Index: MENGAKSES_FK                                          */
/*==============================================================*/
create index MENGAKSES_FK on CUSTOMER (
ID_KERANJANG ASC
);

/*==============================================================*/
/* Index: MELAKUKAN_FK                                          */
/*==============================================================*/
create index MELAKUKAN_FK on CUSTOMER (
KODE_PEMBAYARAN ASC
);

/*==============================================================*/
/* Index: MELIHAT_FK                                            */
/*==============================================================*/
create index MELIHAT_FK on CUSTOMER (
KODE_PEMESANAN ASC
);

/*==============================================================*/
/* Table: KATEGORI                                              */
/*==============================================================*/
create table KATEGORI 
(
   ID_KATEGORI          varchar(50)                    not null,
   ID_CUSTOMER          varchar(50)                    null,
   JENIS_KATEGORI       varchar(50)                    null,
   JENIS_PRODUK         varchar(50)                    null,
   constraint PK_KATEGORI primary key (ID_KATEGORI)
);

/*==============================================================*/
/* Index: KATEGORI_PK                                           */
/*==============================================================*/
create unique index KATEGORI_PK on KATEGORI (
ID_KATEGORI ASC
);

/*==============================================================*/
/* Index: MEMILIH_FK                                            */
/*==============================================================*/
create index MEMILIH_FK on KATEGORI (
ID_CUSTOMER ASC
);

/*==============================================================*/
/* Table: KERANJANG                                             */
/*==============================================================*/
create table KERANJANG 
(
   ID_KERANJANG         varchar(50)                    not null,
   ID_CUSTOMER          varchar(50)                    null,
   TOTAL_HARGA          varchar(100)                   null,
   constraint PK_KERANJANG primary key (ID_KERANJANG)
);

/*==============================================================*/
/* Index: KERANJANG_PK                                          */
/*==============================================================*/
create unique index KERANJANG_PK on KERANJANG (
ID_KERANJANG ASC
);

/*==============================================================*/
/* Index: MENGAKSES2_FK                                         */
/*==============================================================*/
create index MENGAKSES2_FK on KERANJANG (
ID_CUSTOMER ASC
);

/*==============================================================*/
/* Table: PEMBAYARAN                                            */
/*==============================================================*/
create table PEMBAYARAN 
(
   KODE_PEMBAYARAN      varchar(50)                    not null,
   ID_CUSTOMER          varchar(50)                    null,
   METODE_PEMBAYARAN    varchar(50)                    null,
   TANGGAL_PEMBAYARAN   timestamp                      null,
   TOTAL_PEMBAYARAN     varchar(100)                   null,
   constraint PK_PEMBAYARAN primary key (KODE_PEMBAYARAN)
);

/*==============================================================*/
/* Index: PEMBAYARAN_PK                                         */
/*==============================================================*/
create unique index PEMBAYARAN_PK on PEMBAYARAN (
KODE_PEMBAYARAN ASC
);

/*==============================================================*/
/* Index: MELAKUKAN2_FK                                         */
/*==============================================================*/
create index MELAKUKAN2_FK on PEMBAYARAN (
ID_CUSTOMER ASC
);

/*==============================================================*/
/* Table: PENGIRIMAN                                            */
/*==============================================================*/
create table PENGIRIMAN 
(
   KODE_PENGIRIMAN      varchar(50)                    not null,
   KODE_PEMESANAN       varchar(50)                    not null,
   ID_CUSTOMER          varchar(50)                    not null,
   TANGGAL_PENGIRIMAN   datetime                      null,
   TANGGAL_ESTIMASI     datetime                     null,
   STATUS_PENGIRIMAN    varchar(50)                    null,
   constraint PK_PENGIRIMAN primary key (KODE_PENGIRIMAN)
);

/*==============================================================*/
/* Index: PENGIRIMAN_PK                                         */
/*==============================================================*/
create unique index PENGIRIMAN_PK on PENGIRIMAN (
KODE_PENGIRIMAN ASC
);

/*==============================================================*/
/* Index: MEMUAT_FK                                             */
/*==============================================================*/
create index MEMUAT_FK on PENGIRIMAN (
KODE_PEMESANAN ASC
);

/*==============================================================*/
/* Index: DI_KIRIM_FK                                           */
/*==============================================================*/
create index DI_KIRIM_FK on PENGIRIMAN (
ID_CUSTOMER ASC
);

/*==============================================================*/
/* Table: PESANAN                                               */
/*==============================================================*/
create table PESANAN 
(
   KODE_PEMESANAN       varchar(50)                    not null,
   ID_CUSTOMER          varchar(50)                    null,
   CUS_ID_CUSTOMER      varchar(50)                    not null,
   TANGGAL_PEMESANAN    timestamp                      null,
   RINCIAN_HARGA        varchar(100)                   null,
   TOTAL_HARGA          varchar(100)                   null,
   DETAIL_PESANAN       varchar(100)                   null,
   constraint PK_PESANAN primary key (KODE_PEMESANAN)
);

/*==============================================================*/
/* Index: PESANAN_PK                                            */
/*==============================================================*/
create unique index PESANAN_PK on PESANAN (
KODE_PEMESANAN ASC
);

/*==============================================================*/
/* Index: MEMBUAT_FK                                            */
/*==============================================================*/
create index MEMBUAT_FK on PESANAN (
CUS_ID_CUSTOMER ASC
);

/*==============================================================*/
/* Index: MELIHAT2_FK                                           */
/*==============================================================*/
create index MELIHAT2_FK on PESANAN (
ID_CUSTOMER ASC
);

/*==============================================================*/
/* Table: PRODUK                                                */
/*==============================================================*/
create table PRODUK 
(
   KODE_PRODUK          varchar(50)                    not null,
   ID_KATEGORI          varchar(50)                    null,
   ID_KERANJANG         varchar(50)                    null,
   KODE_PEMESANAN       varchar(50)                    null,
   KODE_PEMBAYARAN      varchar(50)                    null,
   ID_CUSTOMER          varchar(50)                    null,
   NAMA_PRODUK          varchar(50)                    null,
   STOK                 integer                        null,
   HARGA                varchar(100)                   null,
   UKURAN               varchar(10)                    null,
   WARNA                varchar(20)                    null,
   RATING               varchar(10)                    null,
   constraint PK_PRODUK primary key (KODE_PRODUK)
);

/*==============================================================*/
/* Index: PRODUK_PK                                             */
/*==============================================================*/
create unique index PRODUK_PK on PRODUK (
KODE_PRODUK ASC
);

/*==============================================================*/
/* Index: MENYIMPAN_FK                                          */
/*==============================================================*/
create index MENYIMPAN_FK on PRODUK (
ID_KERANJANG ASC
);

/*==============================================================*/
/* Index: TERKAIT_FK                                            */
/*==============================================================*/
create index TERKAIT_FK on PRODUK (
KODE_PEMESANAN ASC
);

/*==============================================================*/
/* Index: BERKAITAN_FK                                          */
/*==============================================================*/
create index BERKAITAN_FK on PRODUK (
KODE_PEMBAYARAN ASC
);

/*==============================================================*/
/* Index: MEMILIH_FK                                            */
/*==============================================================*/
create index MEMILIH_FK on PRODUK (
ID_CUSTOMER ASC
);

alter table CUSTOMER
   add constraint FK_CUSTOMER_MELAKUKAN_PEMBAYAR foreign key (KODE_PEMBAYARAN)
      references PEMBAYARAN (KODE_PEMBAYARAN);

alter table CUSTOMER
   add constraint FK_CUSTOMER_MENGAKSES_KERANJAN foreign key (ID_KERANJANG)
      references KERANJANG (ID_KERANJANG);

alter table CUSTOMER
   add constraint FK_CUSTOMER_MENGECEK_PESANAN foreign key (KODE_PEMESANAN)
      references PESANAN (KODE_PEMESANAN);

alter table KATEGORI
   add constraint FK_KATEGORI_MELIHAT_CUSTOMER foreign key (ID_CUSTOMER)
      references CUSTOMER (ID_CUSTOMER);

alter table KERANJANG
   add constraint FK_KERANJAN_MENGAKSES_CUSTOMER foreign key (ID_CUSTOMER)
      references CUSTOMER (ID_CUSTOMER);

alter table PEMBAYARAN
   add constraint FK_PEMBAYAR_MELAKUKAN_CUSTOMER foreign key (ID_CUSTOMER)
      references CUSTOMER (ID_CUSTOMER);

alter table PENGIRIMAN
   add constraint FK_PENGIRIM_DI_KIRIM_CUSTOMER foreign key (ID_CUSTOMER)
      references CUSTOMER (ID_CUSTOMER);

alter table PENGIRIMAN
   add constraint FK_PENGIRIM_MEMUAT_PESANAN foreign key (KODE_PEMESANAN)
      references PESANAN (KODE_PEMESANAN);

alter table PESANAN
   add constraint FK_PESANAN_MEMBUAT_CUSTOMER foreign key (CUS_ID_CUSTOMER)
      references CUSTOMER (ID_CUSTOMER);

alter table PESANAN
   add constraint FK_PESANAN_MENGECEK2_CUSTOMER foreign key (ID_CUSTOMER)
      references CUSTOMER (ID_CUSTOMER);

alter table PRODUK
   add constraint FK_PRODUK_BERISI_KATEGORI foreign key (KODE_PRODUK)
      references KATEGORI (ID_KATEGORI);

alter table PRODUK
   add constraint FK_PRODUK_BERKAITAN_PEMBAYAR foreign key (KODE_PEMBAYARAN)
      references PEMBAYARAN (KODE_PEMBAYARAN);

alter table PRODUK
   add constraint FK_PRODUK_MEMILIH_CUSTOMER foreign key (ID_CUSTOMER)
      references CUSTOMER (ID_CUSTOMER);

alter table PRODUK
   add constraint FK_PRODUK_MENYIMPAN_KERANJAN foreign key (ID_KERANJANG)
      references KERANJANG (ID_KERANJANG);

alter table PRODUK
   add constraint FK_PRODUK_TERKAIT_PESANAN foreign key (KODE_PEMESANAN)
      references PESANAN (KODE_PEMESANAN);
