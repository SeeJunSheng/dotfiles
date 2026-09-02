//@ pragma UseQApplication
//@ pragma IconTheme Adwaita

import Quickshell
import "components" as Components

ShellRoot {
	Variants {
		model: Quickshell.screens
		Components.TopLeftPanel {}
	}

	Variants {
		model: Quickshell.screens
		Components.TopMiddlePanel {}
	}

	Variants {
		model: Quickshell.screens
		Components.TopRightPanel {}
	}

	Variants {
		model: Quickshell.screens
		Components.BottomLeftPanel {}
	}

	Variants {
		model: Quickshell.screens
		Components.BottomMiddlePanel {}
	}

	Variants {
		model: Quickshell.screens
		Components.BottomRightPanel {}
	}

	// Legacy bar kept for later reference:
	// Variants {
	//     model: Quickshell.screens
	//     Components.Bar {}
	// }
}
