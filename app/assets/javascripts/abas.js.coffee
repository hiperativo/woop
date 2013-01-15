$ ->
	$("[data-filter]").click -> 
		$(".nav-tabs li").removeClass "active"
		$(this).addClass "active"

		selected_category = $(this).attr "data-filter"
		selected_category_items = $("[data-filtered='#{selected_category}']")

		console.log selected_category_items, "[data-filtered='#{selected_category}']"
		
		$("[data-filtered]").show()

		unless selected_category == "Todas"
			$("[data-filtered]").not(selected_category_items).hide()

	if window.location.hash
		$("[data-filter='#{window.location.hash.split("#")[1]}']").click()
	else 
		$(".nav-tabs li").first().click()