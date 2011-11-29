//package org.JavaInterface;

import javax.swing.*;
import java.awt.event.*;
import java.awt.*;
import javax.script.*;
import javax.swing.event.*;

public class Level_Panel extends JTabbedPane implements ActionListener, ChangeListener
{
	JRadioButton rdbLowClass, rdbLMidClass, rdbHMidClass, rdbHighClass, rdbCustClass, rdbLowECL, rdbLMidECL, rdbHMidECL, rdbHighECL, rdbCustECL, rdbLowCR, rdbLMidCR, rdbHMidCR, rdbHighCR, rdbCustCR;
	JTextField txtFromClass, txtToClass, txtFromECL, txtToECL, txtFromCR, txtToCR;
	int selectedTab = 0;
	
	public Level_Panel()
	{
		/*JComponent panel1 = makeTextPanel("Panel #1");
		tabbedPane.addTab("Tab 1", icon, panel1,"Does nothing");
		tabbedPane.setMnemonicAt(0, KeyEvent.VK_1);
		
		JComponent panel2 = makeTextPanel("Panel #2");
		tabbedPane.addTab("Tab 2", icon, panel2,
		                  "Does twice as much nothing");
		tabbedPane.setMnemonicAt(1, KeyEvent.VK_2);*/
		
		//setLayout(new GridLayout(1,4));
		//addControls(selectAll);
		//drawControls();
		
		addTab("Level Range", null, getClassLevelPanel(), "Select character level based on class levels.");
		addTab("ECL Range", null, getECLPanel(), "Select character level based on effective character level.");
		addTab("CR Range", null, getCRPanel(), "Select character level based on challenge rating.");
		addChangeListener(this);
	}
	
	public JPanel getClassLevelPanel()
	{
		JPanel pnlLevel = new JPanel();
		JPanel pnlRow1 = new JPanel();
		JPanel pnlRow2 = new JPanel();
		
		pnlLevel.setLayout(new BoxLayout(pnlLevel, BoxLayout.PAGE_AXIS));
		//pnlRow1.setLayout(new BoxLayout(pnlRow1, BoxLayout.PAGE_AXIS));
		pnlRow1.setLayout(new GridLayout(3,2));
		pnlRow2.setLayout(new BoxLayout(pnlRow2, BoxLayout.LINE_AXIS));
		
		rdbLowClass = new JRadioButton("Low (1 - 5)", true);
		rdbLMidClass = new JRadioButton("Low-Mid (6-10)");
		rdbHMidClass = new JRadioButton("High-Mid (10-15)");
		rdbHighClass = new JRadioButton("High (16-20)");
		rdbCustClass = new JRadioButton("Custom Range");
		
		rdbLowClass.addActionListener(this);
		rdbLMidClass.addActionListener(this);
		rdbHMidClass.addActionListener(this);
		rdbHighClass.addActionListener(this);
		rdbCustClass.addActionListener(this);
		
		rdbLowClass.setActionCommand("0");
		rdbLMidClass.setActionCommand("1");
		rdbHMidClass.setActionCommand("2");
		rdbHighClass.setActionCommand("3");
		rdbCustClass.setActionCommand("4");
		
		ButtonGroup btngClass = new ButtonGroup();
		btngClass.add(rdbLowClass);
		btngClass.add(rdbLMidClass);
		btngClass.add(rdbHMidClass);
		btngClass.add(rdbHighClass);
		btngClass.add(rdbCustClass);
		
		JLabel lblFrom = new JLabel("From:  ");
		JLabel lblTo = new JLabel("To:  ");
		
		txtFromClass = new JTextField();
		txtToClass = new JTextField();
		
		txtFromClass.setPreferredSize(new Dimension(40,25));
		txtFromClass.setMaximumSize(new Dimension(40,25));
		txtFromClass.setEditable(false);
		
		txtToClass.setPreferredSize(new Dimension(40,25));
		txtToClass.setMaximumSize(new Dimension(40,25));
		txtToClass.setEditable(false);
		
		pnlRow1.add(rdbLowClass);
		pnlRow1.add(rdbLMidClass);
		pnlRow1.add(rdbHMidClass);
		pnlRow1.add(rdbHighClass);
		pnlRow1.add(rdbCustClass);
		
		pnlRow2.add(lblFrom);
		pnlRow2.add(txtFromClass);
		pnlRow2.add(Box.createRigidArea(new Dimension(5,5)));
		pnlRow2.add(lblTo);
		pnlRow2.add(txtToClass);
		
		pnlRow1.add(pnlRow2);
		pnlLevel.add(pnlRow1);
		//pnlLevel.add(pnlRow2);
		
		return pnlLevel;
	}
	
	public JPanel getECLPanel()
	{
		JPanel pnlLevel = new JPanel();
		JPanel pnlRow1 = new JPanel();
		JPanel pnlRow2 = new JPanel();
		
		pnlLevel.setLayout(new BoxLayout(pnlLevel, BoxLayout.PAGE_AXIS));
		//pnlRow1.setLayout(new BoxLayout(pnlRow1, BoxLayout.PAGE_AXIS));
		pnlRow1.setLayout(new GridLayout(3,2));
		pnlRow2.setLayout(new BoxLayout(pnlRow2, BoxLayout.LINE_AXIS));
		
		rdbLowECL = new JRadioButton("Low (1 - 5)", true);
		rdbLMidECL = new JRadioButton("Low-Mid (6-10)");
		rdbHMidECL = new JRadioButton("High-Mid (10-15)");
		rdbHighECL = new JRadioButton("High (16-20)");
		rdbCustECL = new JRadioButton("Custom Range");
		
		rdbLowECL.addActionListener(this);
		rdbLMidECL.addActionListener(this);
		rdbHMidECL.addActionListener(this);
		rdbHighECL.addActionListener(this);
		rdbCustECL.addActionListener(this);
		
		rdbLowECL.setActionCommand("5");
		rdbLMidECL.setActionCommand("6");
		rdbHMidECL.setActionCommand("7");
		rdbHighECL.setActionCommand("8");
		rdbCustECL.setActionCommand("9");
		
		ButtonGroup btngECL = new ButtonGroup();
		btngECL.add(rdbLowECL);
		btngECL.add(rdbLMidECL);
		btngECL.add(rdbHMidECL);
		btngECL.add(rdbHighECL);
		btngECL.add(rdbCustECL);
		
		JLabel lblFrom = new JLabel("From:  ");
		JLabel lblTo = new JLabel("To:  ");
		
		txtFromECL = new JTextField();
		txtToECL = new JTextField();
		
		txtFromECL.setPreferredSize(new Dimension(40,25));
		txtFromECL.setMaximumSize(new Dimension(40,25));
		txtFromECL.setEditable(false);
		
		txtToECL.setPreferredSize(new Dimension(40,25));
		txtToECL.setMaximumSize(new Dimension(40,25));
		txtToECL.setEditable(false);
		
		pnlRow1.add(rdbLowECL);
		pnlRow1.add(rdbLMidECL);
		pnlRow1.add(rdbHMidECL);
		pnlRow1.add(rdbHighECL);
		pnlRow1.add(rdbCustECL);
		
		pnlRow2.add(lblFrom);
		pnlRow2.add(txtFromECL);
		pnlRow2.add(Box.createRigidArea(new Dimension(5,5)));
		pnlRow2.add(lblTo);
		pnlRow2.add(txtToECL);
		
		pnlRow1.add(pnlRow2);
		pnlLevel.add(pnlRow1);
		
		return pnlLevel;
	}
	
	public JPanel getCRPanel()
	{
		JPanel pnlLevel = new JPanel();
		JPanel pnlRow1 = new JPanel();
		JPanel pnlRow2 = new JPanel();
		
		pnlLevel.setLayout(new BoxLayout(pnlLevel, BoxLayout.PAGE_AXIS));
		//pnlRow1.setLayout(new BoxLayout(pnlRow1, BoxLayout.PAGE_AXIS));
		pnlRow1.setLayout(new GridLayout(3,2));
		pnlRow2.setLayout(new BoxLayout(pnlRow2, BoxLayout.LINE_AXIS));
		
		rdbLowCR = new JRadioButton("Low (1 - 5)", true);
		rdbLMidCR = new JRadioButton("Low-Mid (6-10)");
		rdbHMidCR = new JRadioButton("High-Mid (10-15)");
		rdbHighCR = new JRadioButton("High (16-20)");
		rdbCustCR = new JRadioButton("Custom Range");
		
		rdbLowCR.addActionListener(this);
		rdbLMidCR.addActionListener(this);
		rdbHMidCR.addActionListener(this);
		rdbHighCR.addActionListener(this);
		rdbCustCR.addActionListener(this);
		
		rdbLowCR.setActionCommand("10");
		rdbLMidCR.setActionCommand("11");
		rdbHMidCR.setActionCommand("12");
		rdbHighCR.setActionCommand("13");
		rdbCustCR.setActionCommand("14");
		
		ButtonGroup btngCR = new ButtonGroup();
		btngCR.add(rdbLowCR);
		btngCR.add(rdbLMidCR);
		btngCR.add(rdbHMidCR);
		btngCR.add(rdbHighCR);
		btngCR.add(rdbCustCR);
		
		JLabel lblFrom = new JLabel("From:  ");
		JLabel lblTo = new JLabel("To:  ");
		
		txtFromCR = new JTextField();
		txtToCR = new JTextField();
		
		txtFromCR.setPreferredSize(new Dimension(40,25));
		txtFromCR.setMaximumSize(new Dimension(40,25));
		txtFromCR.setEditable(false);
		
		txtToCR.setPreferredSize(new Dimension(40,25));
		txtToCR.setMaximumSize(new Dimension(40,25));
		txtToCR.setEditable(false);
		
		pnlRow1.add(rdbLowCR);
		pnlRow1.add(rdbLMidCR);
		pnlRow1.add(rdbHMidCR);
		pnlRow1.add(rdbHighCR);
		pnlRow1.add(rdbCustCR);
		
		pnlRow2.add(lblFrom);
		pnlRow2.add(txtFromCR);
		pnlRow2.add(Box.createRigidArea(new Dimension(5,5)));
		pnlRow2.add(lblTo);
		pnlRow2.add(txtToCR);
		
		pnlRow1.add(pnlRow2);
		pnlLevel.add(pnlRow1);
		
		return pnlLevel;
	}
	
	public String getRange()
	{
		String range = "";
		int index = getSelectedIndex();
		int option = 0;
		int from = -1, to = -1;
		
		return range;
	}

	public void actionPerformed (ActionEvent e)
	{
		int option = Integer.parseInt(e.getActionCommand());
		
		if (option==0)
		{
			txtFromClass.setEditable(false);
			txtToClass.setEditable(false);
		}
		else if (option==1)
		{
			txtFromClass.setEditable(false);
			txtToClass.setEditable(false);
		}
		else if (option==2)
		{
			txtFromClass.setEditable(false);
			txtToClass.setEditable(false);
		}
		else if (option==3)
		{
			txtFromClass.setEditable(false);
			txtToClass.setEditable(false);
		}
		else if (option==4)
		{
			txtFromClass.setEditable(true);
			txtToClass.setEditable(true);
		}
		else if (option==5)
		{
			txtFromECL.setEditable(false);
			txtToECL.setEditable(false);
		}
		else if (option==6)
		{
			txtFromECL.setEditable(false);
			txtToECL.setEditable(false);
		}
		else if (option==7)
		{
			txtFromECL.setEditable(false);
			txtToECL.setEditable(false);
		}
		else if (option==8)
		{
			txtFromECL.setEditable(false);
			txtToECL.setEditable(false);
		}
		else if (option==9)
		{
			txtFromECL.setEditable(true);
			txtToECL.setEditable(true);
		}
		else if (option==10)
		{
			txtFromCR.setEditable(false);
			txtToCR.setEditable(false);
		}
		else if (option==11)
		{
			txtFromCR.setEditable(false);
			txtToCR.setEditable(false);
		}
		else if (option==12)
		{
			txtFromCR.setEditable(false);
			txtToCR.setEditable(false);
		}
		else if (option==13)
		{
			txtFromCR.setEditable(false);
			txtToCR.setEditable(false);
		}
		else if (option==14)
		{
			txtFromCR.setEditable(true);
			txtToCR.setEditable(true);
		}
	}
	
	public void stateChanged(ChangeEvent e)
	{
		int selectedTab = getSelectedIndex();
		
		JOptionPane.showMessageDialog(null, selectedTab);
	}
}