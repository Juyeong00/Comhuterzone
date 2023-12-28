package db;

import java.util.List;

import db.dao.GoodsDAO;
import db.dto.CateDetailDTO;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		GoodsDAO goods = new GoodsDAO();
		List<CateDetailDTO> deskList = goods.findDesktopList(1);
		
		for(CateDetailDTO cate : deskList) {
			System.out.println(cate.getId());
		}
		
		System.out.println("왜안뜸?");
		CateDetailDTO desk = goods.findDeskById(1);
		System.out.println(desk.getName());
	}

}
