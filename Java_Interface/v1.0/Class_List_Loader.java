//package org.JavaInterface;

import javax.swing.*;
import java.awt.event.*;
import java.awt.*;
import javax.script.*;
import java.io.*;
import org.jruby.*;
import org.jruby.util.*;

public class Class_List_Loader 
{
	String classList[] = new String[1];
	Object rubyArray = new Object();
	
	public Class_List_Loader()
	{
		ScriptEngineManager mgr = new ScriptEngineManager();
		ScriptEngine rbEngine = mgr.getEngineByExtension("rb");
		File tempFile = new File(".");
		String filePath = tempFile.getAbsoluteFile().getParent().replace('\\','/');
		
		//JOptionPane.showMessageDialog(null, "load_classes(\"" + filePath + "\")");
		
		try
		{
			rbEngine.eval(new BufferedReader(new FileReader("List_Loader.rb")));
			rubyArray = rbEngine.eval("load_classes(\"" + filePath.trim() + "\")");
		}
		catch (Exception d)
		{
			JOptionPane.showMessageDialog(null, "Exception:  " + d.toString());
		}
	}
	
	public Class_List_Loader(Object[] sources)
	{
		ScriptEngineManager mgr = new ScriptEngineManager();
		ScriptEngine rbEngine = mgr.getEngineByExtension("rb");
		File tempFile = new File(".");
		String filePath = tempFile.getAbsoluteFile().getParent().replace('\\','/');
		
		String sourceList = "";
		
		/*for (i = 0; i < sources.length; i++)
		{
			source
		}*/
		
		try
		{
			rbEngine.eval(new BufferedReader(new FileReader("List_Loader.rb")));
			rubyArray = rbEngine.eval("load_classes(\"" + filePath.trim() + "\"," + sources + " )");
		}
		catch (Exception d)
		{
			JOptionPane.showMessageDialog(null, d.toString());
		}
	}
	
	public String[] getClasses()
	{
		classList = rubyArray.toString().split(";");
		
		return classList;
	}
}