import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;




class ListViewPagination extends StatefulWidget {
  const ListViewPagination({Key? key}) : super(key: key);

  @override
  State<ListViewPagination> createState() => _HomePageState();
}

class _HomePageState extends State<ListViewPagination> {
  // We will fetch data from this Rest api
  final _baseUrl = 'https://dev.tolongbeliin.com/api/transaction/listproduk';

  // At the beginning, we fetch the first 20 posts
  int _page = 0;
  // you can change this value to fetch more or less posts per page (10, 15, 5, etc)
  final int _limit = 20;

  // There is next page or not
  bool _hasNextPage = true;

  // Used to display loading indicators when _firstLoad function is running
  bool _isFirstLoadRunning = false;

  // Used to display loading indicators when _loadMore function is running
  bool _isLoadMoreRunning = false;

  // This holds the posts fetched from the server
  List _posts = [];

  // This function will be called when the app launches (see the initState function)
  void _firstLoad() async {
    setState(() {
      _isFirstLoadRunning = true;
    });
    try {
      // final res =
      //     await http.get(Uri.parse("$_baseUrl?kategori_id=1&page=$_page&size=$_limit"));
      // setState(() {
      //   _posts = json.decode(res.body);
      // });
      var headers = {
        'Content-Type': 'application/x-www-form-urlencoded'
      };
      var request = http.Request('GET', Uri.parse('https://dev.tolongbeliin.com/api/transaction/listproduk'));
      request.bodyFields = {
        'kategori_id': '1',
        'page': '$_page',
        'size': '$_limit',
        'title': ''
      };
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        //print(await response.stream.bytesToString());

        var res = await response.stream.bytesToString();

        final fetchedPosts = json.decode(res);

        //print(json.decode(res));

        // _posts.addAll(fetchedPosts);
        print(fetchedPosts['data']);

        if(fetchedPosts['status'].toString() == 'true') {

            //print(json.decode(fetchedPosts['data']));

            setState(() {
            _posts = fetchedPosts['data'];
            });

        }

        

        //print(json.decode(res));
      }
      else {
        print(response.reasonPhrase);
      }
    } catch (err) {
      if (kDebugMode) {
        print('Something went wrong 2');
      }
    }

    setState(() {
      _isFirstLoadRunning = false;
    });
  }

  // This function will be triggered whenver the user scroll
  // to near the bottom of the list view
  void _loadMore() async {
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        _controller.position.extentAfter < 300) {
      setState(() {
        _isLoadMoreRunning = true; // Display a progress indicator at the bottom
      });
      _page += 1; // Increase _page by 1
      try {
        // final res =
        //     await http.get(Uri.parse("$_baseUrl?kategori_id=1&page=$_page&size=$_limit"));
        var headers = {
          'Content-Type': 'application/x-www-form-urlencoded'
        };
        var request = http.Request('GET', Uri.parse('https://dev.tolongbeliin.com/api/transaction/listproduk'));
        request.bodyFields = {
          'kategori_id': '1',
          'page': '$_page',
          'size': '$_limit',
          'title': ''
        };
        request.headers.addAll(headers);

        http.StreamedResponse response = await request.send();

        if (response.statusCode == 200) {
          //print(await response.stream.bytesToString());

          var res = await response.stream.bytesToString();

          //final List fetchedPosts = json.decode(res);

          //print(json.decode(res));

          // _posts.addAll(fetchedPosts);
          final fetchedPosts2 = json.decode(res);

          //print(json.decode(res));

          // _posts.addAll(fetchedPosts);

          if(fetchedPosts2['status'].toString() == 'true') {


              final List fetchedPosts = fetchedPosts2['data'];
              if (fetchedPosts.isNotEmpty) {
                setState(() {
                  _posts.addAll(fetchedPosts);
                });
              } else {
                // This means there is no more data
                // and therefore, we will not send another GET request
                setState(() {
                  _hasNextPage = false;
                });
              }

          }

          // final List fetchedPosts = json.decode(res);
          //   if (fetchedPosts.isNotEmpty) {
          //   setState(() {
          //     _posts.addAll(fetchedPosts);
          //   });
          //   } else {
          //     // This means there is no more data
          //     // and therefore, we will not send another GET request
          //     setState(() {
          //       _hasNextPage = false;
          //     });
          //   }

          //print(json.decode(res));
        }
        else {
           setState(() {
            _hasNextPage = false;
            });
        }

        
        
      } catch (err) {
        if (kDebugMode) {
          print('Something went wrong!');
        }
      }

      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }

  // The controller for the ListView
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _firstLoad();
    _controller = ScrollController()..addListener(_loadMore);
  }

  @override
  void dispose() {
    _controller.removeListener(_loadMore);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kindacode.com'),
      ),
      body: _isFirstLoadRunning
          ? const Center(
              child: const CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _controller,
                    itemCount: _posts.length,
                    itemBuilder: (_, index) => Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 10),
                      child: ListTile(
                        title: Text(_posts[index]['produk_nama']),
                        subtitle: Text(_posts[index]['produk_harga']),
                      ),
                    ),
                  ),
                ),

                // when the _loadMore function is running
                if (_isLoadMoreRunning == true)
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 40),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),

                // When nothing else to load
                if (_hasNextPage == false)
                  Container(
                    padding: const EdgeInsets.only(top: 30, bottom: 40),
                    color: Colors.amber,
                    child: const Center(
                      child: Text('You have fetched all of the content'),
                    ),
                  ),
              ],
            ),
    );
  }
}