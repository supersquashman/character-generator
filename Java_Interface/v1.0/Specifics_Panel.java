//package org.JavaInterface;

import javax.swing.*;
import java.awt.event.*;
import java.awt.*;
import javax.script.*;

public class Specifics_Panel extends JPanel implements ActionListener
{
	Level_Panel pnlLevel;
	
	public Specifics_Panel()
	{
		setPreferredSize(new Dimension(75,75));
		
		JLabel lblCharCount = new JLabel("Number of Characters:  ");
		JTextField txtCharCount = new JTextField(1);
		
		pnlLevel = new Level_Panel();
		
		JPanel pnlRow1 = new JPanel();
				
		setLayout(new BoxLayout(this, BoxLayout.PAGE_AXIS));
		pnlRow1.setLayout(new BoxLayout(pnlRow1, BoxLayout.LINE_AXIS));
		
		pnlRow1.add(lblCharCount);
		pnlRow1.add(Box.createRigidArea(new Dimension(5,5)));
		pnlRow1.add(txtCharCount);
		add(pnlRow1);
		add(pnlLevel);
	}

	public void actionPerformed (ActionEvent e)
	{
		
	}
}