import 'package:flutter/material.dart';
import 'package:testgroupb/kernel/colors/colors_app.dart';
import 'package:testgroupb/kernel/widgets/custom_carrousel.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> itemList = [
      FirstSection(
        image: 'assets/images/Portada-conocenos.png',
      ),
      FirstSection(
        image: 'assets/images/logo-utez.png',
      ),
      FirstSection(
        image: 'assets/images/Portada-conocenos.png',
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Noticias'),
        backgroundColor: ColorsApp.primaryColor,
      ),
      body: Center(
          child: CustomCarousel(
        itemList: itemList,
        carouselHeight: 250,
      )),
    );
  }
}

class FirstSection extends StatelessWidget {
  final String image;
  const FirstSection({super.key, required this.image});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(children: [
        Image.asset(
          image,
          height: 150,
          width: width,
          fit: BoxFit.fitWidth,
        ),
        Container(
          padding: const EdgeInsets.all(16),
          child: const Align(
            alignment: Alignment.topLeft,
            child: Text(
              'La Universidad Tecnológica Emiliano Zapata (UTEZ), es una Universidad pública creada en el año 2000 que forma parte del Sistema Nacional de Universidades...',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        )
      ]),
    );
  }
}
