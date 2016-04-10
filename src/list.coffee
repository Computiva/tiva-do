window.complete = (element, id) ->
	request = new XMLHttpRequest()
	request.addEventListener "load", ->
		element.parentElement.classList.add "checked"
		element.querySelector("div").classList.remove "icon-checkbox-unchecked"
		element.querySelector("div").classList.add "icon-checkbox-checked"
		element.onclick = (event) ->
			uncomplete element, id
	request.open "POST", "/do/complete"
	request.send id

uncomplete = (element, id) ->
	request = new XMLHttpRequest()
	request.addEventListener "load", ->
		element.parentElement.classList.remove "checked"
		element.querySelector("div").classList.remove "icon-checkbox-checked"
		element.querySelector("div").classList.add "icon-checkbox-unchecked"
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
