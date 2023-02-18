import 'dart:convert';

import 'package:http/http.dart' as http;

class AirtableDb {
  final apiKey =
      'patQL7vlfDB2i8HEC.67ad9c10025819e1bc23d68adbc20f56e3c0a1b1dc5551a0948a5a99a444bf12';
  final projectBase = 'appxjxtKhHDutkt2C';
  final recordName = 'data';
  var apiUri = 'https://api.airtable.com/v0/appPUWk8p1rBqfLnH/';
  final query = '?filterByFormula=';

  AirtableDb._privateCostractor();
  static final AirtableDb instense = AirtableDb._privateCostractor();

// set Header
  Map<String, String> get headers => {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $apiKey",
      };

// access categoriys

  Future getCategories() async {
    var response =
        await http.get(Uri.parse('${apiUri}Categories'), headers: headers);
    if (response.statusCode == 200) {
      var convertDataToJson = json.decode(response.body);
      return convertDataToJson;
    } else {
      return [];
    }
  }

  // access quort filed data categoriys

  Future getQuotes(tblname) async {
    var response =
        await http.get(Uri.parse(apiUri + tblname), headers: headers);

    if (response.statusCode == 200) {
      var convertDataToJson = json.decode(response.body);
      return convertDataToJson;
    } else {
      return [];
    }
  }
}
//   late Airtable airtable;

//   Future<List<AirtableRecord>> getAll() async {
//     List<AirtableRecord> records = await airtable.getAllRecords(recordName);
//     return records;
//   }

// // get all unice catagory
//   getCategorys() async {
//     List<AirtableRecord> records = await airtable.getAllRecords(recordName);
//     List categ = [];

//     for (var i = 0; i < records.length; i++) {
//       var name = records[i].fields;
//       // print('chack 1');
//       for (var j = 0; j < name.length; j++) {
//         if (name[j].fieldName == 'Category') {
//           categ.add(records[i].fields[j].value.toString());
//           break;
//         }
//         // print('chack 2');
//       }
//     }

//     return categ.toSet().toList();
// }

// get all data about category

//   Future<List<AirtableRecord>> getByCategory(search) async {
//     List<AirtableRecord> records = await airtable.getAllRecords(recordName);
//     List<AirtableRecord> categ = [];

//     for (var i = 0; i < records.length; i++) {
//       AirtableRecord data = records[i];

//       List<AirtableRecordField<Object>> name = records[i].fields;

//       for (var j = 0; j < name.length; j++) {
//         if (name[j].fieldName == 'Category' &&
//             name[j].value.toString() == search) {
//           categ.add(data);
//           break;
//         }
//       }
//     }
//     return categ;
//   }

// // get all data by a category
//   Future<List<dynamic>> findByCategory(search) async {
//     List<AirtableRecord> data = await getByCategory(search);
//     List maindata = [];

//     for (var i = 0; i < data.length; i++) {
//       var name = data[i].fields;
//       for (var j = 0; j < name.length; j++) {
//         if (name[j].fieldName == 'Queort') {
//           maindata.add({'data': name[j].value.toString(), "id": data[i].id});
//           break;
//         }
//       }
//     }
//     print(maindata);
//     return maindata;
//   }
