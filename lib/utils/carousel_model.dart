class CarouselModel {
  var image;

  CarouselModel(this.image);
}

List<CarouselModel> carousels = carouselsData.map((item) => CarouselModel(item['image'])).toList();

var carouselsData = [
  {"image": "assets/banner/demo1.jpg"},
  {"image": "assets/banner/demo2.jpg"},
  {"image": "assets/banner/demo3.jpg"},
];

// var carouselsData = [
//   {"image": "assets/iklan1.png"},
//   {"image": "assets/iklan2.png"},
// ];

