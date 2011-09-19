# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

set_skin = (skin) ->
  $('div#cabecera').css('background', 'url(' + skin.cabecera + ') no-repeat')
  $('div#principal').css('background', 'url(' + skin.fondo + ') no-repeat')
  $('div#player').css('background', skin.margen)

cambia_skin = (skin_url) ->
  $.get skin_url,
    {}
    (data) -> set_skin(data)
    'json'

$ ->
  $('a.skin').click (event) ->
    event.preventDefault()
    cambia_skin $(this).attr('href')

  $('a.avatar').click (event) ->
    event.preventDefault()
    txt = $('#msg_body').val()
    $('#msg_body').val(txt + $(this).attr('value'))

  $('a#link_avatares').click (event) ->
    event.preventDefault()
    $('div#avatars').toggle()

  $('a.skin.activo:first').trigger('click')

  $( "div#modal" ).dialog ({height: 140, modal: true, autoOpen: false})
