//package org.JavaInterface;

import javax.swing.*;
import java.awt.event.*;
import java.awt.*;
import javax.script.*;

public class Specifics_Panel extends JPanel implements ActionListener
{
	Level_Panel pnlLevel;
	JTextField txtCharCount;
	
	public Specifics_Panel()
	{
		setLayout(new BoxLayout(this, BoxLayout.PAGE_AXIS));
		setPreferredSize(new Dimension(250,250));
		
		JLabel lblCharCount = new JLabel("Number of Characters:  ");
		txtCharCount = new JTextField(1);
		
		txtCharCount.setPreferredSize(new Dimension(40,25));
		txtCharCount.setMaximumSize(new Dimension(40,25));
		
		pnlLevel = new Level_Panel();
		
		JPanel pnlRow1 = new JPanel();
		JPanel pnlRow2 = new JPanel();
				
		setLayout(new BoxLayout(this, BoxLayout.PAGE_AXIS));
		pnlRow1.setLayout(new BoxLayout(pnlRow1, BoxLayout.LINE_AXIS));
		pnlRow2.setLayout(new BoxLayout(pnlRow2, BoxLayout.LINE_AXIS));
		
		pnlRow1.add(lblCharCount);
		pnlRow1.add(Box.createRigidArea(new Dimension(5,5)));
		pnlRow1.add(txtCharCount);
		pnlRow1.add(Box.createRigidArea(new Dimension(60,15)));
		pnlRow2.add(pnlLevel);
		add(pnlRow1);
		add(pnlRow2);
	}
	
	public String getSpecifics()
	{
		String specifics = "";
		String levelRange = "";
		
		//JOptionPane.showMessageDialog(null, "Specfics Panel");
		
		int charCount = -1;
		
		try
		{
			charCount = Integer.parseInt(txtCharCount.getText());
			if (charCount > -1)
			{
				specifics += Integer.toString(charCount)+";";
			}
			else
			{
				specifics = "error";
			}
			levelRange = pnlLevel.getRange();
		}
		catch (Exception e)
		{
			specifics = "error";
		}
		
		return specifics;
	}

	public void actionPerformed (ActionEvent e)
	{
		
	}
}