import 'package:flutter/foundation.dart';

class ProviderType {
  final String id;
  final String name;

  ProviderType({
    @required this.id,
    @required this.name,
  });

  factory ProviderType.fromMap(Map item) {
    return ProviderType(
      id: item['id'].toString(),
      name: item['name'],
    );
  }

  static List<ProviderType> resolveList(List<dynamic> data) {
    final items = data.map((item) => ProviderType.fromMap(item));
    return List<ProviderType>.from(items);
  }

  String image() {
    final text = name.toLowerCase();
    if (text.contains('hospital')) {
      return 'https://res.cloudinary.com/scoolnetwork/image/upload/c_thumb,w_200,g_face/v1594469104/demos/hospital_2C_green.jpg';
    }
    if (text.contains('gym')) {
      return 'https://res.cloudinary.com/scoolnetwork/image/upload/c_thumb,w_200,g_face/v1594469141/demos/Gym_2_trans_NvBQzQNjv4BqgsaO8O78rhmZrDxTlQBjdGcv5yZLmao6LolmWYJrXns.jpg';
    }

    if (text.contains('spa')) {
      return 'https://res.cloudinary.com/scoolnetwork/image/upload/c_thumb,w_200,g_face/v1594469165/demos/1561129494_5d0cf2162a4bc-thumb.jpg';
    }

    if (text.contains('dental')) {
      return 'https://res.cloudinary.com/scoolnetwork/image/upload/c_thumb,w_200,g_face/v1594469285/demos/Dental-Clinic-Romania.jpg';
    }

    if (text.contains('optical')) {
      return 'https://res.cloudinary.com/scoolnetwork/image/upload/c_thumb,w_200,g_face/v1594469251/demos/Ojas_Hospital_Zeiss_Artevo_800.jpg';
    }

    if (text.contains('pharm')) {
      return 'https://res.cloudinary.com/scoolnetwork/image/upload/c_thumb,w_200,g_face/v1594469324/demos/1080094_face-mask-pharmacy-pa-20.jpg';
    }

    if (text.contains('lab')) {
      return 'https://res.cloudinary.com/scoolnetwork/image/upload/c_thumb,w_200,g_face/v1594469351/demos/bright-and-ultra-modern-high-tech-laboratory-full-of-advanced-picture-id949946968.jpg';
    }

    return 'https://res.cloudinary.com/scoolnetwork/image/upload/c_thumb,w_200,g_face/v1594469104/demos/hospital_2C_green.jpg';
  }

  @override
  String toString() {
    return id;
  }
}
