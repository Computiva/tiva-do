window.complete = (element, id) ->
	request = new XMLHttpRequest()
	request.addEventListener "load", ->
		element.parentElement.classList.add "checked"
		element.querySelector("i").classList.remove "fa-square-o"
		element.querySelector("i").classList.add "fa-check-square-o"
		element.onclick = (event) ->
			uncomplete element, id
	request.open "POST", "/do/complete"
	request.send id

uncomplete = (element, id) ->
	request = new XMLHttpRequest()
	request.addEventListener "load", ->
		element.parentElement.classList.remove "checked"
		element.querySelector("i").classList.add "fa-square-o"
		element.querySelector("i").classList.remove "fa-check-square-o"
		element.onclick = (event) ->
			complete element, id
	request.open "POST", "/do/uncomplete"
	request.send id

window.removeTask = (id) ->
	request = new XMLHttpRequest()
	request.addEventListener "load", ->
		location.reload()
	request.open "POST", "/do/remove"
	request.send id
