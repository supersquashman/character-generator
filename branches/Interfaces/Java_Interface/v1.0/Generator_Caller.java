//package org.JavaInterface;

import javax.swing.*;
import java.awt.event.*;
import java.awt.*;
import javax.script.*;
import java.io.*;
import org.jruby.*;
import org.jruby.util.*;

public class Generator_Caller
{
	String raceList[] = new String[1];
	Object rubyArray = new Object();
	
	public void generate(String arguments)
	{
		ScriptEngineManager mgr = new ScriptEngineManager();
		ScriptEngine rbEngine = mgr.getEngineByExtension("rb");
		File tempFile = new File(".");
		String filePath = tempFile.getAbsoluteFile().getParent().replace('\\','/');
		
		//JOptionPane.showMessageDialog(null, "load_classes(\"" + filePath + "\")");
		
		try
		{
			rbEngine.eval(new BufferedReader(new FileReader("Generator_Interpreter.rb")));
			rubyArray = rbEngine.eval("generate(\"" + filePath.trim() + "\", \""+ arguments + "\")");
		}
		catch (Exception d)
		{
			JOptionPane.showMessageDialog(null, "Exception:  " + d.toString());
		}
	}
}