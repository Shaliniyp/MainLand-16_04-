package org.pk.hotel.dao;

import java.util.ArrayList;

import org.pk.hotel.beans.Category;
import org.pk.hotel.beans.Item;
import org.pk.hotel.beans.OrderDetails;
import org.pk.hotel.beans.OrderMaster;

public class CookServices {
	DBConnect dbconnect = new DBConnect();

	public ArrayList<Category> getAllCategorys() {
		return dbconnect.getAllCategory();
	}

	public ArrayList<OrderMaster> getAllOrders() {
		return dbconnect.getAllOrders();
	}

	public ArrayList<Item> viewAllItems() {
		return dbconnect.viewAllItems();
	}
	
	public ArrayList<OrderDetails> getAllItems(int orderId) {
		return dbconnect.getAllItems(orderId);
	}

	public boolean isAlreadyExists(String name) {
		return dbconnect.isAlreadyExists(name);
	}

	public boolean addCategory(String name) {
		return dbconnect.addCategory(name);
	}
	
	public boolean deleteAnItem(String name) {
		return dbconnect.deleteAnItem(name);
	}
	public boolean clear() {
		return dbconnect.clear();
	}

	public boolean isItemAlreadyExists(String itemName) {
		return dbconnect.isItemAlreadyExists(itemName);
	}

	public boolean addItem(Item item) {
		return dbconnect.addItem(item);
	}

	public boolean updateOrderStatus(int orderId, String status) {
		return dbconnect.updateOrderStatus(orderId, status);
	}

	public boolean updateItemStatus(int orderId, int itemId, String status) {
		return dbconnect.updateItemStatus(orderId, itemId, status);
	}

	public boolean addOrder(OrderMaster orderMaster) {
		return dbconnect.addOrder(orderMaster);
	}

	public int getLastOrderId() {
		return dbconnect.getLastOrderId();
	}

	public boolean addOrderedItems(ArrayList<OrderDetails> orderDetails) {
		return dbconnect.addOrderedItems(orderDetails);
	}

}
