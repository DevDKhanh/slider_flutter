import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  final controller = CarouselController();

  int indexSlide = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Column(
            children: <Widget>[
              CarouselSlider(
                carouselController: controller,
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    setState(() {
                      indexSlide = index;
                    });
                  },
                  initialPage: 0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                items: imgList.map((i) {
                  return ItemSlider(i: i);
                }).toList(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton(
                        onPressed: () {
                          controller.previousPage();
                        },
                        child: const Text('Previous')),
                    Center(
                      child: AnimatedSmoothIndicator(
                        activeIndex: indexSlide,
                        count: imgList.length,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          controller.nextPage();
                        },
                        child: const Text('Next')),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

class ItemSlider extends StatelessWidget {
  const ItemSlider({Key? key, required this.i}) : super(key: key);

  final String i;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 217, 217, 217),
      ),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            i,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.65,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ),
    );
  }
}
