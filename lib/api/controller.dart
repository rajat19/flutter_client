import 'dart:async';
import 'package:aqueduct/aqueduct.dart';

List<Map<String, dynamic>> mockDatabase = [
  {
    'fruit': 'apple',
    'color': 'red',
  },
  {
    'fruit': 'banana',
    'color': 'yellow',
  }
];

class MyController extends ResourceController {
  @Operation.get()
  Future<Response> getAllFruit() async {
    return Response.ok(mockDatabase);
  }

  @Operation.get('id')
  Future<Response> getFruitById(@Bind.path('id') int id) async {
    if (id < 0 || id >= mockDatabase.length) {
      return Response.notFound(body: 'Item not found');
    }
    return Response.ok(mockDatabase[id]);
  }

  @Operation.post()
  Future<Response> addFruit() async {
    final Map<String, dynamic> item =
        await request.body.decode(); // TODO validate
    mockDatabase.add(item);
    final int id = mockDatabase.length - 1;
    return Response.ok('Item added with id $id');
  }

  @Operation.put('id')
  Future<Response> putContent(@Bind.path('id') int id) async {
    if (id < 0 || id >= mockDatabase.length) {
      return Response.notFound(body: 'Item not found');
    }
    final Map<String, dynamic> item = await request.body.decode();
    mockDatabase[id] = item;
    return Response.ok('Item replaced at id $id');
  }

  @Operation('PATCH', 'id')
  Future<Response> patchContent(@Bind.path('id') int id) async {
    if (id < 0 || id >= mockDatabase.length) {
      return Response.notFound(body: 'Item not found');
    }
    final Map<String, dynamic> item = await request.body.decode();
    mockDatabase[id]['color'] = item['color'];
    return Response.ok('Item updated at id $id');
  }

  @Operation.delete('id')
  Future<Response> deleteContent(@Bind.path('id') int id) async {
    if (id < 0 || id >= mockDatabase.length) {
      return Response.notFound(body: 'Item not found');
    }
    mockDatabase.removeAt(id);
    return Response.ok('Item deleted at id $id');
  }
}
