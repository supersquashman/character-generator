//package org.JavaInterface;

import javax.swing.*;
import java.awt.event.*;
import java.awt.*;
import javax.script.*;

public class Generator_Interface extends JFrame implements ActionListener
{
	Class_Panel pnlClasses;
	
	public static void main(String[] args)
	{
		new Generator_Interface().drawInterface();
	}
	
	private void drawInterface()
	{
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setSize(500, 600);
		Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
		int screenX = (screenSize.width - getWidth())/2;
		int screenY = (screenSize.height - getHeight())/2;
		setLocation(screenX, screenY);
		setTitle("D&D 3.5 Character Generator");
		
		pnlClasses = new Class_Panel();
		JScrollPane classScroller = new JScrollPane(pnlClasses);
		String sources[] = {"PHB","MM1"};
		Race_Panel pnlRaces = new Race_Panel();
		JScrollPane raceScroller = new JScrollPane(pnlRaces);
		Source_Panel pnlSources = new Source_Panel();
		JScrollPane sourceScroller = new JScrollPane(pnlSources);
		
		Container contentPane = getContentPane();
		
		contentPane.add(classScroller, BorderLayout.PAGE_START);
		contentPane.add(raceScroller, BorderLayout.CENTER);
		contentPane.add(sourceScroller, BorderLayout.CENTER);
		
		JButton btnTest = new JButton("Test");
		contentPane.add(btnTest, BorderLayout.PAGE_END);
		btnTest.addActionListener(this);
		
		setVisible(true);
	}
	
	public void actionPerformed(ActionEvent e)
	{
		JOptionPane.showMessageDialog(null, pnlClasses.getSelection());
	}
}