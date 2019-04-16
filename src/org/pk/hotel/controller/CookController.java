package org.pk.hotel.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.pk.hotel.beans.Item;
import org.pk.hotel.beans.OrderDetails;
import org.pk.hotel.beans.OrderMaster;
import org.pk.hotel.constants.GlobalConstants;
import org.pk.hotel.dao.CookServices;

public class CookController extends BaseController {

	private static final long serialVersionUID = -4843668254577645314L;
	CookServices cService = new CookServices();

	public void doPost(HttpServletRequest request, HttpServletResponse response) {
		String action = request.getParameter("action");
		doPostAction(action, request, response);

	}

	public void doPostAction(String action, HttpServletRequest request, HttpServletResponse response) {
		try {
			String contextPath = request.getContextPath() + "/";
			if (action.equals("addCategory")) {
				String name = request.getParameter("cate");
				if (!cService.isAlreadyExists(name)) {
					if (cService.addCategory(name)) {
						GlobalConstants.MESSAGE = String.format(GlobalConstants.MSG_ADD_SUCCESS, name);
					} else {
						GlobalConstants.MESSAGE = String.format(GlobalConstants.ERROR_ADD, name);
					}
				} else {
					GlobalConstants.MESSAGE = String.format(GlobalConstants.ERROR_CAT_ALREADY, name);
				}
				GlobalConstants.JSP_PAGE = contextPath + "AddCategory.jsp";
				response.sendRedirect(GlobalConstants.JSP_PAGE);

			} else if (action.equals("addItem")) {
				Item item = new Item(request.getParameter("itemName"),
						Integer.parseInt(request.getParameter("categoryId")),
						Integer.parseInt(request.getParameter("qnt")), request.getParameter("cost"));

				System.out.println(item);
				if (!cService.isItemAlreadyExists(item.getItemName())) {
					if (cService.addItem(item)) {
						GlobalConstants.MESSAGE = String.format(GlobalConstants.MSG_ADD_SUCCESS, item);
					} else {
						GlobalConstants.MESSAGE = String.format(GlobalConstants.ERROR_ADD, item);
					}
				} else {
					GlobalConstants.MESSAGE = String.format(GlobalConstants.ERROR_CAT_ALREADY, item);
				}
				GlobalConstants.JSP_PAGE = contextPath + "AddItem.jsp";
				response.sendRedirect(GlobalConstants.JSP_PAGE);
			}

			else if (action.equals("deleteAnItem")) {
				
				String name = request.getParameter("name");
				
				if(cService.deleteAnItem(name)) {
					response.sendRedirect("Alert.jsp");
				}
				else {
					response.sendRedirect("Error.jsp");
					
				}
//					if () {
//						GlobalConstants.MESSAGE = String.format(GlobalConstants.MSG_DELETE_SUCCESS);
//					} else {
//						GlobalConstants.MESSAGE = String.format(GlobalConstants.ERROR_DELETE);
//					}
//			
//				GlobalConstants.JSP_PAGE = contextPath + "UserHome.jsp";
				//response.sendRedirect("Alert.jsp");
			} 

			else if (action.equals("viewAllItems")) {
				int id = Integer.parseInt(request.getParameter("id"));
				@SuppressWarnings("unused")
				String name = request.getParameter("name");
				if (true) {
					/*if (cService.deleteAnItem(name) {
						GlobalConstants.MESSAGE = String.format(GlobalConstants.MSG_DELETE_SUCCESS, id);
					} else {
						GlobalConstants.MESSAGE = String.format(GlobalConstants.ERROR_DELETE, id);
					}*/
				} // else {
					// GlobalConstants.MESSAGE =String.format(GlobalConstants.ERROR_CAT_ALREADY,
					// id);

				GlobalConstants.JSP_PAGE = contextPath + "ViewAllItems.jsp";
				response.sendRedirect(GlobalConstants.JSP_PAGE);
			}

//			else if (action.equals("clear")) {
//				String delivered = request.getParameter("cl");
//				System.out.println("Delivered: "+delivered);
//					if (cService.clear()) {
//						System.out.println("If loop");
//						GlobalConstants.MESSAGE = String.format(GlobalConstants.MSG_CLEAR_SUCCESS);
//						GlobalConstants.JSP_PAGE = contextPath + "Clear.jsp";
//						response.sendRedirect(GlobalConstants.JSP_PAGE);
//						
//					} else {
//						
//						GlobalConstants.MESSAGE = String.format(GlobalConstants.ERROR_CLEARING);
//						
//					}
//				
//				
//				
//			} 
			else if (action.equals("clear")) {
				String name = request.getParameter("cl");
				if (cService.clear()) {
					response.sendRedirect("Alert.jsp");
					} else {
						response.sendRedirect("Error.jsp");
					
				}
				
				
			}
			else if (action.equals("updateOStatus")) {

				int orderId = Integer.parseInt(request.getParameter("orderId"));
				String status = request.getParameter("status");
				System.out.println("id = " + orderId + "  status =" + status);
				if (cService.updateOrderStatus(orderId, status)) {
					GlobalConstants.MESSAGE = GlobalConstants.MSG_UPDATE_SUCCESS;
				} else {
					GlobalConstants.MESSAGE = GlobalConstants.ERROR_UPDATE;
				}
				GlobalConstants.JSP_PAGE = contextPath + "ViewOrder.jsp";
				response.sendRedirect(GlobalConstants.JSP_PAGE);
			} else if (action.equals("updateItemtatus")) {
				int orderId = Integer.parseInt(request.getParameter("orderId"));
				int itemId = Integer.parseInt(request.getParameter("itemId"));
				String status = request.getParameter("status");
				System.out.println("id = " + orderId + " ItemId = " + itemId + " status =" + status);
				if (cService.updateItemStatus(orderId, itemId, status)) {
					GlobalConstants.MESSAGE = GlobalConstants.MSG_UPDATE_SUCCESS;
				} else {
					GlobalConstants.MESSAGE = GlobalConstants.ERROR_UPDATE;
				}
				GlobalConstants.JSP_PAGE = contextPath + "ViewOrder.jsp";
				response.sendRedirect(GlobalConstants.JSP_PAGE);

			} else if (action.equals("makeOrder")) {
				
				System.out.println("In Make order");
				String[] itemId = request.getParameterValues("ItemId");
				String qnt[] = request.getParameterValues("orderQnt");

				int catId = Integer.parseInt(request.getParameter("catId"));
				String orderName = request.getParameter("orderName");
				int tableNo = Integer.parseInt(request.getParameter("tableNo"));
				String status = request.getParameter("status");

				OrderMaster orderMaster = new OrderMaster();
				orderMaster.setOrderName(orderName);
				orderMaster.setOrderStat(OrderMaster.getOrderStat(status));
				orderMaster.setTableNo(tableNo);

				if (itemId != null && qnt != null) {
					if (cService.addOrder(orderMaster)) {
						int orderId = cService.getLastOrderId();

						ArrayList<OrderDetails> orderDetails = new ArrayList<OrderDetails>();

						int j=0;
						for(int i=0;i<qnt.length;i++)
						{
							System.out.println("Not null quantity: "+orderId);
							if(!qnt[i].isEmpty()) {
								OrderDetails od = new OrderDetails();
								od.setOrderId(orderId);
								od.setItemQnt(Integer.parseInt(qnt[i]));
								od.setItemId(Integer.parseInt(itemId[j]));
								od.setOrderStat(OrderDetails.getOrderStat(OrderDetails.OrderStatus.STARTED.name()));
								orderDetails.add(od);
								System.out.println(od);
								j++;
								System.out.println("J value: "+j);
							}	
							
						}

						if (cService.addOrderedItems(orderDetails)) {
							GlobalConstants.MESSAGE = "Order Placed Successfully";
						} else {
							GlobalConstants.MESSAGE = " Error in Placing the Order";
						}
					} else {
						GlobalConstants.MESSAGE = "Error in Placing the Order";
					}
				} else {
					GlobalConstants.MESSAGE = "Please select a valid order";
				}

				GlobalConstants.JSP_PAGE = contextPath + "ViewItems.jsp?catId=" + catId;
				response.sendRedirect(GlobalConstants.JSP_PAGE);
			}

		} catch (Exception e) {
			System.out.println("Error in CookController - " + e);
		}
	}

}
