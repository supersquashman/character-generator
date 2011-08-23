//package org.JavaInterface;

import javax.swing.*;
import java.awt.event.*;
import java.awt.*;
import javax.script.*;

public class Class_Panel extends JPanel implements ActionListener
{
	String classes[] = new String[0];
	JCheckBox controls[] = new JCheckBox[0];
	JCheckBox selectAll = new JCheckBox("Any", true);
	List selection = new List();
	
	public Class_Panel()
	{
		setLayout(new BoxLayout(this, BoxLayout.PAGE_AXIS));
		Class_List_Loader loader = new Class_List_Loader();
		classes = loader.getClasses();
		addControls(selectAll);
		drawControls();
	}
	
	public Class_Panel(String[] sources)
	{
		setLayout(new BoxLayout(this, BoxLayout.PAGE_AXIS));
		Class_List_Loader loader = new Class_List_Loader(sources);
		classes = loader.getClasses();
		addControls(selectAll);
		drawControls();
	}
	
	public JPanel getPanel()
	{
		
		Class_List_Loader loader = new Class_List_Loader();
		String classes[] = loader.getClasses();
		JPanel classPanel = new JPanel();
		
		return classPanel;
	}
	
	public List getSelection()
	{
		selection = new List();
		if (!selectAll.isSelected())
		{
			for (int i = 0; i < controls.length; i++)
			{
				if (controls[i].isSelected())
				{
					selection.add(controls[i].getText());
				}
			}
		}
		else
		{
			for (int i = 0; i < classes.length; i++)
			{
				selection.add(classes[i]);
			}
		}
		
		return selection;
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
	
	public void actionPerformed(ActionEvent e)
	{
		
	}
}