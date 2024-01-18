package jclass.dao;

import java.sql.Connection; 
import java.sql. PreparedStatement; 
import java.sql.ResultSet;
import java.util.*;
import jclass.model.*;
public class roomdao {

		private Connection con; 
		private String query;
		private PreparedStatement pst;
		private ResultSet rs;
		public roomdao (Connection con) 
		{ 
			this.con = con;
		}
	
		public List<room> getAllrooms()
		{
			List<room>  rooms= new ArrayList<room>();
			try {
			query= "select * from room";
			pst = this.con.prepareStatement (query);
			rs = pst.executeQuery();
			while(rs.next()) {
				room room1 = new room();
		        room1.setRoomId(rs.getInt("room_id"));
		        room1.setRoomName(rs.getString("room_name"));
		        room1.setImgLink(rs.getString("imglink"));
		        room1.setPrice(rs.getInt("price"));
		        room1.setArea(rs.getDouble("area"));
		        room1.setFeatures(rs.getString("features"));
		        room1.setTotalOccupants(rs.getInt("total_occupants"));
		        room1.setNoOfOccupants(rs.getInt("no_of_occupants"));
		        room1.setDescription(rs.getString("description"));
		        room1.setcatagory(rs.getInt("catagory"));
		        room1.setStatus(rs.getString("status"));
		        
		        rooms.add(room1);
			}
			
			
			}
			catch(Exception e) {
			e.printStackTrace();
			}
			return rooms;
			}
			

	
}

