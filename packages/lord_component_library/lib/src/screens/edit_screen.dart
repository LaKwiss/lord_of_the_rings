import 'package:flutter/material.dart' hide Card;
import 'package:lord_repository/lord_repository.dart';
import 'package:lord_bloc/lord_bloc.dart';
import 'package:provider/provider.dart';

class EditScreen extends StatefulWidget {
  static const routeName = '/edit';

  const EditScreen();

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _idController = TextEditingController();
  TextEditingController _costController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();
  TextEditingController _deckLimitController = TextEditingController();
  TextEditingController _illustratorController = TextEditingController();
  TextEditingController _hasErrataController = TextEditingController();
  TextEditingController _urlController = TextEditingController();
  TextEditingController _imageSrcController = TextEditingController();
  TextEditingController _textController = TextEditingController();
  TextEditingController _codeController = TextEditingController();
  TextEditingController _positionController = TextEditingController();
  TextEditingController _sphereNameController = TextEditingController();
  TextEditingController _typeNameController = TextEditingController();
  TextEditingController _packCodeController = TextEditingController();
  TextEditingController _packNameController = TextEditingController();

  bool _isInit = true;
  var _emptyCard = Card.empty;
  final _form = GlobalKey<FormState>();

  void _saveAndEdit() {
    if (_form.currentState!.validate()) {
      _form.currentState!.save();
      Provider.of<CardProvider>(context, listen: false).updateCard(_emptyCard);
      Navigator.of(context).pop();
    }
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final card = ModalRoute.of(context)!.settings.arguments as Card;
      if (card.id != null) {
        _emptyCard = Provider.of<CardProvider>(context, listen: false)
            .findById(card.id!);
      }
      super.didChangeDependencies();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _idController.dispose();
    _costController.dispose();
    _quantityController.dispose();
    _deckLimitController.dispose();
    _illustratorController.dispose();
    _hasErrataController.dispose();
    _urlController.dispose();
    _imageSrcController.dispose();
    _textController.dispose();
    _codeController.dispose();
    _positionController.dispose();
    _sphereNameController.dispose();
    _typeNameController.dispose();
    _packCodeController.dispose();
    _packNameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final card = ModalRoute.of(context)!.settings.arguments as Card;

    _nameController.text = card.name ?? '';
    _idController.text = card.id ?? '';
    _costController.text = card.cost ?? '';
    _quantityController.text = card.quantity.toString();
    _deckLimitController.text = card.deck_limit.toString();
    _illustratorController.text = card.illustrator ?? '';
    _hasErrataController.text = card.has_errata.toString();
    _urlController.text = card.url ?? '';
    _imageSrcController.text = card.imagesrc ?? '';
    _textController.text = card.text ?? '';
    _codeController.text = card.code ?? '';
    _positionController.text = card.position.toString();
    _sphereNameController.text = card.sphere_name ?? '';
    _typeNameController.text = card.type_name ?? '';
    _packCodeController.text = card.pack_code ?? '';
    _packNameController.text = card.pack_name ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Screen'),
      ),
      body: Form(
        key: _form,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            TextFormField(
              controller: _costController,
              decoration: InputDecoration(
                labelText: 'Cost',
              ),
              onSaved: (value) {
                _emptyCard = _emptyCard.copyWith(cost: value);
              },
            ),
            TextFormField(
              controller: _quantityController,
              decoration: InputDecoration(
                labelText: 'Quantity',
              ),
              onSaved: (newValue) => _emptyCard = _emptyCard =
                  _emptyCard.copyWith(quantity: int.parse(newValue!)),
            ),
            TextFormField(
              controller: _deckLimitController,
              decoration: InputDecoration(
                labelText: 'Deck Limit',
              ),
              onSaved: (newValue) => _emptyCard =
                  _emptyCard.copyWith(deck_limit: int.parse(newValue!)),
            ),
            TextFormField(
              controller: _illustratorController,
              decoration: InputDecoration(
                labelText: 'Illustrator',
              ),
              onSaved: (value) {
                _emptyCard = _emptyCard.copyWith(illustrator: value);
              },
            ),
            TextFormField(
              controller: _hasErrataController,
              decoration: InputDecoration(
                labelText: 'Has Errata',
              ),
              onSaved: (newValue) => _emptyCard = _emptyCard.copyWith(
                  has_errata: newValue == 'true' ? true : false),
            ),
            TextFormField(
              controller: _urlController,
              decoration: InputDecoration(
                labelText: 'URL',
              ),
              onSaved: (value) {
                _emptyCard = _emptyCard.copyWith(url: value);
              },
            ),
            TextFormField(
              controller: _imageSrcController,
              decoration: InputDecoration(
                labelText: 'Image Source',
              ),
              onSaved: (value) {
                _emptyCard = _emptyCard.copyWith(imagesrc: value);
              },
            ),
            TextFormField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Text',
              ),
              onSaved: (value) {
                _emptyCard = _emptyCard.copyWith(text: value);
              },
            ),
            TextFormField(
              controller: _codeController,
              decoration: InputDecoration(
                labelText: 'Code',
              ),
              onSaved: (value) {
                _emptyCard = _emptyCard.copyWith(code: value);
              },
            ),
            TextFormField(
              controller: _positionController,
              decoration: InputDecoration(
                labelText: 'Position',
              ),
              onSaved: (newValue) => _emptyCard =
                  _emptyCard.copyWith(position: int.parse(newValue!)),
            ),
            TextFormField(
              controller: _sphereNameController,
              decoration: InputDecoration(
                labelText: 'Sphere Name',
              ),
              onSaved: (value) {
                _emptyCard = _emptyCard.copyWith(sphere_name: value);
              },
            ),
            TextFormField(
              controller: _typeNameController,
              decoration: InputDecoration(
                labelText: 'Type Name',
              ),
              onSaved: (value) {
                _emptyCard = _emptyCard.copyWith(type_name: value);
              },
            ),
            TextFormField(
              controller: _packCodeController,
              decoration: InputDecoration(
                labelText: 'Pack Code',
              ),
              onSaved: (value) {
                _emptyCard = _emptyCard.copyWith(pack_code: value);
              },
            ),
            TextFormField(
              controller: _packNameController,
              decoration: InputDecoration(
                labelText: 'Pack Name',
              ),
              onSaved: (value) {
                _emptyCard = _emptyCard.copyWith(pack_name: value);
              },
            ),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
              onSaved: (value) {
                _emptyCard = _emptyCard.copyWith(name: value);
              },
            ),
            ElevatedButton(
              onPressed: _saveAndEdit,
              child: Text('Save'),
            )
          ],
        ),
      ),
    );
  }
}
