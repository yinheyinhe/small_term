package mvc.spring.controller;


import org.apache.commons.io.*;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONArray;
import java.io.File;
import java.io.IOException;
import mvc.spring.controller.*;

public class MainApplication {
	public static void main(String args[]) throws IOException
    {
		SocketClient client = new SocketClient();
		System.out.println(client.readjson());
    }
    

}
