import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class DetailsEventPlaceController extends GetxController {
  CarouselController carouselController = CarouselController();
  int initpage = 0;

  List<String> image = [
    'https://media-cdn.tripadvisor.com/media/photo-s/01/53/c2/e9/damascus.jpg',
    'https://i.pinimg.com/originals/bf/2a/87/bf2a8783b8ea261850c2c38c769d17d9.jpg',
    'https://i.pinimg.com/originals/b6/98/c3/b698c3c5f7055a6f6572479a80fcce20.jpg'
  ];

  @override
  void onInit() {
    initpage = image.length ~/ 2;
    super.onInit();
  }

  nextCarousel() {
    carouselController.nextPage();
    initpage++;
    update();
  }

  previousCarousel() {
    carouselController.previousPage();
    initpage--;
    update();
  }
}
