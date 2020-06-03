package kr.or.redant.daishin.controller;

import java.math.BigInteger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.redant.daishin.CpSysDib.ISysDib;
import kr.or.redant.daishin.cputil.ICpCodeMgr;
import kr.or.redant.daishin.service.IDaishinService;
import kr.or.redant.vo.BusinessDayVO;
import kr.or.redant.vo.DailyPriceVO;
import kr.or.redant.vo.StockItemVO;

@Controller
@RequestMapping("/daishin/")
public class daishinController {
	@Autowired
	private IDaishinService service;
	
	// 코스피 200 종목코드에 따른 dailyprice 테이블 데이터 저장
	@RequestMapping("insertMethod")
	public void insertMethod(DailyPriceVO DaishinInfo, StockItemVO DaishinInfo2) throws Exception{
		
		ICpCodeMgr id1 = kr.or.redant.daishin.cputil.ClassFactory.createCpCodeMgr();
		Object[] a1 = (Object[]) id1.getGroupCodeList(180);
		
		ISysDib id = kr.or.redant.daishin.CpSysDib.ClassFactory.createStockChart();

		for(int k=0;k<a1.length;k++){
			id.setInputValue(0, a1[k].toString());
			
			byte a = '1';
			id.setInputValue(1, a);
			id.setInputValue(2, 20200519);
			id.setInputValue(3, 20150520);
			Object[] ob = {0,2,3,4,5,6,8,12,13,23,37};
			id.setInputValue(5, ob);
			byte d = 'D';
			id.setInputValue(6, d);
			byte c = '1';
			id.setInputValue(9, c);
			
			id.blockRequest();
			
			DaishinInfo.setStock_item_code(id.getHeaderValue(0).toString());
			
			int numData = (int) id.getHeaderValue(3);
			short numField = (short) id.getHeaderValue(1);
			
			System.out.println("종목코드 : " + id.getHeaderValue(0));
			int diff = 0;
			int highPrice = 0;
			BigInteger count = null;
			
			for(int i=0;i<numData;i++){
				for(int j=0;j<numField-1;j++){
					if(j==0){
						System.out.println("일자 : " + id.getDataValue(j, i));
						DaishinInfo.setBs_date(id.getDataValue(j, i).toString());
					}
					if(j==1){
						System.out.println("시가 : " + id.getDataValue(j, i));
						DaishinInfo.setOpen(id.getDataValue(j, i).toString());
					}
					if(j==2){
						System.out.println("고가 : " + id.getDataValue(j, i));
						DaishinInfo.setHigh(id.getDataValue(j, i).toString());
					}
					if(j==3){
						System.out.println("저가 : " + id.getDataValue(j, i));
						DaishinInfo.setLow(id.getDataValue(j, i).toString());
					}
					if(j==4){
						highPrice = (int) id.getDataValue(j, i);
						System.out.println("종가 : " + id.getDataValue(j, i));
						DaishinInfo.setClose(id.getDataValue(j, i).toString());
					}
					if(j==5){
						diff = (int) id.getDataValue(j, i);
						System.out.println("전일비 : " + id.getDataValue(j, i));
						DaishinInfo.setDiff(id.getDataValue(j, i).toString());
					}
					if(j==6){
						System.out.println("거래량 : " + id.getDataValue(j, i));
						DaishinInfo.setVolume(id.getDataValue(j, i).toString());
					}
					if(j==7){
						count = (BigInteger) id.getDataValue(j, i);
					}
					if(j==8){
						BigInteger aaa = (BigInteger) id.getDataValue(j, i);
						System.out.println("계산한 시가총액 : " + count.multiply(BigInteger.valueOf(highPrice)));
						DaishinInfo.setMarcket_cap(count.multiply(BigInteger.valueOf(highPrice)).toString());
					}
					if(j==9){
						System.out.println("등락비율 : " + String.format("%.2f", diff/(highPrice/100.0)));
						DaishinInfo.setFluctuation(String.format("%.2f", diff/(highPrice/100.0)));
					}
				}
				this.service.daishinInsert(DaishinInfo);
			}
		}
		
	}
	
	// 원하는 종목코드에 따른 dailyprice 테이블 데이터 저장
		@RequestMapping("insertMethod2")
		public void insertMethod2(DailyPriceVO DaishinInfo, StockItemVO DaishinInfo2) throws Exception{
			
			ICpCodeMgr id1 = kr.or.redant.daishin.cputil.ClassFactory.createCpCodeMgr();
			Object[] a1 = (Object[]) id1.getGroupCodeList(180);
			
			ISysDib id = kr.or.redant.daishin.CpSysDib.ClassFactory.createStockChart();

			id.setInputValue(0, "A037070");
			
			byte a = '1';
			id.setInputValue(1, a);
			id.setInputValue(2, 20200603);
			id.setInputValue(3, 20150520);
			Object[] ob = {0,2,3,4,5,6,8,12,13,23,37};
			id.setInputValue(5, ob);
			byte d = 'D';
			id.setInputValue(6, d);
			byte c = '1';
			id.setInputValue(9, c);
			
			id.blockRequest();
			
			DaishinInfo.setStock_item_code("A037070");
			
			int numData = (int) id.getHeaderValue(3);
			short numField = (short) id.getHeaderValue(1);
			
			int diff = 0;
			int highPrice = 0;
			BigInteger count = null;
			
			for(int i=0;i<numData;i++){
				for(int j=0;j<numField-1;j++){
					if(j==0){
						System.out.println("일자 : " + id.getDataValue(j, i));
						DaishinInfo.setBs_date(id.getDataValue(j, i).toString());
					}
					if(j==1){
						System.out.println("시가 : " + id.getDataValue(j, i));
						DaishinInfo.setOpen(id.getDataValue(j, i).toString());
					}
					if(j==2){
						System.out.println("고가 : " + id.getDataValue(j, i));
						DaishinInfo.setHigh(id.getDataValue(j, i).toString());
					}
					if(j==3){
						System.out.println("저가 : " + id.getDataValue(j, i));
						DaishinInfo.setLow(id.getDataValue(j, i).toString());
					}
					if(j==4){
						highPrice = (int) id.getDataValue(j, i);
						System.out.println("종가 : " + id.getDataValue(j, i));
						DaishinInfo.setClose(id.getDataValue(j, i).toString());
					}
					if(j==5){
						diff = (int) id.getDataValue(j, i);
						System.out.println("전일비 : " + id.getDataValue(j, i));
						DaishinInfo.setDiff(id.getDataValue(j, i).toString());
					}
					if(j==6){
						System.out.println("거래량 : " + id.getDataValue(j, i));
						DaishinInfo.setVolume(id.getDataValue(j, i).toString());
					}
					if(j==7){
						count = (BigInteger) id.getDataValue(j, i);
					}
					if(j==8){
						BigInteger aaa = (BigInteger) id.getDataValue(j, i);
						System.out.println("계산한 시가총액 : " + count.multiply(BigInteger.valueOf(highPrice)));
						DaishinInfo.setMarcket_cap(count.multiply(BigInteger.valueOf(highPrice)).toString());
					}
					if(j==9){
						System.out.println("등락비율 : " + String.format("%.2f", diff/(highPrice/100.0)));
						DaishinInfo.setFluctuation(String.format("%.2f", diff/(highPrice/100.0)));
					}
				}
				this.service.daishinInsert(DaishinInfo);
			}
		}
	
	// 코스피 200 종목 코드 및 이름 stockitem 테이블 데이터 저장
	@RequestMapping("insertMethodCode")
	public void insertMethodCode(StockItemVO DaishinInfo) throws Exception{
		ICpCodeMgr id = kr.or.redant.daishin.cputil.ClassFactory.createCpCodeMgr();
		Object[] a = (Object[]) id.getGroupCodeList(180);
		
		for(int i=0;i<a.length;i++){
			DaishinInfo.setStock_item_code(a[i].toString());
			DaishinInfo.setStock_item_name(id.codeToName(a[i].toString()));
			this.service.daishinInsertCode(DaishinInfo);
		}
	}
	
	// 원하는 종목 코드 및 이름 stockitem 테이블 데이터 저장
	@RequestMapping("insertMethodCode2")
	public void insertMethodCode2(StockItemVO DaishinInfo) throws Exception{
		DaishinInfo.setStock_item_code("A037070");
		DaishinInfo.setStock_item_name("파세코");
		this.service.daishinInsertCode(DaishinInfo);
	}
	
	// 영업일 stockitem 테이블 데이터 저장
	@RequestMapping("insertDayCode")
	public void insertDayCode(BusinessDayVO DaishinInfo) throws Exception{
		ICpCodeMgr id1 = kr.or.redant.daishin.cputil.ClassFactory.createCpCodeMgr();
		Object[] a1 = (Object[]) id1.getGroupCodeList(180);
		
		ISysDib id = kr.or.redant.daishin.CpSysDib.ClassFactory.createStockChart();

		for(int k=0;k<1;k++){
			id.setInputValue(0, a1[k].toString());
			
			byte a = '1';
			id.setInputValue(1, a);
			id.setInputValue(2, 20200519);
			id.setInputValue(3, 20150520);
			Object[] ob = {0};
			id.setInputValue(5, ob);
			byte d = 'D';
			id.setInputValue(6, d);
			byte c = '1';
			id.setInputValue(9, c);
			
			id.blockRequest();
			
			int numData = (int) id.getHeaderValue(3);
			short numField = (short) id.getHeaderValue(1);
			
			for(int i=0;i<numData;i++){
				for(int j=0;j<numField;j++){
					if(j==0){
						System.out.println("일자 : " + id.getDataValue(j, i));
						DaishinInfo.setBs_date(id.getDataValue(j, i).toString());
					}
				}
				this.service.insertDayCode(DaishinInfo);
			}
		}
		
	}

}
