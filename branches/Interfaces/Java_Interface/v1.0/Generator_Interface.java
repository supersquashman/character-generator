//package org.JavaInterface;

import javax.swing.*;
import java.awt.event.*;
import java.awt.*;
import javax.script.*;

public class Generator_Interface extends JFrame
{
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
		
		Class_Panel classes = new Class_Panel();
		JScrollPane classScroller = new JScrollPane(classes);
		String sources[] = {"PHB","MM1"};
		Race_Panel races = new Race_Panel();
		JScrollPane raceScroller = new JScrollPane(races);
		
		Container contentPane = getContentPane();
		
		contentPane.add(classScroller, BorderLayout.PAGE_START);
		contentPane.add(raceScroller, BorderLayout.CENTER);
		
		setVisible(true);
	}
}