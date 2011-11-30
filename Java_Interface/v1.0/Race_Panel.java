//package org.JavaInterface;

import javax.swing.*;
import java.awt.event.*;
import java.awt.*;
import javax.script.*;

public class Race_Panel extends JPanel implements ActionListener
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
		selectAll.addActionListener(this);
		selectAll.setActionCommand("0");
		drawControls();
	}
	
	public Race_Panel(String[] sources)
	{
		setLayout(new BoxLayout(this, BoxLayout.PAGE_AXIS));
		Race_List_Loader loader = new Race_List_Loader(sources);
		races = loader.getRaces();
		addControls(selectAll);
		selectAll.addActionListener(this);
		selectAll.setActionCommand("0");
		drawControls();
	}
	
	public JPanel getPanel()
	{
		
		Race_List_Loader loader = new Race_List_Loader();
		String races[] = loader.getRaces();
		JPanel racePanel = new JPanel();
		
		return racePanel;
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
			for (int i = 0; i < races.length; i++)
			{
				selection.add(races[i]);
			}
		}
		
		for (int i = 0; i < selection.getItemCount(); i++)
		{
			parsed += selection.getItem(i)+",";
		}
		
		parsed += ";";
		
		return parsed;
	}
	
	private void drawControls()
	{
		controls = new JCheckBox[races.length];
		
		for (int i = 0; i < controls.length; i++)
		{
			controls[i] = new JCheckBox(races[i], false);
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