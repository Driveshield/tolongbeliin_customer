import 'dart:convert';

import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:tolongbeliin_costumer/Cekoutpesanan.dart';
import 'package:tolongbeliin_costumer/Loginenduser.dart';
import 'package:tolongbeliin_costumer/utils/Form.dart';
import 'package:tolongbeliin_costumer/utils/Styling.dart';
import 'package:http/http.dart' as http;


class Carapesan1 extends StatefulWidget {
  //Carapesan1({super.key});
  Carapesan1({super.key , required this.storeForm, required this.produkForm, this.ispesan});
  StoreForm storeForm;
  ProductForm produkForm;
  bool? ispesan;
  // String gambar;
  // String idjenis;

  @override
  State<Carapesan1> createState() => _Carapesan1();
}

class _Carapesan1 extends State<Carapesan1> {
// class Carapesan1 extends StatelessWidget {
//   Carapesan1({
//     Key? key,
//   }) : super(key: key);
final TextEditingController notecustomerController= TextEditingController();
final TextEditingController jumlahController= TextEditingController();
int totalharga = 0;
bool isproses = false;
// String? idDevice;
// OneSignalID onesignal = OneSignalID();
// bool? isgetid = false;
// // List<ListPesananHeaderForm> pesananbasketheader = [];
// ListPesananHeaderForm pesananbasketheader = ListPesananHeaderForm();



// Future <void> addBasket ()  async {



// }


  Future<http.Response> cekUser(String onesignalID) {
    return http.post(
      Uri.parse('https://dev.tolongbeliin.com/api/customer/cekLoginIDDevice'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'idonesignal': onesignalID,
      }),
    );
  }

  Future <void> addBasket (context)  async {

    // print(widget.ispesan);
      setState(() {
          isproses = true;
        });
      OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

      OneSignal.shared.setAppId("c768598b-2ee5-442d-8ec5-619e8033498c");

      final status = await OneSignal.shared.getDeviceState();
      final String? osUserID = status?.userId;

      //prosesLogin(context);

      print(osUserID);

      http.Response response = await cekUser(osUserID!);
      print(response.statusCode);
      final data = json.decode(response.body);
      if(data['status'].toString() == 'false') {
        String errorMessage = data['message'];
        setState(() {
          isproses = false;
        });

        ArtSweetAlert.show(
                                                context: context,
                                                artDialogArgs: ArtDialogArgs(
                                                    type: ArtSweetAlertType.info,
                                                    title: "Error!",
                                                    text: errorMessage));
        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  
                            //ConfirmationOrder()
                            //HomeMerchantScreen(fullname: data['data'][0]['fullname'],)
                            Loginenduser(ispesan: true,storeForm: widget.storeForm,produkForm: widget.produkForm,)
                            ),
                          );        

        
      }else if(response.statusCode != 200) {

        String errorMessage = data['message'];
        setState(() {
          isproses = false;
        });

        ArtSweetAlert.show(
                                                context: context,
                                                artDialogArgs: ArtDialogArgs(
                                                    type: ArtSweetAlertType.info,
                                                    title: "Error!",
                                                    text: errorMessage));

      }
      else {

        setState(() {
          isproses = true;
        });

        //String errorMessage = data['data'][0]['user_id'];

        http.Response response2 = await apitambahBasket(widget.storeForm,widget.produkForm,data['data'][0]['user_id'].toString(),false);
          //print(response.statusCode);
          final data2 = json.decode(response2.body);
          if(data2['status'].toString() == 'false') {
            String errorMessage = data2['message'];
            setState(() {
              isproses = false;
            });

            if(errorMessage == "1")
            {

              ArtDialogResponse response = await ArtSweetAlert.show(
                  barrierDismissible: false,
                  context: context,
                  artDialogArgs: ArtDialogArgs(
                    //showCancelBtn: true,
                    denyButtonText: "Tidak",
                    title: "Anda Ingin Mengganti Pesanan Toko Lain",
                    confirmButtonText: "Ya",
                  ));

              if (response == null) {
                return;
              }

              if (response.isTapConfirmButton) {

                  http.Response response2 = await apitambahBasket(
                      widget.storeForm,
                      widget.produkForm,
                      data['data'][0]['user_id'].toString(),
                      true);
                  //print(response.statusCode);
                  final data2 = json.decode(response2.body);
                  if (data2['status'].toString() == 'false') {
                    String errorMessage = data2['message'];
                    setState(() {
                      isproses = false;
                    });

                    ArtSweetAlert.show(
                        context: context,
                        artDialogArgs: ArtDialogArgs(
                            type: ArtSweetAlertType.info,
                            title: "Info!",
                            text: errorMessage));
                  } else if (response2.statusCode != 200) {
                    String errorMessage = data2['message'];
                    setState(() {
                      isproses = false;
                    });

                    ArtSweetAlert.show(
                        context: context,
                        artDialogArgs: ArtDialogArgs(
                            type: ArtSweetAlertType.info,
                            title: "Info!",
                            text: errorMessage));
                  } else {
                    setState(() {
                      isproses = false;
                    });

                    String errorMessage = data2['message'];

                    ArtSweetAlert.show(
                        context: context,
                        artDialogArgs: ArtDialogArgs(
                            type: ArtSweetAlertType.info,
                            title: "Success!",
                            text: errorMessage));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              //ConfirmationOrder()
                              //HomeMerchantScreen(fullname: data['data'][0]['fullname'],)
                              //Loginenduser(ispesan: true,storeForm: widget.storeForm,produkForm: widget.produkForm,)
                              Cekoutpesanan(
                                storeForm: widget.storeForm,
                              )),
                    );
                  }
              }

              if (response.isTapDenyButton) {
                // ArtSweetAlert.show(
                //     context: context,
                //     artDialogArgs: ArtDialogArgs(
                //         type: ArtSweetAlertType.info,
                //         title: "Changes are not saved!"));
                return;
              }

            }else{

              ArtSweetAlert.show(
                                                    context: context,
                                                    artDialogArgs: ArtDialogArgs(
                                                        type: ArtSweetAlertType.info,
                                                        title: "Info!",
                                                        text: errorMessage));  

            }

            

            
          }else if(response2.statusCode != 200) {

            String errorMessage = data2['message'];
            setState(() {
              isproses = false;
            });

            ArtSweetAlert.show(
                                                    context: context,
                                                    artDialogArgs: ArtDialogArgs(
                                                        type: ArtSweetAlertType.info,
                                                        title: "Info!",
                                                        text: errorMessage));

          }
          else {

            setState(() {
              isproses = false;
            });

            String errorMessage = data2['message'];

            ArtSweetAlert.show(
                                                    context: context,
                                                    artDialogArgs: ArtDialogArgs(
                                                        type: ArtSweetAlertType.info,
                                                        title: "Success!",
                                                        text: errorMessage));
            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  
                            //ConfirmationOrder()
                            //HomeMerchantScreen(fullname: data['data'][0]['fullname'],)
                            //Loginenduser(ispesan: true,storeForm: widget.storeForm,produkForm: widget.produkForm,)
                            Cekoutpesanan(storeForm: widget.storeForm,)
                            ),
                          );        

            

            

          }



        

      }

  }

  
  Future<http.Response> apitambahBasket(StoreForm storeform2, ProductForm produkform2, String idcustomer, bool ischange) {

    return http.post(
      Uri.parse('https://dev.tolongbeliin.com/api/transaction/tambahdetailpesanan'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'idcustomer': idcustomer,
        'id_product': produkform2.produk_id.toString(),
        'jumlah': produkform2.jmlbarang.toString(),
        'hargajual': produkform2.produk_harga.toString(),
        'stokproduk': produkform2.produk_stok.toString(),
        'totalharga': produkform2.totalharga.toString(),
        'idmerchant': storeform2.storeId.toString(),
        'note_produk': produkform2.produk_note.toString(),
        'ischange': ischange.toString()
      }),
    );
  }

  




@override
  void initState() {
    super.initState();

    if(widget.produkForm.produk_note != null)
    {
      notecustomerController.text = widget.produkForm.produk_note.toString();
    }else{

      notecustomerController.text = 'Note to restaurants';

    }

    if(widget.produkForm.jmlbarang != null)
    {
      jumlahController.text = widget.produkForm.jmlbarang.toString();
    }else{

      jumlahController.text = '';

    }

    if(widget.produkForm.totalharga != null)
    {
      totalharga = int.parse(widget.produkForm.totalharga.toString());
    }else{

      totalharga = 0 ;

    }


    
  }


  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: const Color(0xfff7f7fa),
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          Pinned.fromPins(
            Pin(start: -42.0, end: -28.0),
            Pin(size: 309.0, start: -150.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff008037),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                  bottomRight: Radius.circular(260.0),
                  bottomLeft: Radius.circular(30.0),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.008, 0.111),
            child: SizedBox(
              width: 248.0,
              height: 29.0,
              child: Stack(
                children: <Widget>[
                  SizedBox.expand(
                      child: Text(
                    widget.storeForm.name.toString(),
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 25,
                      color: const Color(0xcc000000),
                      shadows: [
                        Shadow(
                          color: const Color(0x29000000),
                          offset: Offset(0, 5),
                          blurRadius: 6,
                        )
                      ],
                    ),
                    softWrap: false,
                  )),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.597, 0.223),
            child: SizedBox(
              width: 92.0,
              height: 30.0,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x29000000),
                          offset: Offset(0, 7),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.2, -1.0),
                    child: SizedBox(
                      width: 52.0,
                      height: 12.0,
                      child: Text(
                        widget.produkForm.produk_nama.toString(),
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 8,
                          color: const Color(0xcc000000),
                        ),
                        softWrap: false,
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 49.0, middle: 0.5814),
                    Pin(size: 12.0, end: 3.0),
                    child: Text(
                      'Rp. '+widget.produkForm.produk_harga.toString()+'',
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 10,
                        color: const Color(0xcc000000),
                      ),
                      softWrap: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 375.0, start: 55.0),
            child: Container(
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     image: const AssetImage('assets/ovo.png'),
              //     fit: BoxFit.cover,
              //   ),
              //   borderRadius: BorderRadius.circular(12.0),
              // ),
              child: Image.network(
                                                          widget.produkForm.produk_foto.toString(),
                                                          width: 100,
                                                          fit: BoxFit.fitWidth,
                                                          errorBuilder: (ctx, o, n) {
                                                          //print(o);
                                                          return Image.asset(
                                                            'assets/tolong beliin.png',
                                                            width: 100,
                                                            fit: BoxFit.fitWidth,
                                                          );
                                                        },
                                                        ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 9.0, end: 8.0),
            Pin(size: 30.0, middle: 0.6739),
            child: Stack(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet<void>(
                                        context: context,
                                        // constraints: BoxConstraints.loose(const Size.fromHeight(1500)),
                                        //loose(const Size.fromHeight(1000)),
                                        //expand(width: screen.width,height: screen.height),
                                        useSafeArea: false,
                                        // shape: Border(top: BorderSide(width: 2.0,style: BorderStyle.solid)),
                                        builder: (BuildContext context) {
                                          return 
                                          Scaffold(
                                            resizeToAvoidBottomInset: true,
                                            persistentFooterAlignment: AlignmentDirectional.bottomEnd,
                                            persistentFooterButtons: 
                                            [
                                              GestureDetector(
                                                onTap: () {
                                                    Navigator.pop(context);
                                                },
                                                child: SizedBox(
                                                width: 100,
                                                child: Container(
                                                                    width: 50,
                                                                    margin: EdgeInsets.only(bottom: 20),
                                                                    decoration: BoxDecoration(
                                                                      color: const Color(0xff008900),
                                                                      borderRadius: BorderRadius.circular(16.0),
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          color: const Color(0x29000000),
                                                                          offset: Offset(0, 7),
                                                                          blurRadius: 6,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    child: Center(
                                                                      child: Text(
                                                                          'Save',
                                                                          style: TextStyle(
                                                                            fontFamily: 'Rubik',
                                                                            fontSize: 24,
                                                                            color: const Color(0xcc000000),
                                                                          ),
                                                                          softWrap: false,
                                                                        ),
                                                                    ),
                                                              ),
                                                                                          ),
                                              ),
                                            ],
                                            body: SizedBox(
                                              height: screen.height,
                                              child: Container(
                                                width: screen.width,
                                                decoration: BoxDecoration(
                                                  color: Colors
                                                      .white, // Color.fromARGB(255, 247, 244, 244),
                                                  // border: Border.all(
                                                  //   width: 0,
                                                  // ),
                                                  // borderRadius: BorderRadius.only(topLeft: Radius.circular(100),topRight: Radius.circular(100)),
                                                ),
                                                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    mainAxisSize: MainAxisSize.max,
                                                    children: <Widget>[
                                                      SizedBox(height:20.0),
                                                      Text('Notes Restaurants',textAlign: TextAlign.left,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                                                      SizedBox(height:20.0),
                                                      TextFormField(
                                                            autocorrect: true,
                                                            minLines: 10,
                                                            maxLines: null,
                                                            style: TextStyle(backgroundColor: const Color(0xffffffff)),
                                                            //controller: emailphoneController,
                                                            onChanged: (value) {

                                                                  notecustomerController.text = value;
                                                            },
                                                            validator: (value) {
                                                              // if (value!.isEmpty) {
                                                              //   return 'Email/Nomor HP tidak boleh kosong';
                                                              // }
                                                              return null;
                                                            },
                                                            decoration: InputDecoration(
                                                              filled: true,
                                                              fillColor: const Color(0xffffffff),
                                                              border: const OutlineInputBorder(
                                                                borderSide: BorderSide.none,
                                                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                                              ),
                                                              contentPadding:const EdgeInsets.symmetric(horizontal: 16),
                                                              hintText: 'e.g Plase leave your message in here',
                                                              // hintText:'',
                                                              labelStyle: const TextStyle(
                                                                color: Colors.black
                                                              )
                                                            ),
                                                            // decoration: TextFieldStyle.textFieldStyle(
                                                            //     hintTextStr: "Note to restaurants",
                                                            //     // labelTextStr: "Note to restaurants"
                                                            // ),
                                                            // style: TextStyle(backgroundColor: Colors.white),
                                                          ),



                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          
                                          );
                                        
                                        },
                                      );
                    },
                    child: Stack(
                      children: <Widget>[
                        
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffffffff),
                            borderRadius: BorderRadius.circular(16.0),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0x29000000),
                                offset: Offset(0, 7),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment(0.049, 0.0),
                          child: SizedBox(
                            width: 154.0,
                            height: 20.0,
                            child: Text(
                              notecustomerController.text,
                              style: TextStyle(
                                fontFamily: 'Rubik',
                                fontSize: 17,
                                color: const Color(0xcc707070),
                              ),
                              softWrap: false,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 29.0, end: 6.0),
                    Pin(start: 2.7, end: 2.7),
                    child: SvgPicture.string(
                      _svg_ifqg2a,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
          ),
          Pinned.fromPins(
              Pin(start: 0.0, end: 0.0),
              Pin(size: 43.0, end: 80.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    width: screen.width,
                    alignment: Alignment.centerLeft,
                    height: 50.0,
                    decoration: BoxDecoration(
                      // color: const Color(0xffffffff),
                      // borderRadius: BorderRadius.circular(16.0),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: const Color(0x29000000),
                      //     offset: Offset(0, 2),
                      //     blurRadius: 6,
                      //   ),
                      // ],
                    ),
                    child: Text(
                        textAlign: TextAlign.left,
                        'Total Harga : Rp. '+totalharga.toString()+'',
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 25,
                          color: const Color(0xcc000000),
                        ),
                        softWrap: false,
                      ),
                  ),
                  // Align(
                  //   alignment: Alignment(0.000, 0.000),
                  //   child: SizedBox(
                  //     width: 192.0,
                  //     height: 36.0,
                  //     child: 
                  //   ),
                  // ),
                ],
              ),
          ),
          isproses == false ?
          Pinned.fromPins(
              Pin(start: 0.0, end: 0.0),
              Pin(size: 53.0, end: 13.0),
              child: GestureDetector(
                onTap: () {

                  if(totalharga > 0)
                  {
                    setState(() {

                      widget.produkForm.jmlbarang = int.parse(jumlahController.text.toString());
                      widget.produkForm.produk_note = notecustomerController.text;
                      widget.produkForm.totalharga = totalharga;

                    });

                    addBasket(context);
                  }else{
                    final snackBar = SnackBar(
                      content:  Container(height: 25, child: Text(
                          'Masukkan jumlah pesanan',
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            fontSize: 18,
                            color: const Color(0xffffffff)
                          ),
                          softWrap: false,
                        ),),
                      // action: SnackBarAction(
                      //   label: 'Undo',
                      //   onPressed: () {
                      //     // Some code to undo the change.
                      //   },
                      // ),
                    );

                    // Find the ScaffoldMessenger in the widget tree
                    // and use it to show a SnackBar.
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  
                  // 
                },
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff008900),
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x29000000),
                            offset: Offset(0, 7),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.005, 0.059),
                      child: SizedBox(
                        width: 192.0,
                        height: 36.0,
                        child: Text(
                          'Add to basket',
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            fontSize: 30,
                            color: const Color(0xcc000000),
                          ),
                          softWrap: false,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ) : 
          Pinned.fromPins(
              Pin(start: 0.0, end: 0.0),
              Pin(size: 53.0, end: 13.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff008900),
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x29000000),
                          offset: Offset(0, 7),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.005, 0.059),
                    child: SizedBox(
                      width: screen.width,
                      height: 36.0,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          CircularProgressIndicator(color: Colors.black),
                          Text(
                          '  Mohon tunggu',
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            fontSize: 30,
                            color: const Color(0xcc000000),
                          ),
                          softWrap: false,
                        ),

                          ]),
                      ),
                    ),
                  ),
                ],
              ),
          ),
        
          Pinned.fromPins(
            Pin(size: 23.0, start: 45.0),
            Pin(size: 12.0, start: 79.0),
            child: Text(
              'Back',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 10,
                color: const Color(0xcc008037),
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 29.3, start: 8.8),
            Pin(size: 29.3, start: 70.0),
            child: SvgPicture.string(
              _svg_rezsfx,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment(-0.022, 0.508),
            child: SizedBox(
              width: 191.0,
              height: 32.0,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment(0.1, 1.0),
                    child: Container(
                      width: 81.0,
                      height: 27.0,
                      decoration: BoxDecoration(
                        color: const Color(0xfff7f7fa),
                        borderRadius: BorderRadius.circular(40.0),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x663e64ff),
                            offset: Offset(0, 0),
                            blurRadius: 20,
                          ),
                        ],


                      ),
                      child:
                        TextFormField(
                                                            autocorrect: true,
                                                            minLines: 1,
                                                            maxLines: 1,
                                                            textAlign: TextAlign.center,
                                                            keyboardType: TextInputType.number,
                                                            style: TextStyle(backgroundColor: const Color(0xffffffff)),
                                                            //controller: emailphoneController,
                                                            onChanged: (value) {

                                                                  jumlahController.text = value;

                                                                  totalharga = int.parse(value.toString()) * int.parse(widget.produkForm.produk_harga.toString());
                                                            },
                                                            controller: jumlahController,
                                                            validator: (value) {
                                                              // if (value!.isEmpty) {
                                                              //   return 'Email/Nomor HP tidak boleh kosong';
                                                              // }
                                                              return null;
                                                            },
                                                            decoration: InputDecoration(
                                                              filled: true,
                                                              fillColor: const Color(0xffffffff),
                                                              border: const OutlineInputBorder(
                                                                borderSide: BorderSide.none,
                                                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                                              ),
                                                              contentPadding:const EdgeInsets.symmetric(horizontal: 16),
                                                              // hintText: 'e.g Plase leave your message in here',
                                                              // hintText:'',
                                                              labelStyle: const TextStyle(
                                                                color: Colors.black
                                                              )
                                                            ),
                                                            // decoration: TextFieldStyle.textFieldStyle(
                                                            //     hintTextStr: "Note to restaurants",
                                                            //     // labelTextStr: "Note to restaurants"
                                                            // ),
                                                            // style: TextStyle(backgroundColor: Colors.white),
                                                          )
                    ),
                  ),

                  //gambar ijo button plus minus
                  // Pinned.fromPins(
                  //   Pin(size: 35.0, end: 0.0),
                  //   Pin(start: 0.0, end: 0.0),
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       color: const Color(0xff008900),
                  //       borderRadius: BorderRadius.circular(40.0),
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: const Color(0x663e64ff),
                  //           offset: Offset(0, 0),
                  //           blurRadius: 20,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // Pinned.fromPins(
                  //   Pin(size: 37.0, start: 0.0),
                  //   Pin(start: 0.0, end: 0.0),
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       color: const Color(0xff008900),
                  //       borderRadius: BorderRadius.circular(40.0),
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: const Color(0x663e64ff),
                  //           offset: Offset(0, 0),
                  //           blurRadius: 20,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),



                ],
              ),
            ),
          ),
          // Align(
          //   alignment: Alignment(-0.422, 0.509),
          //   child: Center(
          //     child: SizedBox(
          //       width: 16.0,
          //       height: 38.0,
          //       child: Center(
          //         child: Text(
          //           '+ ',
          //           style: TextStyle(
          //             fontFamily: 'Rubik',
          //             fontSize: 32,
          //             color: const Color(0xfff7f7fa),
          //           ),
          //           softWrap: false,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          GestureDetector(
            onTap: () {
              setState(() { 
                  jumlahController.text = ((int.parse(((jumlahController.text == '') ? 0 : jumlahController.text).toString()) - 1) > 0 ? 
                  (int.parse(((jumlahController.text == '') ? 0 : jumlahController.text).toString()) - 1) : 0 ).toString();

                  totalharga = int.parse(jumlahController.text.toString()) * int.parse(widget.produkForm.produk_harga.toString());

                  
            });
            },
            child: Align(
              alignment: Alignment(-0.430, 0.509),
              child: SizedBox(
                width: 25.0,
                height: 38.0,
                child: CircleAvatar(
    backgroundColor: Colors.green,
                  child: Center(
                    child: Text(
                      '-',
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 25,
                        color: const Color(0xfff7f7fa),
                      ),
                      softWrap: false,
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
                //int jml = int.parse(jumlahController.text.toString());

                //int jmll = jml++;

                //print(jml);

                setState(() {
                  jumlahController.text = (int.parse(((jumlahController.text == '') ? 0 : jumlahController.text).toString()) + 1).toString();

                  totalharga = int.parse(jumlahController.text.toString()) * int.parse(widget.produkForm.produk_harga.toString());
                });


            },
            child: Align(
              alignment: Alignment(0.476, 0.509),
              child: SizedBox(
                width: 25.0,
                height: 38.0,
                child: CircleAvatar(

                  // width: 10,
                  // height: 10,
                  // color: Colors.green,
                  backgroundColor: Colors.green,
                  child: Center(
                    child: Text(
                      '+',
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 25,
                        color: const Color(0xfff7f7fa),
                        // color: Colors.black,
                      ),
                      softWrap: false,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Align(
          //   alignment: Alignment(0.0, 0.512),
          //   child: SizedBox(
          //     width: 9.0,
          //     height: 25.0,
          //     child: Text(
          //       '1',
          //       style: TextStyle(
          //         fontFamily: 'Rubik',
          //         fontSize: 21,
          //         color: const Color(0xfff7f7fa),
          //       ),
          //       softWrap: false,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

const String _svg_ifqg2a =
    '<svg viewBox="333.6 729.7 29.0 24.7" ><path transform="translate(333.6, 727.42)" d="M 14.521728515625 2.25 C 6.50074291229248 2.25 0 7.374194622039795 0 13.6982536315918 C 0 16.42822074890137 1.213925838470459 18.92702293395996 3.233353614807129 20.89193916320801 C 2.524284839630127 23.66593742370605 0.1531588435173035 26.13722038269043 0.124796099960804 26.16473960876465 C 0 26.29133224487305 -0.03403531014919281 26.47846412658691 0.03970784693956375 26.64358329772949 C 0.1134510040283203 26.80870246887207 0.2722824215888977 26.90777587890625 0.4538040161132812 26.90777587890625 C 4.214704990386963 26.90777587890625 7.033962249755859 25.15751457214355 8.429409980773926 24.0787353515625 C 10.28433322906494 24.75572395324707 12.34346961975098 25.14650535583496 14.521728515625 25.14650535583496 C 22.54271507263184 25.14650535583496 29.04345703125 20.02231216430664 29.04345703125 13.6982536315918 C 29.04345703125 7.374193668365479 22.54271507263184 2.25 14.521728515625 2.25 Z M 7.2608642578125 15.45952320098877 C 6.256823062896729 15.45952320098877 5.445648193359375 14.67245578765869 5.445648193359375 13.6982536315918 C 5.445648193359375 12.72405052185059 6.256823062896729 11.93698406219482 7.2608642578125 11.93698406219482 C 8.26490592956543 11.93698406219482 9.076080322265625 12.72405052185059 9.076080322265625 13.6982536315918 C 9.076080322265625 14.67245578765869 8.26490592956543 15.45952320098877 7.2608642578125 15.45952320098877 Z M 14.521728515625 15.45952320098877 C 13.51768684387207 15.45952320098877 12.70651245117188 14.67245578765869 12.70651245117188 13.6982536315918 C 12.70651245117188 12.72405052185059 13.51768684387207 11.93698406219482 14.521728515625 11.93698406219482 C 15.52577018737793 11.93698406219482 16.33694458007812 12.72405052185059 16.33694458007812 13.6982536315918 C 16.33694458007812 14.67245578765869 15.52577018737793 15.45952320098877 14.521728515625 15.45952320098877 Z M 21.7825927734375 15.45952320098877 C 20.77855110168457 15.45952320098877 19.96737670898438 14.67245578765869 19.96737670898438 13.6982536315918 C 19.96737670898438 12.72405052185059 20.77855110168457 11.93698406219482 21.7825927734375 11.93698406219482 C 22.78663444519043 11.93698406219482 23.59780883789062 12.72405052185059 23.59780883789062 13.6982536315918 C 23.59780883789062 14.67245578765869 22.78663444519043 15.45952320098877 21.7825927734375 15.45952320098877 Z" fill="#8d8d8d" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_rezsfx =
    '<svg viewBox="8.8 70.0 29.3 29.3" ><path transform="translate(5.38, 66.63)" d="M 18 3.375 C 9.921093940734863 3.375 3.375 9.921093940734863 3.375 18 C 3.375 26.07890701293945 9.921093940734863 32.625 18 32.625 C 26.07890701293945 32.625 32.625 26.07890701293945 32.625 18 C 32.625 9.921092987060547 26.07890701293945 3.375 18 3.375 Z M 21.05156326293945 23.70234298706055 C 21.57890701293945 24.22968673706055 21.57890701293945 25.09453010559082 21.05156326293945 25.62187385559082 C 20.78437614440918 25.88906097412109 20.43984413146973 26.01562309265137 20.09531402587891 26.01562309265137 C 19.75078201293945 26.01562309265137 19.39921951293945 25.88202857971191 19.13203239440918 25.61484146118164 L 12.52265739440918 18.98437309265137 C 12.03750133514404 18.44999885559082 12.05156326293945 17.62734222412109 12.56484508514404 17.11406135559082 L 19.27265739440918 10.38515472412109 C 19.80000114440918 9.857810974121094 20.65781402587891 9.85077953338623 21.19218826293945 10.38515472412109 C 21.71953201293945 10.91249847412109 21.7265625 11.77031135559082 21.19218826293945 12.30468559265137 L 15.43359375 18 L 21.05156326293945 23.70234298706055 Z" fill="#008037" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
