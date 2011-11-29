//package org.JavaInterface;

import javax.swing.*;
import java.awt.event.*;
import java.awt.*;
import javax.script.*;
import javax.swing.event.*;

public class Level_Panel extends JPanel implements ActionListener
{
	JRadioButton rdbLow, rdbLMid, rdbHMid, rdbHigh, rdbCust, rdbClass, rdbECL, rdbCR;
	JTextField txtFrom, txtTo;
	int selectedTab = 0;
	
	public Level_Panel()
	{
		setLayout(new BoxLayout(this, BoxLayout.PAGE_AXIS));
		//setBorder(BorderFactory.createLineBorder(Color.BLACK));
		setBorder(BorderFactory.createEtchedBorder());
		add(getLevelTypePanel());
		add(getLevelRangePanel());
	}
	
	public JPanel getLevelRangePanel()
	{
		JPanel pnlLevel = new JPanel();
		JPanel pnlRow1 = new JPanel();
		JPanel pnlRow2 = new JPanel();
		
		//pnlLevel.setBorder(BorderFactory.createEtchedBorder());
		pnlLevel.setLayout(new BoxLayout(pnlLevel, BoxLayout.PAGE_AXIS));
		//pnlRow1.setLayout(new BoxLayout(pnlRow1, BoxLayout.PAGE_AXIS));
		pnlRow1.setLayout(new GridLayout(3,2));
		pnlRow2.setLayout(new BoxLayout(pnlRow2, BoxLayout.LINE_AXIS));
		
		rdbLow = new JRadioButton("Low (1 - 5)", true);
		rdbLMid = new JRadioButton("Low-Mid (6-10)");
		rdbHMid = new JRadioButton("High-Mid (10-15)");
		rdbHigh = new JRadioButton("High (16-20)");
		rdbCust = new JRadioButton("Custom Range");
		
		rdbLow.addActionListener(this);
		rdbLMid.addActionListener(this);
		rdbHMid.addActionListener(this);
		rdbHigh.addActionListener(this);
		rdbCust.addActionListener(this);
		
		rdbLow.setActionCommand("1");
		rdbLMid.setActionCommand("2");
		rdbHMid.setActionCommand("3");
		rdbHigh.setActionCommand("4");
		rdbCust.setActionCommand("5");
		
		ButtonGroup btng = new ButtonGroup();
		btng.add(rdbLow);
		btng.add(rdbLMid);
		btng.add(rdbHMid);
		btng.add(rdbHigh);
		btng.add(rdbCust);
		
		JLabel lblFrom = new JLabel("From:  ");
		JLabel lblTo = new JLabel("To:  ");
		
		txtFrom = new JTextField();
		txtTo = new JTextField();
		
		txtFrom.setPreferredSize(new Dimension(40,25));
		txtFrom.setMaximumSize(new Dimension(40,25));
		txtFrom.setEditable(false);
		
		txtTo.setPreferredSize(new Dimension(40,25));
		txtTo.setMaximumSize(new Dimension(40,25));
		txtTo.setEditable(false);
		
		pnlRow1.add(rdbLow);
		pnlRow1.add(rdbLMid);
		pnlRow1.add(rdbHMid);
		pnlRow1.add(rdbHigh);
		pnlRow1.add(rdbCust);
		
		pnlRow2.add(lblFrom);
		pnlRow2.add(txtFrom);
		pnlRow2.add(Box.createRigidArea(new Dimension(5,5)));
		pnlRow2.add(lblTo);
		pnlRow2.add(txtTo);
		
		pnlRow1.add(pnlRow2);
		pnlLevel.add(pnlRow1);
		//pnlLevel.add(pnlRow2);
		
		return pnlLevel;
	}
	
	public JPanel getLevelTypePanel()
	{
		JPanel pnlType = new JPanel();
		
		pnlType.setLayout(new GridLayout(1,4));
		//pnlType.setBorder(BorderFactory.createEtchedBorder());
		
		rdbClass = new JRadioButton("Levels", true);
		rdbECL = new JRadioButton("ECL");
		rdbCR = new JRadioButton("CR");
		
		ButtonGroup btngType = new ButtonGroup();
		btngType.add(rdbClass);
		btngType.add(rdbECL);
		btngType.add(rdbCR);
		
		pnlType.add(rdbClass);
		pnlType.add(rdbECL);
		pnlType.add(rdbCR);
		
		return pnlType;
	}
	
	public String getRange()
	{
		String range = "";
		int option = 0;
		int from = -1, to = -1;
		
		return range;
	}

	public void actionPerformed (ActionEvent e)
	{
		int option = Integer.parseInt(e.getActionCommand());
		
		if (option==1)
		{
			txtFrom.setEditable(false);
			txtTo.setEditable(false);
		}
		else if (option==2)
		{
			txtFrom.setEditable(false);
			txtTo.setEditable(false);
		}
		else if (option==3)
		{
			txtFrom.setEditable(false);
			txtTo.setEditable(false);
		}
		else if (option==4)
		{
			txtFrom.setEditable(false);
			txtTo.setEditable(false);
		}
		else if (option==5)
		{
			txtFrom.setEditable(true);
			txtTo.setEditable(true);
		}
	}
}