package org.JavaInterface;

import javax.swing.*;
import java.awt.event.*;
import java.awt.*;
import javax.script.*;

public class Class_List_Loader extends Array
{
	public Class_List_Loader()
	{
		ScriptEngineManager mgr = new ScriptEngineManager();
		ScriptEngine rbEngine = mgr.getEngineByExtension("rb");
		
		try
		{
			/*
				 
			*/
			rbEngine.eval(new BufferedReader(new FileReader("List_Loader.rb")));
			//this = rbEngine.eval("get_measure(5, 7, "+ data.getBeatsPerMeasure() +", "+ data.getNoteValue() +", "+ data.getKeySig() +")");
		}
		catch (Exception d)
		{
			JOptionPane.showMessageDialog(null, d.toString());
		}
	}
}