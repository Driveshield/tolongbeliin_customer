import 'dart:io';
import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserForm {
  String? name;
  File?  photo;
  String? address;
  String? photoSrc;
  String? email;
  int? notlp;
  String? fotoLink;
  String? onesignalid;
  int? userid;
}

class OneSignalID {
  String? idonesignal;
  bool? isnotif;
}

class StoreForm {
  String? name;
  String? address;
  String? photoSrc;
  int? storeId;
  Point? coordinate;
  int? userId;
  int? kategoriId;
}

class ProductForm {
  String? produk_nama;
  String? produk_harga;
  int? produk_stok;
  int? produk_id;
  String? produk_foto;
  String? produk_note;
  int? totalharga;
  int? jmlbarang;
}

class ListPesananHeaderForm {

  int? idtrx;
  int? idcust;
  int? idDriver;
  String? inputdatecust;
  String? inputdatedriver;
  int? idstatus;
  String? ketstatus;
  int? idalamatcust;
  int? jmlpesanan;
  int? totalharga;
  int? idpembayaran;
  String? produknama;
  String? fotoproduk; 
  int? totalhargaproduk;

  ListPesananHeaderForm(this.idtrx, this.idcust, this.idDriver, 
   this.inputdatecust, this.inputdatedriver, this.idstatus
   , this.ketstatus, this.idalamatcust, this.jmlpesanan, this.totalharga
   , this.idpembayaran, this.produknama, this.fotoproduk, this.totalhargaproduk );
}

class SubmitPesananDetailForm {
  int? idcustomer;
  int? idproduct;
  int? jumlah;
  int? hargajual;
  int? stokproduk;
  int? totalharga;
  int? idmerchant;
  String? noteproduk;

  // ListPesananHeaderForm(this.idtrx, this.idcust, this.idDriver, 
  //  this.inputdatecust, this.inputdatedriver, this.idstatus
  //  , this.ketstatus, this.idalamatcust, this.jmlpesanan, this.totalharga
  //  , this.idpembayaran );
}

class UserAlamatForm {

  LatLng? position;
  String? alamatlengkap;
  String? kelurahan;
  String? kecamatan;
  String? kota;
  String? provinsi;
  String? kodepos;
  String? alamatket;
  
}

