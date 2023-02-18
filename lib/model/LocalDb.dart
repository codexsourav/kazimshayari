import 'package:localstorage/localstorage.dart';

class LocalDb {
  final LocalStorage storage = LocalStorage('fevourite');

  LocalDb._privateCostractor();

  static final LocalDb instense = LocalDb._privateCostractor();

// for get storage data
  List getSaved() {
    if (storage.getItem('saved') == null) {
      storage.setItem('saved', []);
      return [];
    } else {
      return storage.getItem('saved');
    }
  }

// for add new data
  addSaved(data) {
    var storedata = getSaved();

    storedata.add(data);
    storage.setItem('saved', storedata);
  }

// for delete data
  deleteData(id) {
    var storedata = getSaved();
    storedata.removeWhere((item) => item['id'] == id);
    storage.setItem('saved', storedata);
  }

// for chack data exist on favraites
  chackexistondb(sid) {
    List alldata = getSaved();

    if (alldata.isNotEmpty && alldata != null) {
      for (var data in alldata) {
        if (data['id'] == sid) {
          return data['id'];
        }
      }
    }
    return false;
  }
}
