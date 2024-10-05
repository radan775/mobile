import 'dart:convert';

import 'package:food_delivery/controllers/recomended_product_controller.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:get/get.dart';

class RecomendedProductController extends GetxController {
  final RecomendedProductRepo recomendedProductRepo;
  RecomendedProductController({required this.recomendedProductRepo});
  List<dynamic> _recomendedProductList = [];
  List<dynamic> get recomendedProductList => _recomendedProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecomendedProductList() async {
    // // from api
    // Response response = await recomendedProductRepo.getRecomendedProductList();
    // if (response.statusCode == 200) {
    //   _isLoaded = true;
    //   _recomendedProductList = [];
    //   _recomendedProductList.addAll(Product.fromJson(response.body).products);
    //   update();
    // } else {}
    if (true) {
      _isLoaded = true;
      String _data = '''{
  "total_size": 6,
  "type_id": 2,
  "offset": 0,
  "products": [
    {
      "id": 1,
      "name": "sapi Holstein",
      "description": "This five red bases, two are dedicated to salami (fennel and regular), and there s a classic capricciosa or beef carpaccio. Blanco options include a mushroom, and a four-cheese extravaganza featuring great lobes of a tangy fior di latte they make in house every day (more on this later). Classic, precise, good.I think it s still better to think of this venue not as a pizzeria, but as Pizza, by Di Stasio.Rinaldo Di Stasio and Mallory Wall s empire, including the original restaurant and bar in St Kilda, Citta and now Carlton, is a designer label for dining.",
      "price": 120,
      "stars": 4,
      "img": "assets/image/sapi01.jpg",
      "location": "Canada, British Columbia",
      "created_at": "2021-11-17 10:09:08",
      "updated_at": "2024-07-20 04:47:26",
      "type_id": 2
    },
    {
      "id": 2,
      "name": "sapi limosun",
      "description": "The best sweet dessertThe quality and craftsmanship is on full show. The waiters  signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant s three distinct areas are cast in gentle neon so that even your worst wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell s beautiful video artworks at Citta, Di Stasio doesn t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio s hands jutt out of the wall, immortalised in the sign of the bull – equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled Genesis, goes straight for the jugular of unceded sovereignty.The quality and craftsmanship is on full show. The waiters  signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant s three distinct areas are cast in gentle neon so that even your worst wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell s beautiful video artworks at Citta, Di Stasio doesn t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio s hands jutt out of the wall, immortalised in the sign of the bull – equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled Genesis, goes straight for the jugular of unceded sovereignty.The quality and craftsmanship is on full show. The waiters  signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant s three distinct areas are cast in gentle neon so that even your worst wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell s beautiful video artworks at Citta, Di Stasio doesn t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio s hands jutt out of the wall, immortalised in the sign of the bull – equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled Genesis, goes straight for the jugular of unceded sovereignty.",
      "price": 21,
      "stars": 5,
      "img": "assets/image/sapi02.jpg",
      "location": "Icefields, Alberta",
      "created_at": "2021-11-17 10:10:43",
      "updated_at": "2023-11-08 10:34:46",
      "type_id": 2
    },
    {
      "id": 6,
      "name": "sapi angus",
      "description": "The quality and craftsmanship is on full show. The waiters  signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant s three distinct areas are cast in gentle neon so that even your worst wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell s beautiful video artworks at Citta, Di Stasio doesn t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio s hands jutt out of the wall, immortalised in the sign of the bull – equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled Genesis, goes straight for the jugular of unceded sovereignty.",
      "price": 18,
      "stars": 4,
      "img": "assets/image/sapi03.jpg",
      "location": "china",
      "created_at": "2021-12-23 15:03:24",
      "updated_at": "2023-11-08 10:35:36",
      "type_id": 2
    },
    {
      "id": 7,
      "name": "kambing kacang",
      "description": "The quality and craftsmanship is on full show. The waiters  signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant s three distinct areas are cast in gentle neon so that even your worst wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell s beautiful video artworks at Citta, Di Stasio doesn t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio s hands jutt out of the wall, immortalised in the sign of the bull – equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled Genesis, goes straight for the jugular of unceded sovereignty.",
      "price": 10,
      "stars": 5,
      "img": "assets/image/sapi04.jpg",
      "location": "Cuba",
      "created_at": "2021-12-23 15:04:49",
      "updated_at": "2023-11-08 10:36:26",
      "type_id": 2
    },
    {
      "id": 10,
      "name": "kambing Nubian",
      "description": "Chicken Biryani Served in a Bowl Close Up Photo. Indian Food, Indian Style Rice and Chicken. #Biryani #ChickenBiryani #IndianFood #StockPhoto",
      "price": 12,
      "stars": 4,
      "img": "assets/image/sapi05.jpg",
      "location": "Morocco",
      "created_at": "2021-12-27 06:29:47",
      "updated_at": "2023-11-08 10:31:21",
      "type_id": 2
    },
    {
      "id": 11,
      "name": "kambing boer",
      "description": "Ilish Mach aka Hilsa fish is in the season and needless to say, I cooked it a few times this year as well. This year, however, I have used Ilish mach to make simple delicacies mostly. Ilish Beguner Jhol is probably the simplest of the lot, well, after Ilish Mach Bhaja.Ilish Mach aka Hilsa fish is in the season and needless to say, I cooked it a few times this year as well. This year, however, I have used Ilish mach to make simple delicacies mostly. Ilish Beguner Jhol is probably the simplest of the lot, well, after Ilish Mach Bhaja.Ilish Mach aka Hilsa fish is in the season and needless to say, I cooked it a few times this year as well. This year, however, I have used Ilish mach to make simple delicacies mostly. Ilish Beguner Jhol is probably the simplest of the lot, well, after Ilish Mach Bhaja.",
      "price": 150,
      "stars": 4,
      "img": "assets/image/sapi06.jpg",
      "location": "Morocco",
      "created_at": "2021-12-27 06:35:34",
      "updated_at": "2024-08-09 06:58:54",
      "type_id": 2
    }
  ]
}''';
      _recomendedProductList = [];
      Map<String, dynamic> data = jsonDecode(_data);
      _recomendedProductList.addAll(Product.fromJson(data).products);
      update();
    } else {}
  }
}
