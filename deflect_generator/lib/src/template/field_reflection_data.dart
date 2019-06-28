class FieldReflectionData {
  int _classId;

  int _modifiers;

  int _fieldNameId;

  int _fieldTypeId;

  int _fieldAccessorId;

  int _isEnumConstant;

  int _isSynthetic;

  FieldReflectionData(
    this._classId,
    this._modifiers,
    this._fieldNameId,
    this._fieldTypeId,
    this._fieldAccessorId,
    this._isEnumConstant,
    this._isSynthetic,
  );

  List toJson() => {
        1: _classId,
        2: _modifiers,
        3: _fieldNameId,
        4: _fieldTypeId,
        5: _fieldAccessorId,
        6: _isEnumConstant,
        7: _isSynthetic,
      }.values.toList();
}
