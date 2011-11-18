//package org.JavaInterface;

import javax.swing.*;
import java.awt.event.*;
import java.awt.*;
import javax.script.*;

public class Level_Panel extends JTabbedPane implements ActionListener
{
	public Level_Panel()
	{
		/*JComponent panel1 = makeTextPanel("Panel #1");
		tabbedPane.addTab("Tab 1", icon, panel1,"Does nothing");
		tabbedPane.setMnemonicAt(0, KeyEvent.VK_1);
		
		JComponent panel2 = makeTextPanel("Panel #2");
		tabbedPane.addTab("Tab 2", icon, panel2,
		                  "Does twice as much nothing");
		tabbedPane.setMnemonicAt(1, KeyEvent.VK_2);*/
		
		addTab("Level Range", null, getClassLevelPanel(), "Select character level based on class levels.");
		addTab("ECL Range", null, getECLPanel(), "Select character level based on effective character level.");
		addTab("CR Range", null, getCRPanel(), "Select character level based on challenge rating.");
	}
	
	public JPanel getClassLevelPanel()
	{
		JPanel pnlLevel = new JPanel();
		
		return pnlLevel;
	}
	
	public JPanel getECLPanel()
	{
		JPanel pnlLevel = new JPanel();
		
		return pnlLevel;
	}
	
	public JPanel getCRPanel()
	{
		JPanel pnlLevel = new JPanel();
		
		return pnlLevel;
	}

	public void actionPerformed (ActionEvent e)
	{
		
	}
}