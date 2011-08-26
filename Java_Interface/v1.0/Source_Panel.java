//package org.JavaInterface;

import javax.swing.*;
import java.awt.event.*;
import java.awt.*;
import javax.script.*;

public class Source_Panel extends JPanel implements ActionListener
{
	String sources[] = new String[0];
	JCheckBox controls[] = new JCheckBox[0];
	JCheckBox selectAll = new JCheckBox("Any", true);
	List selection = new List();
	
	public Source_Panel()
	{
		setLayout(new BoxLayout(this, BoxLayout.PAGE_AXIS));
		Source_List_Loader loader = new Source_List_Loader();
		sources = loader.getSources();
		addControls(selectAll);
		selectAll.addActionListener(this);
		selectAll.setActionCommand("0");
		drawControls();
	}
	
	public Source_Panel(String[] sources)
	{
		setLayout(new BoxLayout(this, BoxLayout.PAGE_AXIS));
		Source_List_Loader loader = new Source_List_Loader(sources);
		sources = loader.getSources();
		addControls(selectAll);
		selectAll.addActionListener(this);
		selectAll.setActionCommand("0");
		drawControls();
	}
	
	public JPanel getPanel()
	{
		
		Source_List_Loader loader = new Source_List_Loader();
		String sources[] = loader.getSources();
		JPanel sourcePanel = new JPanel();
		
		return sourcePanel;
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
			for (int i = 0; i < sources.length; i++)
			{
				selection.add(sources[i]);
			}
		}
		
		return selection;
	}
	
	private void drawControls()
	{
		controls = new JCheckBox[sources.length];
		
		for (int i = 0; i < controls.length; i++)
		{
			controls[i] = new JCheckBox(sources[i], false);
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