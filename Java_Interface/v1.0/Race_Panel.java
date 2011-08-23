//package org.JavaInterface;

import javax.swing.*;
import java.awt.event.*;
import java.awt.*;
import javax.script.*;

public class Race_Panel extends JPanel
{
	String races[] = new String[0];
	JCheckBox controls[] = new JCheckBox[0];
	JCheckBox selectAll = new JCheckBox("Any", true);
	List selection = new List();
	
	public Race_Panel()
	{
		setLayout(new BoxLayout(this, BoxLayout.PAGE_AXIS));
		Race_List_Loader loader = new Race_List_Loader();
		races = loader.getRaces();
		addControls(selectAll);
		drawControls();
	}
	
	public Race_Panel(String[] sources)
	{
		setLayout(new BoxLayout(this, BoxLayout.PAGE_AXIS));
		Race_List_Loader loader = new Race_List_Loader(sources);
		races = loader.getRaces();
		addControls(selectAll);
		drawControls();
	}
	
	public JPanel getPanel()
	{
		
		Race_List_Loader loader = new Race_List_Loader();
		String races[] = loader.getRaces();
		JPanel racePanel = new JPanel();
		
		return racePanel;
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
			for (int i = 0; i < races.length; i++)
			{
				selection.add(races[i]);
			}
		}
		
		return selection;
	}
	
	private void drawControls()
	{
		controls = new JCheckBox[races.length];
		
		for (int i = 0; i < controls.length; i++)
		{
			controls[i] = new JCheckBox(races[i], false);
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