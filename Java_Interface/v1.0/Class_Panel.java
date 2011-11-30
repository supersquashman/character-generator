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
		selectAll.addActionListener(this);
		selectAll.setActionCommand("0");
		//setPreferredSize(new Dimension(800,800));
		drawControls();
	}
	
	public Class_Panel(String[] sources)
	{
		setLayout(new BoxLayout(this, BoxLayout.PAGE_AXIS));
		Class_List_Loader loader = new Class_List_Loader(sources);
		classes = loader.getClasses();
		addControls(selectAll);
		selectAll.addActionListener(this);
		selectAll.setActionCommand("0");
		//setPreferredSize(new Dimension(200,200));
		drawControls();
	}
	
	public JPanel getPanel()
	{
		
		Class_List_Loader loader = new Class_List_Loader();
		String classes[] = loader.getClasses();
		JPanel classPanel = new JPanel();
		
		return classPanel;
	}
	
	public String getSelection()
	{
		selection = new List();
		String parsed = "";
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
		
		parsed += selection.getItem(0);
		
		for (int i = 1; i < selection.getItemCount(); i++)
		{
			parsed += "," + selection.getItem(i);
		}
		
		parsed += ";";
		
		return parsed;
	}
	
	private void drawControls()
	{
		controls = new JCheckBox[classes.length];
		
		for (int i = 0; i < controls.length; i++)
		{
			controls[i] = new JCheckBox(classes[i], false);
			addControls(controls[i]);
			controls[i].addActionListener(this);
			controls[i].setActionCommand("1");
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
		int option = Integer.parseInt(e.getActionCommand());
		
		if (option == 0)
		{
			for (int i = 0; i < controls.length; i++)
			{
				controls[i].setSelected(false);
			}
			selectAll.setSelected(true);
		}
		else if (option == 1)
		{
			selectAll.setSelected(false);
		}
	}
}