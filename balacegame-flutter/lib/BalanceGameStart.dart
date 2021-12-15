import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class BalanceGameStart extends StatelessWidget {
  const BalanceGameStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Object? id = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('q'),
      ),
      body: Center(
        child: FutureBuilder(
          future:loadAsset('assets/'+id.toString()+'.txt'),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            // snapshot은 Future 클래스가 포장하고 있는 객체를 data 속성으로 전달
            // Future<String>이기 때문에 data는 String이 된다.
            final contents = snapshot.data.toString();
            // 개행 단위로 분리(한줄씩 자르는 거임)
            final rows = contents.split('\n');

            var tableRows = <TableRow>[];
            for(var row in rows) {
              // 이번 파일에서 구분 문자는 (/)
              var cols = rows[2].split('/');

              // map 함수를 이용해서 문자열 각각에 대해 Text 위젯 생성
              var widgets = cols.map((s) => Text(s));
              tableRows.add(TableRow(children: widgets.toList()));
            }
            return Table(children: tableRows);
          },
        ),
      ),
    );
  }
}

// assets 폴더 아래에 2016_GDP.txt 파일 있어야 함.
// AssetBundle 객체를 통해 리소스에 접근.
// DefaultAssetBundle 클래스 또는 미리 만들어 놓은 rootBundle 객체 사용.
// async는 비동기 함수, await는 비동기 작업이 종료될 때까지 기다린다는 뜻.
// 그러나, 함수 자체가 블록되지는 않고 예약 전달의 형태로 함수 반환됨.
// 따라서 Future 클래스를 사용하기 위해서는 FutureBuilder 등의 특별한 클래스가 필요함.
Future<String> loadAsset(String path) async {
  return await rootBundle.loadString(path);
  // return await DefaultAssetBundle.of(ctx).loadString('assets/2016_GDP.txt');
}
