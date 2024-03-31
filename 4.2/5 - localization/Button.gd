extends Button

var next_language_index: int = 1
var languages: Array[String] = ["en", "es"]

func _on_button_up():
	change_language(languages[next_language_index])
	next_language_index = (next_language_index + 1) % languages.size()
	pass # Replace with function body.

func change_language(lang: String) -> void:
	TranslationServer.set_locale(lang)
	# change the font
	pass
