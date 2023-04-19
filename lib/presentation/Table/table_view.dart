import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/presentation/Table/user_model.dart';

class TableView extends StatefulWidget {
  const TableView({Key? key}) : super(key: key);

  @override
  _TableViewState createState() => _TableViewState();
}

class _TableViewState extends State<TableView> {
  List<UserModel> tableData = [
    UserModel(
        name: "Sasha",
        email: "sasha123@gmail.com",
        phone: "0123354656",
        address: "random adress"),
    UserModel(
        name: "Goku",
        email: "Goku123@gmail.com",
        phone: "0123354656",
        address: "random adress"),
    UserModel(
        name: "Luffy",
        email: "Luffy123@gmail.com",
        phone: "0123354656",
        address: "random adress"),
    UserModel(
        name: "Sasha",
        email: "sasha123@gmail.com",
        phone: "0123354656",
        address: "random adress"),
    UserModel(
        name: "Goku",
        email: "Goku123@gmail.com",
        phone: "0123354656",
        address: "random adress"),
    UserModel(
        name: "Luffy",
        email: "Luffy123@gmail.com",
        phone: "0123354656",
        address: "random adress"),
    UserModel(
        name: "Sasha",
        email: "sasha123@gmail.com",
        phone: "0123354656",
        address: "random adress"),
    UserModel(
        name: "Goku",
        email: "Goku123@gmail.com",
        phone: "0123354656",
        address: "random adress"),
    UserModel(
        name: "Luffy",
        email: "Luffy123@gmail.com",
        phone: "0123354656",
        address: "random adress"),
    UserModel(
        name: "Sasha",
        email: "sasha123@gmail.com",
        phone: "0123354656",
        address: "random adress"),
    UserModel(
        name: "Goku",
        email: "Goku123@gmail.com",
        phone: "0123354656",
        address: "random adress"),
    UserModel(
        name: "Luffy",
        email: "Luffy123@gmail.com",
        phone: "0123354656",
        address: "random adress"),
    UserModel(
        name: "Luffy",
        email: "Luffy123@gmail.com",
        phone: "0123354656",
        address: "random adress"),
    UserModel(
        name: "Sasha",
        email: "sasha123@gmail.com",
        phone: "0123354656",
        address: "random adress"),
    UserModel(
        name: "Goku",
        email: "Goku123@gmail.com",
        phone: "0123354656",
        address: "random adress"),
    UserModel(
        name: "Luffy",
        email: "Luffy123@gmail.com",
        phone: "0123354656",
        address: "random adress"),
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // bug async
        DataTable2(
            showCheckboxColumn: true,
            // scrollController: PageController(),
            columns: const [
              DataColumn2(label: Text("Name")),
              DataColumn2(label: Text("Email")),
              DataColumn2(label: Text("Phone")),
              DataColumn2(label: Text("Address")),
            ],
            rows: tableData
                .map((e) => DataRow2(selected: e.selected, cells: [
                      DataCell(Text(e.name)),
                      DataCell(Text(e.email)),
                      DataCell(Text(e.phone)),
                      DataCell(Text(e.address)),
                    ]))
                .toList())
      ],
    );
  }
}
