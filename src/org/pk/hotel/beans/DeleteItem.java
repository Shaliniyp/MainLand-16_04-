package org.pk.hotel.beans;

public class DeleteItem {

			int id;
			String itemName;
			
			public int getId() {
				return id;
			}
			public void setId(int id) {
				this.id = id;
			}
			public String getitemName() {
				return itemName;
			}
			public void setitemName(String string) {
				this.itemName = string;
			}
			
			@Override
			public String toString()
			{
				return "Item { id="+this.id+", itemName="+this.itemName+" }";
			}
					

}
