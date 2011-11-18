//package org.JavaInterface;

import javax.swing.*;
import java.awt.event.*;
import java.awt.*;

public class Controls_Panel extends JPanel
{
	Class_Panel pnlClasses;
	Race_Panel pnlRaces;
	Source_Panel pnlSources;
	
	public Controls_Panel()
	{
		pnlClasses = new Class_Panel();
		JScrollPane classScroller = new JScrollPane(pnlClasses);
		String sources[] = {"PHB"};
		pnlRaces = new Race_Panel();
		JScrollPane raceScroller = new JScrollPane(pnlRaces);
		pnlSources = new Source_Panel();
		JScrollPane sourceScroller = new JScrollPane(pnlSources);
		
		JPanel pnlRow1 = new JPanel();
		JPanel pnlRow2 = new JPanel();
		JPanel pnlRow3 = new JPanel();
		
		setLayout(new BoxLayout(this, BoxLayout.LINE_AXIS));
		pnlRow1.setLayout(new BoxLayout(this, BoxLayout.LINE_AXIS));
		
		setPreferredSize(new Dimension(150,150));
		
		add(sourceScroller);
		add(raceScroller);
		add(classScroller);
		
	}
}