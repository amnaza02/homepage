import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tailor_profile_page.dart';

class DetailPage extends StatefulWidget {
  final String imagePath;
  final String title;
  final String price;
  final String description;
  final String fabricType;

  const DetailPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.description,
    required this.fabricType,
  });

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Color _selectedColor = Colors.brown;
  String _selectedSize = "S";
  bool _isLiked = false;
  static const String tailorName = "Ines Tailor";
  static const String tailorProfileImage = "images/5.jpg";
  TextEditingController _notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(
              _isLiked ? Icons.favorite : Icons.favorite_border,
              color: _isLiked ? Colors.red : Colors.black,
            ),
            onPressed: () {
              setState(() {
                _isLiked = !_isLiked;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  widget.imagePath,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TailorProfilePage(
                            name: tailorName,
                            image: tailorProfileImage,
                          ),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage(tailorProfileImage),
                          radius: 20,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          tailorName,
                          style: GoogleFonts.poppins(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(widget.title,
                      style: GoogleFonts.poppins(
                          fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  Text(widget.description,
                      style: GoogleFonts.poppins(
                          fontSize: 16, color: Colors.grey[600])),
                  const SizedBox(height: 16),

                  Text("Fabric Type",
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(widget.fabricType,
                      style: GoogleFonts.poppins(
                          fontSize: 16, color: Colors.grey[600])),

                  const SizedBox(height: 16),
                  Text("Color",
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      _buildColorOption(Colors.brown),
                      _buildColorOption(Colors.blue),
                      _buildColorOption(Colors.black),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text("Size",
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  Row(
                    children: ["S", "M", "L", "XL"].map((size) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: ChoiceChip(
                          label: Text(size, style: GoogleFonts.poppins()),
                          selected: _selectedSize == size,
                          onSelected: (selected) {
                            setState(() {
                              _selectedSize = size;
                            });
                          },
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  Text("Total Price",
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(
                    widget.price,
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 255, 0, 204)),
                  ),
                  const SizedBox(height: 16),

                  Text("Notes",
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  TextField(
                    controller: _notesController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: "Enter your notes here...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content:
                                  Text("The product has been added to the cart")),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 163, 119, 178),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text("Order",
                          style: GoogleFonts.poppins(
                              fontSize: 20, color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorOption(Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedColor = color;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
              color:
                  _selectedColor == color ? Colors.black : Colors.transparent,
              width: 2),
        ),
      ),
    );
  }
}
