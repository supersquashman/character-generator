//package org.JavaInterface;

import javax.swing.*;
import java.awt.event.*;
import java.awt.*;

public class Controls_Panel extends JPanel
{
	Class_Panel pnlClasses;
	Race_Panel pnlRaces;
	Source_Panel pnlSources;
	Specifics_Panel pnlSpecifics;
	
	public Controls_Panel()
	{
		pnlClasses = new Class_Panel();
		JScrollPane classScroller = new JScrollPane(pnlClasses);
		String sources[] = {"PHB"};
		pnlRaces = new Race_Panel();
		JScrollPane raceScroller = new JScrollPane(pnlRaces);
		pnlSources = new Source_Panel();
		JScrollPane sourceScroller = new JScrollPane(pnlSources);
		pnlSpecifics = new Specifics_Panel();
		
		JPanel pnlRow1 = new JPanel();
		JPanel pnlChkBoxColumn = new JPanel();
		JPanel pnlRow3 = new JPanel();
		
		setLayout(new BoxLayout(this, BoxLayout.PAGE_AXIS));
		pnlRow1.setLayout(new BoxLayout(pnlRow1, BoxLayout.LINE_AXIS));
		pnlChkBoxColumn.setLayout(new BoxLayout(pnlChkBoxColumn, BoxLayout.PAGE_AXIS));
		
		setPreferredSize(new Dimension(200,200));
		pnlRow1.setPreferredSize(new Dimension(100,150));
		
		add(sourceScroller);
		pnlChkBoxColumn.add(raceScroller);
		pnlChkBoxColumn.add(classScroller);
		//pnlRow1.add(Box.createRigidArea(new Dimension(250,100)));
		pnlRow1.add(pnlSpecifics);
		pnlRow1.add(pnlChkBoxColumn);
		add(pnlRow1);
		
	}
	
	public String getRequirements()
	{
		String reqs = "";
		
		//JOptionPane.showMessageDialog(null, "Controls Panel");
		
		String specs = pnlSpecifics.getSpecifics();
		if (!specs.equals("error"))
		{
			reqs += pnlSpecifics.getSpecifics();
		}
		else
		{
			reqs = "Invalid Character Count";
		}
		
		return reqs;
	}
}