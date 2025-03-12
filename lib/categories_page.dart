import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> categories = [
      {'title': "Men's Wear", 'image': 'images/menswear2.jpg'},
      {'title': "Women's Wear", 'image': 'images/womenswear2.jpg'},
      {'title': "Kids' Wear", 'image': 'images/kidswear.jpg'},
      {'title': "Babies' Wear", 'image': 'images/kidswear2.jpg'},
      {'title': "Special Occasion Wear", 'image': 'images/occassionwear.jpg'},
      {'title': "Fabric-Based Categories", 'image': 'images/fabricbased.jpg'},
      {'title': "Accessories & Add-ons", 'image': 'images/accessories.jpg'},
      {'title': "Graduation Wear", 'image': 'images/garaduation.jpg'},
      {'title': "Home textile", 'image': 'images/hometextiles.jpg'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Categories',
          style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(), // تحسين تجربة السكرول
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryDetailPage(
                      categoryTitle: categories[index]['title']!,
                      categoryImage: categories[index]['image']!,
                    ),
                  ),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.symmetric(vertical: 8),
                elevation: 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        categories[index]['image']!,
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        height: 150,
                        color: Colors.black.withOpacity(0.3),
                      ),
                      Positioned(
                        child: Text(
                          categories[index]['title']!,
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CategoryDetailPage extends StatelessWidget {
  final String categoryTitle;
  final String categoryImage;

  const CategoryDetailPage({
    super.key,
    required this.categoryTitle,
    required this.categoryImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
          style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              categoryImage,
              width: 250,
              height: 250,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text(
              categoryTitle,
              style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
