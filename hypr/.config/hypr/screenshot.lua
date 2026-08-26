hl.bind(
	"Print",
	hl.dsp.exec_cmd([[grim -g "$(slurp -d)" - | wl-copy]]),
	{
		description = "Screenshot region to clipboard",
	}
)
