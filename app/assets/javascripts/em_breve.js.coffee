$ ->
#	Função para centralizar elementos
	$.fn.position = ->
		diff = 
			x: $(window).width() - $(this).width()
			y: $(window).height() - $(this).height()

		$(this).css
			left: diff.x/2
			top: diff.y/2

#	Centralizar quando abrir o site ou aumentar a janela
	$(window).resize ->
		$(".intro").position()
		$(".preloader").position()
		$(".main").position()

#	Detectar se suporta <video>
	if $.browser.msie
		if $.browser.version >= 9
			video_compatible = true	
		else
			video_compatible = false
	else
		video_compatible = true

#	Descomentar a linha abaixo caso queira desativar totalmente a intro
#	video_compatible = false
			
#	Caso não suporte, remover certos elementos
	if not video_compatible
		$(".intro").remove()
		$(".preloader").remove()

#	Ao iniciar, posicionar e ocultar certos elementos
	if video_compatible
		$(".main").css
			opacity: 0

	$(window).load ->
		$(window).resize()

#	Preloader
	$(".intro").bind 'loadeddata', (e) ->
		$(".preloader").fadeOut()

#	Função para quando acabar o vídeo
	show_main = ->
		$(".main").hide().css
			opacity: 1
		.fadeIn(400)
		# $(".intro").remove()

#	Detecção do andamento do vídeo
	t = 0
	showed_main = false
	$(".intro").bind "timeupdate", (e)->
		t++

		if t > 59 and ($(this)[0].volume - 0.05) > 0
			$(this)[0].volume -= 0.05
		if t > 75 and !showed_main
			showed_main = true
			do show_main
			