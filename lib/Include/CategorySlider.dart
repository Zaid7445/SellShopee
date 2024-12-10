import 'package:flutter/material.dart';
import 'package:sell_shopee/CategoryProductScreen.dart';
import 'package:http/http.dart' as http;
import 'package:sell_shopee/Include/TokenManager.dart';

class CategorySlider extends StatefulWidget {
  const CategorySlider({super.key});

  @override
  State<CategorySlider> createState() => _CategorySliderState();
}

class _CategorySliderState extends State<CategorySlider> {
  @override
  void getCategory() async {
    String? token = await TokenManager.getAccessToken();
    String apiUrl = "https://demo.sellshopee.com/api/login";
    try {
      final response = http.get(Uri.parse(apiUrl),
          headers: {'Authorization': 'Bearer ${token}'});
    } catch (e) {
      //
    }
  }

  Widget build(BuildContext context) {
    final imageUrls = [
      {
        'name': 'Lettuce',
        'url':
            'https://w7.pngwing.com/pngs/34/259/png-transparent-fruits-and-vegetables-thumbnail.png'
      },
      {
        'name': 'Spinach',
        'url':
            'https://w7.pngwing.com/pngs/328/365/png-transparent-spinach-leaf-vegetable-pakora-chard-vegetable-natural-foods-leaf-vegetable-food-thumbnail.png'
      },
      {
        'name': 'Kale',
        'url':
            'https://w7.pngwing.com/pngs/34/259/png-transparent-fruits-and-vegetables-thumbnail.png'
      },
      {
        'name': 'Arugula',
        'url':
            'https://w7.pngwing.com/pngs/42/860/png-transparent-bunch-of-parsley-celery-vegetable-parsley-coriander-herb-vegetable-leaf-vegetable-food-leaf-thumbnail.png'
      },
      {
        'name': 'Collard',
        'url':
            'https://w7.pngwing.com/pngs/985/126/png-transparent-green-peas-snow-pea-organic-food-vegetable-legume-vegetables-natural-foods-food-vegetable-salad-thumbnail.png'
      },
    ];
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(imageUrls.length, (index) {
            return GestureDetector(
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CategoryProductScreen()))
              },
              child: Container(
                padding: const EdgeInsets.fromLTRB(2, 2, 2, 10),
                margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(50, 147, 147, 147), // Border color
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 30, // Image radius
                      backgroundImage: NetworkImage(
                          imageUrls[index]['url']!), // Dynamic image URL
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: Text(imageUrls[index]['name']!),
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
