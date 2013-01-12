#= require swfobject
#= require jquery
#= require jquery_ujs
#= require easing
#= require cycle
#= require fancybox
#= require bootstrap
#= require abas

$ ->
	submit_via_ajax = -> 
		$(".form-contato").submit ->
			obj = $(this)
			$.post "/envio.json", $(this).serialize(), (fields)-> 
				unless $.isEmptyObject fields
					$(".control-group").removeClass "error"
					$(".help-inline").remove()
					for field_name, error of fields
						field = $("#contato_#{field_name}")
						field.after "<span class='help-inline'>#{error}</span>"
						field.parents(".control-group").addClass "error"
					$(".control-group").not(".error").addClass "success"
				else
					obj.html "<p style='text-align: center'>Seu email foi enviado com sucesso!</p><p style='text-align: center'><a class='btn' data-dismiss='modal' href=''>Fechar</a></p>"

			, "JSON"
			false

	do submit_via_ajax
	$("#contato").on "shown", -> 
		do submit_via_ajax

	$(".preview").fancybox
		'transitionIn': 	'elastic'
		'transitionOut': 	'elastic'
		'easingIn':			'easeOutElastic'
		'easingOut':		'easeInOutQuad'
		'speedIn': 			600
		'speedOut': 		100
		'overlayShow': 		true
		# onComplete: 		submit_via_ajax

	$(".slider").css "opacity", "0"
	$(window).load -> 
		$(".slider").animate {opacity: 1}, 800
		$(".slider").height $("conteudo").outerHeight()

	do $(window).load

	# Menu
	$(".menu li").mouseenter ->
		$(".menu li").not($(this)).not(".logo").not("ativo").stop(true, true).animate {opacity: 0.3}, 120
		$(this).not("ativo").stop(true, true).animate {opacity: 1}, 400, "easeOutBounce"

	$(".topo").mouseleave -> $(".menu li").stop(true, true).animate {opacity: 1}

	# Slider
	$(".slider .slide").each ->
		image = $(this).attr "data-image"
		$(this).css 
			backgroundImage: "url('#{image}')"

		window.slider = $(this)
		window.image = image

	if $(".slider > *").size() > 0
		$(".slider").cycle
			fx:			"scrollHorz"
			prev:		".anterior"
			next:		".proximo"
			easing:		"easeInOutCubic"
			timeout:	7000

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
	$(".linhas-de-produtos li").mouseenter ->
		$(this).css
			opacity: 1
			"-webkit-filter": "blur(0px)"
			"-webkit-transform": "scale(1)"

		$(this).parent().children().not(this).css 
			"-webkit-transform": "scale(0.8)"
			opacity: 0.3
			"-webkit-filter": "blur(2px)"

	.parent().mouseleave ->
		$(this).find("li").css 
			opacity: 1
			"-webkit-filter": "blur(0px)"
			"-webkit-transform": "scale(1)"


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

	# como funciona o menu lateral
	$(".menu-lateral li").click ->
		$(".conteudo-menu.ativo").removeClass("ativo").stop(true, true).hide()
		$(".conteudo-menu").eq($(this).index()).addClass("ativo").stop(true, true).fadeIn 250
		$(window).scrollTop(310)
	
	# como iniciar ele
	$(".conteudo-menu").hide()
	$(".conteudo-menu").first().show().addClass("ativo")
