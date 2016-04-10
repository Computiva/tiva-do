update = () ->
	date = document.querySelector "input[name=date]"
	repeat = document.querySelector "div#repeat"
	frequency = repeat.querySelector "div#frequency"
	type = frequency.querySelector "select[name=type]"
	every = frequency.querySelector "div#every"
	weekly = frequency.querySelector "div#weekly"
	monthly = frequency.querySelector "div#monthly"
	if date.value == ""
		repeat.style.display = "none"
	else
		repeat.style.display = "block"
	if repeat.querySelector("input[name=repeat]").checked
		frequency.style.display = "block"
	else
		frequency.style.display = "none"
	if type.value == "every"
		every.style.display = "block"
		weekly.style.display = "none"
		monthly.style.display = "none"
	if type.value == "weekly"
		every.style.display = "none"
		weekly.style.display = "block"
		monthly.style.display = "none"
	if type.value == "monthly"
		every.style.display = "none"
		weekly.style.display = "none"
		monthly.style.display = "block"

window.addEventListener "load", ->
	date = document.querySelector "input[name=date]"
	repeat = document.querySelector "div#repeat"
	frequency = repeat.querySelector "div#frequency"
	date.addEventListener "change", update
	repeat.addEventListener "change", update
	frequency.addEventListener "change", update
	update()
