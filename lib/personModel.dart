import 'package:flutter/material.dart';
class PersonModel {

  final String id;
  final String name;
  final int age;
  final List<String> places;
  final List<Images> images;
  final Address address;

  PersonModel({this.id, this.name, this.age, this.places,this.images,this.address});

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      id : json['id'],
      name : json['name'],
      age : json['age'],
      places: parsePlaceList(json['places']),
      images: parseImagesList(json),
      address: Address.fromJson(json['address']),
    );
  }

  static List<String> parsePlaceList(placesJson){
    List<String> placesList = List<String>.from(placesJson);
    return placesList;
  }

  static List<Images> parseImagesList(imagesJson){
    var list = imagesJson['images'] as List;
    List<Images> imagesList = list.map((e) => Images.fromJson(e)).toList();
    return imagesList;

  }

}


class Images{
  final String id;
  final String name;

  Images({this.id, this.name});

  factory Images.fromJson(Map<String,dynamic> json){
    return Images(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Details{
  final int houseNumber;
  final String town;

  Details({this.houseNumber, this.town});

  factory Details.fromJson(Map<String,dynamic> json){
    return Details(
      houseNumber: json['house_no'],
      town: json['town'],
    );
  }
}

class Address{
  final String streetNumber;
  final Details details;

  Address({this.streetNumber, this.details});

  factory Address.fromJson(Map<String,dynamic> json){
    return Address(
      streetNumber: json['street_no'],
      details: Details.fromJson(json['details'])
    );
  }
}
