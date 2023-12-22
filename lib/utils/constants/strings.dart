import 'package:finappassistant/config/router/app_router.dart';
import 'package:finappassistant/presentation/components/actions.dart';
import 'package:flutter/material.dart';

const String applicationTitle = "FinApp";
const String defaultProfilePicture = "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png";
const apiBaseUrl = "https://finapp-faker.onrender.com";

const List<String> months = [
  "January", "Feburary", "March",
  "April", "May", "June", "July",
  "August", "Septemeber", "October", 
  "Novemeber", "December"
];

Map<String, List<String>> agents = {
  "Abebe": [defaultProfilePicture, "10000", "ETB", "wallet"], 
  "Alex": [defaultProfilePicture, "10000", "ETB", "wallet"],
  "Abdu": [defaultProfilePicture, "10000", "ETB", "wallet"],
  "Josh": [defaultProfilePicture, "10000", "ETB", "wallet"],
  "Abebe2": [defaultProfilePicture, "10000", "ETB", "wallet"],
  "Alex2": [defaultProfilePicture, "10000", "ETB", "wallet"],
  "Abdu2": [defaultProfilePicture, "10000", "ETB", "wallet"],
  "Josh2": [defaultProfilePicture, "10000", "ETB", "wallet"]
};

Map<String, String> currencies = {
  "etb": "assets/images/etb.png",
  "dollar": "assets/images/usd.png",
  "euro": "assets/images/euro.png",
  "pound": "assets/images/pound.png",
  "japaneseYen": "assets/images/jpyen.png",
  "chineseYen": "assets/images/chyen.png"
};

Map<String, List<dynamic>> settings = {
  "Manage Currency": [Icons.currency_exchange, CurrencySettingsRoute()],
  "Profile setting": [Icons.person, UpdateProfileRoute()],
  "Privacy and security": [Icons.security, SecuritySettingsHomeRoute()],
  "Blocked transactions": [Icons.block, const BlockedTransactionsRoute()],
  "Trash": [Icons.delete, TrashMainRoute()],
  "Logout": [Icons.logout, LoginRoute()]
};

final List<Widget> access = [
  MyAction(
    title: "Create Transaction", 
    logoUrl: "assets/images/balance-logo.jpg", 
    page: CreateTransactionRoute()
  ),
  MyAction(
    title:  "View Transaction",
    logoUrl: "assets/images/doc-search-logo2.jpg",
    page: TransactionsRoute(),
  ),
  MyAction(
    title: "Add Agent", 
    logoUrl: "assets/images/add-logo.jpg", 
    page: AddAgentRoute()
  ),
  MyAction(
    title:  "View Agents",
    logoUrl: "assets/images/doc-search-logo1.jpg",
    page: AgentsRoute(),
  ),
  MyAction(
    title: "Update Agent Wallet", 
    logoUrl: "assets/images/wallet-logo.jpg", 
    page: UpdateAgentWalletRoute()
  ),
  MyAction(
    title: "Export Transactions",
    logoUrl: "assets/images/excel-logo.jpg",
    page: ExportTransactionRoute(),
  ),
  MyAction(
    title: "Add Transactions", 
    logoUrl: "assets/images/add-logo.jpg", 
    page: AddTransactionRoute()
  ),
];