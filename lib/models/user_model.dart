import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:g8te_pass/models/firebase_option.dart';

class UserModel extends Equatable {
  final String id;
  final String role;
  final FirebaseOptionsModel? homeOwner;
  final String firstName;
  final String middleName;
  final String lastName;
  final String contactNumber;
  final String emailAddress;
  final AddressModel address;
  final String password;

  const UserModel({
    this.id = "",
    this.role = "",
    this.homeOwner,
    this.firstName = "",
    this.lastName = "",
    this.middleName = "",
    this.contactNumber = "",
    this.emailAddress = "",
    this.address = AddressModel.empty,
    this.password = "",
  });

  static const empty = UserModel();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'role': role,
      'homeOwner': homeOwner?.toMap() ?? {} as Map<String, dynamic>,
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'contactNumber': contactNumber,
      'emailAddress': emailAddress,
      'address': address.toMap(),
    };
  }

  UserModel copyWith({
    String? id,
    String? role,
    FirebaseOptionsModel? homeOwner,
    String? firstName,
    String? middleName,
    String? lastName,
    String? contactNumber,
    String? emailAddress,
    String? password,
    AddressModel? address,
  }) {
    return UserModel(
      id: id ?? this.id,
      role: role ?? this.role,
      homeOwner: homeOwner ?? this.homeOwner,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      contactNumber: contactNumber ?? this.contactNumber,
      emailAddress: emailAddress ?? this.emailAddress,
      password: password ?? this.password,
      address: address ?? this.address,
    );
  }

  //Create a user string function
  @override
  String toString() {
    return 'UserModel{id: $id, role: $role, homeOwner: $homeOwner, firstName: $firstName, middleName: $middleName, lastName: $lastName, contactNumber: $contactNumber, emailAddress: $emailAddress, address: $address}';
  }


  @override
  List<Object?> get props => [
    id,
    role,
    homeOwner,
    firstName,
    lastName,
    middleName,
    contactNumber,
    emailAddress,
    password,
    address,
  ];
}

class AddressModel extends Equatable {
  final String block;
  final String lot;
  final String stAddress;
  final String phase;
  final String placeOfResidence;

  const AddressModel({
    this.block = "",
    this.lot = "",
    this.stAddress = "",
    this.phase = "",
    this.placeOfResidence = "",
  });

  static const empty = AddressModel();

  //create a AddressModel map function
  Map<String, dynamic> toMap() {
    return {
      'block': block,
      'lot': lot,
      'stAddress': stAddress,
      'phase': phase,
      'placeOfResidence': placeOfResidence,
    };
  }

  @override
  List<Object?> get props => [
    block,
    lot,
    stAddress,
    phase,
    placeOfResidence,
  ];
}