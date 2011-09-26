# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

carga_conversacion = (elemento) ->
  id = $(":selected", elemento).val()
  $.get "/historials/#{id}/detalle",
    {}
    (resultado) -> 
      $('textarea#conversacion').val('')
      $.each resultado.texto, (index) ->
        elem = $('textarea#conversacion')
        elem.val(elem.val() + resultado.texto[index])


set_skin = (skin) ->
  $('div#cabecera').css('background', 'url(' + skin.cabecera + ') no-repeat')
  $('div#principal').css('background', 'url(' + skin.fondo + ') no-repeat')
  $('div#player').css('background', skin.margen)

cambia_skin = (skin_url) ->
  $.get skin_url,
    {}
    (data) -> set_skin(data)
    'json'

guarda_chat = () ->
  platica = ''
  $('div#chat > li').each ->
    platica += $(this).text() + '\n'
  platica

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

  $( "div#modal" ).dialog ({modal: true, autoOpen: false, height: 'auto', width: 'auto', minHeight: 200, minWidth: 200})
  $( "div#historial" ).dialog ({modal: true, autoOpen: false, height: 'auto', width: 'auto', minHeight: 200, minWidth: 200})

  $('a#historial').click (event) ->
    event.preventDefault()
    $('div#historial').dialog('open')

  $('a#salir').click (event) ->
    event.preventDefault()
    $.post '/historial/guardar',
      platica: guarda_chat()
      () -> window.location.href = $(this).attr('href')

  $('#historial_id').change -> carga_conversacion(this)
