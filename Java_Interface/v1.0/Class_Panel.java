//package org.JavaInterface;

import javax.swing.*;
import java.awt.event.*;
import java.awt.*;
import javax.script.*;

public class Class_Panel extends JPanel
{
	String classes[] = new String[0];
	JCheckBox controls[] = new JCheckBox[0];
	
	public Class_Panel()
	{
		setLayout(new BoxLayout(this, BoxLayout.PAGE_AXIS));
		Class_List_Loader loader = new Class_List_Loader();
		classes = loader.getClasses();
		drawControls();
	}
	
	public Class_Panel(String[] sources)
	{
		setLayout(new BoxLayout(this, BoxLayout.PAGE_AXIS));
		Class_List_Loader loader = new Class_List_Loader(sources);
		classes = loader.getClasses();
		drawControls();
	}
	
	public JPanel getPanel()
	{
		
		Class_List_Loader loader = new Class_List_Loader();
		String classes[] = loader.getClasses();
		JPanel classPanel = new JPanel();
		
		return classPanel;
	}
	
	private void drawControls()
	{
		controls = new JCheckBox[classes.length];
		
		for (int i = 0; i < controls.length; i++)
		{
			controls[i] = new JCheckBox(classes[i], false);
			addControls(controls[i]);
		}
	}
	
	private void addControls(JComponent control)
	{
		JPanel pnlTemp = new JPanel();
		pnlTemp.setLayout(new BoxLayout(pnlTemp, BoxLayout.LINE_AXIS));
		pnlTemp.add(control);
		add(pnlTemp);
	}
	
	
}