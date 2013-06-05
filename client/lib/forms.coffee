# Process form values scoped to a particular form
# Originally created so I didn't have to keep calling valByName with the $context argument. Set $context once, then use it automatically.
class @FormProcessor
  constructor: (@$context = undefined) ->

  # Wrapper for getting form field value (<input> and <select>)
  # For checkboxes, use @checkboxStateByName
  valByName: (fieldName) ->
    $("[name=\"#{fieldName}\"]", @$context).val();

  # Wrapper for getting an array of values from a multi-value form element (checkboxes)
  #
  # Don't include the [] when passing fieldName
  selectedCheckboxValues: (fieldName) ->
    values = []
    $("[name=\"#{fieldName}\\[\\]\"]:checked", @$context).each((index) ->
      $elem = $(@)
      values.push $elem.attr('value')
    )
    values

  # Wrapper for getting form checkbox state
  checkboxStateByName: (fieldName, $context = undefined) ->
    $("[name=\"#{fieldName}\"]", @$context).is(':checked');

  elementByName: (fieldName) ->
    $("[name=\"#{fieldName}\"]", @$context);
