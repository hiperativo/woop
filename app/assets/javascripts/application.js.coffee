#= require jquery
#= require jquery_ujs
#= require easing
#= require cycle
#= require infieldlabel.js
#= require swfobject
#= require fancybox
#= require bootstrap

$ ->
	$(".slider").css "opacity", "0"
	$(window).load -> 
		$(".slider").animate {opacity: 1}, 800
		$(".slider").height $("conteudo").outerHeight()

	do $(window).load

	# Menu
	$(".menu li").mouseenter ->
		$(".menu li").not($(this)).not(".logo").not("ativo").stop(true, true).animate {opacity: 0.3}, 120
		$(this).not("ativo").stop(true, true).animate {opacity: 1}, 400, "easeOutBounce"

	$(".topo").mouseleave ->
		$(".menu li").stop(true, true).animate {opacity: 1}

	# Abas
	$(".abas li").click ->
		$(".abas li").removeClass 	"ativa"
		$(this).addClass			"ativa"

		$(".conteudo-aba").hide()
		$(".conteudo-aba").eq($(this).index()).fadeIn 200

	$(".abas li.ativa").click()

	# Slider

	$(".slider > *").each ->
		$(this).css
			backgroundImage: "url('/assets/#{$(this).attr "class"}.jpg')"
				
	if $(".slider > *").size() > 0
		$(".slider").cycle
			fx:			"scrollHorz"
			prev:		".anterior"
			next:		".proximo"
			easing:		"easeInOutCubic"
			timeout:	5000

	# Controles do slider
	$(".slider-next").hover ->
		$(this).stop(true, true).animate {right: "-10px"}
	, ->
		$(this).animate {right: "0px"}

	$(".slider-prev").hover ->
		$(this).stop(true, true).animate {left: "-10px"}
	, -> 
		$(this).animate {left: "0px"}

	$(".slider-next").click -> $(".slider").cycle "next"
	$(".slider-prev").click -> $(".slider").cycle "prev"

	# Mapa
	$(".lista-de-estados li").click ->
		estado = $(this).text()
		preposicao_estado = switch estado
			when "Roraima", "Minas Gerais", "São Paulo" then "em"
			when "Paraíba", "Bahia" then "na" 
			else "no"

		$(".info-distribuidores p").remove()
		$("<p>Entre em contato pelo telefone +55(11)4362-2630</p>").prependTo(".info-distribuidores")
		$(".box-mapa").slideUp 200, ->
			$(".info-distribuidores").slideDown()

	$(".voltar-mapa").click ->
		$(".info-distribuidores").slideUp 200, ->
			$(".box-mapa").slideDown()

	$(".lista-de-estados li").hover ->
		$(".lista-de-estados li").stop(true, true).animate {opacity: "0.2"}
		$(this).stop(true, true).animate {paddingLeft: "10px", opacity: "1"}, 120
	, ->
		$(this).stop(true, true).animate {paddingLeft: "0px"}

	$(".lista-de-estados").mouseleave ->
		$(".lista-de-estados li").stop(true, true).animate {opacity: "1"}

	# Labels
	$("label").inFieldLabels
		fadeOpacity: 	0.3
		fadeDuration: 	150

	# Videos
	video_codes = [
		"ZEoZj_qFNNE"
		"Mo8WCNshRBE"
		"eOI2Av74l4M"
	]

	load_youtube = (video_code) ->
		swfobject.embedSWF "http://www.youtube.com/v/#{video_code}", "main-video", 854, 480, "9"
	
	load_youtube video_codes[0]

	videos = ""
	for video_code in video_codes
		videos += "<li data-code='#{video_code}'><img src='http://i2.ytimg.com/vi/#{video_code}/default.jpg' width='86' /></li>"

	$(".videos").append(videos)

	$(".videos li").click ->
		load_youtube $(this).attr("data-code")

	.hover ->
		$(this).stop(true, true).animate {opacity: 0.3}, 130
	, ->
		$(this).stop(true, true).animate {opacity: 1}, 130


	# Links da página inicial - parte inferior
	$(".linhas-de-produtos a").hover ->
		$(".linhas-de-produtos li").not($(this).parent()).stop(true, true).animate { opacity: 0.2 }, 380
		$(this).stop(true, true).animate { marginTop: "15px" }, 180
	, ->
		$(".linhas-de-produtos li").not($(this)).stop(true, true).animate { opacity: 1 }, 380
		$(this).stop(true, true).animate { marginTop: "0px" }, 200

	.click ->

	# Internet Explorer fixes
	if $.browser.msie and $.browser.version < 8
		$(".abas li:first-child").css
			marginLeft: "0px"

		$(".midias-sociais").not(".hovers").remove()
		$(".hovers").css {opacity: 1}

	# Midias sociais glows

	$(".midias-sociais-buttons img").hover -> 
		midia = $(this).attr "data-midia"
		$(this).attr "src", "/assets/hover-#{midia}-icon.png"

	, ->	
		midia = $(this).attr "data-midia"
		$(this).attr "src", "/assets/#{midia}-icon.png"

	# Tooltip
	$.fn.tooltip = (texto) ->
		$(this).hover ->
			$("<div class='tooltip'><img src='/assets/tip.png' height='20'>#{texto}</div>").appendTo("body").hide().css 
				left: $(this).offset()["left"] + 40
				top: $(this).offset()["top"] - 40
			.fadeIn(150)
		, ->
			$(".tooltip").fadeOut 150, ->
				$(this).remove()

	$("[tooltip]").each ->
		$(this).tooltip $(this).attr("tooltip")

	# -- como funciona o menu lateral

	$(".menu-lateral li").click ->
		$(".conteudo-menu.ativo").removeClass("ativo").stop(true, true).hide()
		$(".conteudo-menu").eq($(this).index()).addClass("ativo").stop(true, true).fadeIn 250
		$(window).scrollTop(310)
	
	# -- como iniciar ele

	$(".conteudo-menu").hide()
	$(".conteudo-menu").first().show().addClass("ativo")

#	$("[data-link]").css({cursor: pointer}).click ->
#		window.location = $(this).attr("data-link")#

	$(".preview").fancybox
		'transitionIn': 	'elastic'
		'transitionOut': 	'elastic'
		'easingIn':			'easeOutElastic'
		'easingOut':		'easeInOutQuad'
		'speedIn': 			600
		'speedOut': 		100
		'overlayShow': 		true

	$("form").submit ->
		window.campos_errados = 0
		$("input, select, textarea").not("#contato_telefone").each ->
			$(this).css "background-color", "#817FA5"
			if $(this).val() == ""
				window.campos_errados++
				$(this).css "background-color", "red"

		if window.campos_errados > 0
			alert "Por favor preencha o(s) #{window.campos_errados} campos sinalizados."
			false
		else
			alert "Sua mensagem foi enviada com sucesso."

	# Galeria
	$(".categorias-da-galeria li").click -> 
		$(".categorias-da-galeria li").removeClass "active"
		$(this).addClass "active"

	$(".categorias-da-galeria li").first().click()





