$ ->
	$(".nav-tabs li").click -> 
		$(".nav-tabs li").removeClass "active"
		$(this).addClass "active"
		selected_category = $(this).attr "data-filter"
		selected_category_items = $("[data-linha='#{selected_category}']")
		console.log "[data-linha='#{$(this).attr "data-filter"}']"
		$(".sublinha").show()
		unless selected_category == "Todas" then $(".sublinha").not(selected_category_items).hide()

	if window.location.hash
		$("[data-filter='#{window.location.hash.split("#")[1]}']").click()
	else 
		$(".nav-tabs li").first().click()