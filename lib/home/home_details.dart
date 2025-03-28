// ignore_for_file: deprecated_member_use, library_private_types_in_public_api, use_super_parameters

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'payment.dart';

String sanitizeBase64(String base64String) {
  if (base64String.startsWith("data:")) {
    int commaIndex = base64String.indexOf(',');
    if (commaIndex != -1) {
      return base64String.substring(commaIndex + 1);
    }
  }
  return base64String;
}

class HomeDetailsPage extends StatefulWidget {
  final String ac;
  final Map<String, dynamic> amenities;
  final String area;
  final String address;
  final String busStop;
  final String description;
  final bool furnish;
  final bool gas;
  final String image;
  final String landmark;
  final String latitude;
  final bool lift;
  final String longitude;
  final bool model3D;
  final bool parking;
  final String pincode;
  final String price;
  final String railwayStn;
  final String rooms;
  final bool sale;
  final String sellerContact;
  final String sellerName;
  final String washroom;
  final String waterSupply;
  final bool wifi;

  const HomeDetailsPage({
    super.key,
    required this.ac,
    required this.address,
    required this.amenities,
    required this.area,
    required this.busStop,
    required this.description,
    required this.furnish,
    required this.gas,
    required this.image,
    required this.landmark,
    required this.latitude,
    required this.lift,
    required this.longitude,
    required this.model3D,
    required this.parking,
    required this.pincode,
    required this.price,
    required this.railwayStn,
    required this.rooms,
    required this.sale,
    required this.sellerContact,
    required this.sellerName,
    required this.waterSupply,
    required this.washroom,
    required this.wifi,
  });

  @override
  _HomeDetailsPageState createState() => _HomeDetailsPageState();
}

class _HomeDetailsPageState extends State<HomeDetailsPage> {
  DateTimeRange? selectedDates;

  void _show3DModel(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: const Text('Model Viewer',
                style: TextStyle(color: Colors.black)),
            centerTitle: true,
          ),
          body: const ModelViewer(
            backgroundColor: Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
            src: 'assets/home.glb', // Use the relative asset path here
            alt: 'A 3D model of my living room',
            ar: true,
            autoRotate: true,
            // Remove iosSrc if you don't have an iOS USDZ version or update accordingly
            disableZoom: false,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.image.isNotEmpty)
              Image.memory(
                base64Decode(sanitizeBase64(widget.image)),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.address,
                        style: const TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.landmark,
                        style: TextStyle(
                            fontSize: 16, color: Colors.grey.shade600),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${widget.rooms} rooms, ${widget.washroom} washrooms, ${widget.area} sqft',
                        style: TextStyle(
                            fontSize: 14, color: Colors.grey.shade700),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Pincode: ${widget.pincode}',
                        style: TextStyle(
                            fontSize: 14, color: Colors.grey.shade700),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Divider(color: Colors.grey),
                  const SizedBox(height: 16),
                  const Text(
                    'Description',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.description,
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  const SizedBox(height: 16),
                  const Divider(color: Colors.grey),
                  const SizedBox(height: 16),
                  const Text(
                    'What this place offers',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.ac != '0')
                        Row(
                          children: [
                            const Icon(FontAwesomeIcons.snowflake),
                            const SizedBox(width: 22),
                            Text(widget.ac)
                          ],
                        ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Icon(FontAwesomeIcons.couch),
                          const SizedBox(width: 22),
                          Text(widget.furnish ? 'Furnished' : 'Unfurnished'),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Icon(FontAwesomeIcons.fire),
                          const SizedBox(width: 22),
                          Text(widget.gas ? 'Gas Stove' : 'No Gas Stove'),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Icon(FontAwesomeIcons.elevator),
                          const SizedBox(width: 22),
                          Text(widget.lift ? 'Lift' : 'No Lift'),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Icon(FontAwesomeIcons.car),
                          const SizedBox(width: 22),
                          Text(widget.parking ? 'Parking' : 'No Parking'),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Icon(FontAwesomeIcons.water),
                          const SizedBox(width: 22),
                          Text("Water Supply - ${widget.waterSupply}")
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Icon(FontAwesomeIcons.wifi),
                          const SizedBox(width: 22),
                          Text(widget.wifi ? 'Wifi' : 'No Wifi'),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Divider(color: Colors.grey),
                  const SizedBox(height: 16),
                  const Text(
                    'Nearest Transit',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(FontAwesomeIcons.busAlt),
                      const SizedBox(width: 22),
                      Text(widget.busStop),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(FontAwesomeIcons.trainSubway),
                      const SizedBox(width: 22),
                      Text(widget.railwayStn),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Divider(color: Colors.grey),
                  const SizedBox(height: 16),
                  const Text(
                    'Meet your Host',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.deepOrange,
                        child: Text(
                          widget.sellerName[0], // First letter of the name
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 30),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.sellerName,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              widget.sellerContact,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Divider(color: Colors.grey),
                  const SizedBox(height: 16),
                  const Text(
                    "Where you'll be",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.address,
                    style: const TextStyle(
                        fontSize: 16, color: Color.fromARGB(255, 11, 7, 235)),
                  ),
                  const SizedBox(height: 8),
                  // Google Maps widget
                  SizedBox(
                    height: 200,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: LatLng(
                          double.parse(widget.latitude),
                          double.parse(widget.longitude),
                        ),
                        zoom: 14,
                      ),
                      markers: {
                        Marker(
                          markerId: const MarkerId('location'),
                          position: LatLng(
                            double.parse(widget.latitude),
                            double.parse(widget.longitude),
                          ),
                        ),
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
      // Bottom bar with price and Reserve button.
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color.fromARGB(255, 231, 229, 229),
              width: 2,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 15, 15, 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '₹ ${widget.price}',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 65,
                width: 120,
                child: ElevatedButton(
                  onPressed: () {
                    if (widget.model3D) {
                      _show3DModel(context);
                    } else {
                      // Reserve action
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 216, 16, 83),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 24),
                  ),
                  child: Text(
                    widget.model3D ? '3D Model' : 'Reserve',
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 65,
                width: 120,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PaymentScreen(propertyData: {
                                'Price': widget.price,
                              })),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 24),
                  ),
                  child: const Text(
                    'Reserve',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
