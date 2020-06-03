package kr.or.redant.cloud;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class cloud{
	Map<String, Object> crawlMap = new HashMap<String, Object>();
	List<Object> crawlList = new ArrayList<Object>();
	
	String URL = "";
	Elements elem = null;
	String str = null;	
	Elements listSelect = null;
	int listSize = 0;

	public Map<String,Object> crawlSelector(String target) throws Exception{
		if(target.equals("side")){
			URL = "https://finance.naver.com/";
			Document doc = Jsoup.connect(URL).get();
			String[] keyArr = {"kospiTitle","kospiNum1","kospiNum2","kospiNum3","kospiImg","kosdaqTitle","kosdaqNum1","kosdaqNum2","kosdaqNum3","kosdaqImg","kospi200Title","kospi200Num1","kospi200Num2","kospi200Num3","kospi200Img","kospiStatus","kosdaqStatus","kospi200Status"};
			String[] valArr = {".kospi_area .heading_area em .blind", ".kospi_area .heading_area .num", ".kospi_area .heading_area .num2", ".kospi_area .heading_area .num3",".kospi_area img",".kosdaq_area .heading_area em .blind", ".kosdaq_area .heading_area .num", ".kosdaq_area .heading_area .num2", ".kosdaq_area .heading_area .num3",".kosdaq_area img",".kospi200_area .heading_area em .blind", ".kospi200_area .heading_area .num", ".kospi200_area .heading_area .num2", ".kospi200_area .heading_area .num3",".kospi200_area img",".kospi_area .heading_area .num_quot > .blind",".kosdaq_area .heading_area .num_quot > .blind",".kospi200_area .heading_area .num_quot > .blind"};
			
			for(int i=0; i<keyArr.length; i++){
				elem = doc.select(valArr[i]);
				
				if(elem.is("img")){
					str = elem.attr("src");
				}else{
					str = elem.text();
				}
				
				crawlMap.put(keyArr[i], str);
			}
			
			crawlList.clear();
			listSelect = doc.select(".aside_popular tbody tr");
			listSize = listSelect.size();
			Elements elem1 = null;
			String str1 = null;
			Element elem2 = null;
			String str2 = null;
			Element elem3 = null;
			String str3 = null;
			String str4 = null;
			
			for(int i=0; i < listSize; i++){
				elem1 = listSelect.get(i).select("th a");
				str1 = elem1.text();
				
				elem2 = listSelect.get(i).select("td").get(0);
				str2 = elem2.text();
				
				elem3 = listSelect.get(i).select("td").get(1);
				str3 = elem3.text();
				
				str4 = listSelect.get(i).attr("class");
				
				Map<String, Object> tempMap = new HashMap<String, Object>();
				tempMap.put("stockName", str1);
				tempMap.put("stockNum1", str2);
				tempMap.put("stockNum2", str3);
				tempMap.put("stockStatus", str4);
				crawlList.add(tempMap);
			}
			crawlMap.put("stockList",crawlList);
		}
		
		if(target.equals("main")){
			URL = "https://finance.naver.com/";
			Document doc = Jsoup.connect(URL).get();
			String[] keyArr = {"homeTitle","homeTime"};
			String[] valArr = {".home .h_market",".home .article .section_stock_market .group_heading .ly_realtime #time"};
			
			for(int i=0; i<keyArr.length; i++){
				elem = doc.select(valArr[i]);
				str = elem.text();
				crawlMap.put(keyArr[i], str);
			}
		}
		return crawlMap;
	}
}

