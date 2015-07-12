package de.altimos.fremo.tt

import javax.swing.UIManager
import org.pushingpixels.flamingo.api.ribbon.JRibbonFrame
import org.pushingpixels.flamingo.api.ribbon.RibbonTask

class Editor extends JRibbonFrame {
	def static void main(String[] args) {
		UIManager.setLookAndFeel(UIManager.systemLookAndFeelClassName)
            
		new Editor().run()
	}
	
	new() {
		setBounds(100, 100, 800, 600)
		defaultCloseOperation = EXIT_ON_CLOSE
		
        val task1 = new RibbonTask("One")
        val task2 = new RibbonTask("Two")

        getRibbon().addTask(task1)
        getRibbon().addTask(task2)
	}
	
	def run() {
		visible = true
	}
}