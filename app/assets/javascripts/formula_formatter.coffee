@FormulaFormatter = class
  constructor: (@tree, @search_pattern) ->

  run: ->
    MQ = MathQuill.getInterface(2);
    @tree.find(@search_pattern).each (index, elem) ->
      text = elem.text || elem.innerText
      if !text
        return # skip if cant get contents of an element

      formula_start_pos = text.trim().indexOf('$');
      formula_end_pos   = text.trim().indexOf('$', formula_start_pos + 1);

      if formula_start_pos == -1 || formula_end_pos == -1
        return # skip if no math formula pattern was found

      left_part  = text.trim().substring(0, formula_start_pos);
      formula    = text.trim().substring(formula_start_pos + 1, formula_end_pos);
      right_part = text.trim().substring(formula_end_pos + 1, text.trim().length);

      if elem.text
        elem.text = ''

      if elem.innerText
        elem.innerText = ''

      mathFieldSpan = $('<span>' + formula + '</span>');
      mathField     = MQ.MathField(mathFieldSpan[0]);
      $('<span>' + left_part + '</span>').appendTo(elem);
      mathFieldSpan.appendTo(elem);
      $('<span>' + right_part + '</span>').appendTo(elem);
