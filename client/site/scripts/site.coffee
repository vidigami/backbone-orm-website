
$ ->

  types = ['CoffeeScript', 'JavaScript']

  setType = (type='CoffeeScript') ->
    cls = type.toLowerCase()
    $(".example:not(.#{cls})").hide()
    $(".example.#{cls}").show()
    localStorage?.setItem('type', type)
    $('.btn.language-toggle span').text(type)

  type = localStorage?.getItem('type')
  setType(type)

  $('.btn.language-toggle').on 'click', (e) ->
    $span = $(this).find('span')
    to_type = types[Math.abs(types.indexOf($span.text())-1)]
    setType(to_type)

