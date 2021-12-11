import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_clean_architecture_tdd/core/network/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'network_info_impl_test.mocks.dart';

@GenerateMocks([DataConnectionChecker])
void main() {
  late NetworkInfo networkInfo;
  late DataConnectionChecker dataConnectionChecker;

  setUp(() {
    dataConnectionChecker = MockDataConnectionChecker();
    networkInfo = NetworkInfoImpl(dataConnectionChecker);
  });

  test('should call forward to the DataConnectionChecker', () async {
    when(dataConnectionChecker.hasConnection)
        .thenAnswer((realInvocation) async => true);
    final result = await networkInfo.isConnected;
    verify(dataConnectionChecker.hasConnection);
    expect(result, true);
  });
}
