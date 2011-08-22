//package org.JavaInterface;

import javax.swing.*;
import java.awt.event.*;
import java.awt.*;
import javax.script.*;
import java.io.*;
import org.jruby.*;
import org.jruby.util.*;
import org.jruby.RubyArray;

public class Class_List_Loader 
{
	Object classList = new Object();//[1];
	
	public Class_List_Loader()
	{
		ScriptEngineManager mgr = new ScriptEngineManager();
		ScriptEngine rbEngine = mgr.getEngineByExtension("rb");
		RubyArray something;
		File tempFile = new File(".");
		String filePath = tempFile.getAbsoluteFile().getParent().replace('\\','/');
		
		JOptionPane.showMessageDialog(null, "load_classes(\"" + filePath + "\")");
		
		try
		{
			rbEngine.eval(new BufferedReader(new FileReader("List_Loader.rb")));
			classList = rbEngine.eval("load_classes(\"" + filePath.trim() + "\")");
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
		
		String sourceList = "";
		
		/*for (i = 0; i < sources.length; i++)
		{
			source
		}*/
		
		try
		{
			rbEngine.eval(new BufferedReader(new FileReader("List_Loader.rb")));
			classList = rbEngine.eval("load_classes(" + sources + " )");
		}
		catch (Exception d)
		{
			JOptionPane.showMessageDialog(null, d.toString());
		}
	}
	
	public static void main(String[] args)
	{
		String sources[] = {"PHB"};
		Class_List_Loader blargh = new Class_List_Loader();
		//blargh.test();
	}
	
	public void test()
	{
		String classes = "";
		
		//Class_List_Loader test = new Class_List_Loader();
		
		/*for (int i = 0; i < classList.length; i++)
		{
			classes += classList[i] + ", ";
		}*/
		
		
		
		JOptionPane.showMessageDialog(null, classList);
	}
}