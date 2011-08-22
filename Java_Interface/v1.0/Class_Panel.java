package org.JavaInterface;

import javax.swing.*;
import java.awt.event.*;
import java.awt.*;
import javax.script.*;

public class Class_Panel
{
	public JPanel getPanel()
	{
		Array classes = new Class_List_Loader();
		classPanel = new JPanel();
		
		return classPanel;
	}
}