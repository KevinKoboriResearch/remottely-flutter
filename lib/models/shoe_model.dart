import '../core/const.dart';
import 'package:flutter/material.dart';

class ShoeModel {
  final int id;
  final String name;
  final double price;
  final String desc;
  final Color color;
  final String brand;
  final String imgPath;

  ShoeModel({
    this.id,
    this.name,
    this.price,
    this.desc,
    this.color,
    this.brand,
    this.imgPath,
  });

  static List<ShoeModel> list = [
    ShoeModel(
      id: 1,
      name: "Festinha dos Amigos",
      desc: "...",
      price: 200000,
      color: AppColors.blueColor,
      brand: "Miguel Alcantara",
      imgPath: "event.png",
    ),
    ShoeModel(
      id: 2,
      name: "Reunião Remottely",
      desc: "Bora que bora galera!",
      price: 7,
      color: AppColors.yellowColor,
      brand: "Kevin Kobori",
      imgPath: "event.png",
    ),
    ShoeModel(
      id: 3,
      name: "Meu Casamento",
      desc: "Valores.",
      price: 3,
      color: AppColors.redColor,
      brand: "Filipe Barcelos",
      imgPath: "event.png",
    ),
    ShoeModel(
      id: 4,
      name: "Dispositivo NFC",
      desc: "Não ta funcionando...",
      price: 16,
      color: AppColors.greenColor,
      brand: "Brian Kobori",
      imgPath: "event.png",
    ),
    ShoeModel(
      id: 5,
      name: "Planejando Viagem",
      desc: "Diarias do hotel.",
      price: 4,
      color: AppColors.redColor,
      brand: "Fernando de Noronha",
      imgPath: "event.png",
    ),
    ShoeModel(
      id: 6,
      name: "Evento",
      desc: "Só uma descontracão com a galera.",
      price: 11,
      color: AppColors.orangeColor,
      brand: "Gabriela Azevedo",
      imgPath: "event.png",
    ),
    ShoeModel(
      id: 7,
      name: "Evento",
      desc: "Só uma descontracão com a galera.",
      price: 11,
      color: AppColors.orangeColor,
      brand: "Gabriela Azevedo",
      imgPath: "event.png",
    ),
    ShoeModel(
      id: 8,
      name: "Evento",
      desc: "Só uma descontracão com a galera.",
      price: 11,
      color: AppColors.orangeColor,
      brand: "Gabriela Azevedo",
      imgPath: "event.png",
    ),
    ShoeModel(
      id: 9,
      name: "Evento",
      desc: "Só uma descontracão com a galera.",
      price: 11,
      color: AppColors.orangeColor,
      brand: "Gabriela Azevedo",
      imgPath: "event.png",
    ),
    ShoeModel(
      id: 10,
      name: "Evento",
      desc: "Só uma descontracão com a galera.",
      price: 11,
      color: AppColors.orangeColor,
      brand: "Gabriela Azevedo",
      imgPath: "event.png",
    ),
    ShoeModel(
      id: 11,
      name: "Evento",
      desc: "Só uma descontracão com a galera.",
      price: 11,
      color: AppColors.orangeColor,
      brand: "Gabriela Azevedo",
      imgPath: "event.png",
    ),
    ShoeModel(
      id: 12,
      name: "Evento",
      desc: "Só uma descontracão com a galera.",
      price: 11,
      color: AppColors.orangeColor,
      brand: "Gabriela Azevedo",
      imgPath: "event.png",
    ),
    ShoeModel(
      id: 13,
      name: "Evento",
      desc: "Só uma descontracão com a galera.",
      price: 11,
      color: AppColors.orangeColor,
      brand: "Gabriela Azevedo",
      imgPath: "event.png",
    ),
    ShoeModel(
      id: 14,
      name: "Evento",
      desc: "Só uma descontracão com a galera.",
      price: 11,
      color: AppColors.orangeColor,
      brand: "Gabriela Azevedo",
      imgPath: "event.png",
    ),
  ];
}
